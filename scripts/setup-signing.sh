#!/usr/bin/env bash
set -euo pipefail

IDENTITY="Electron Forge Template Local Signing"

if security find-identity -p basic -v | grep -q "$IDENTITY"; then
  echo "Identity '$IDENTITY' already exists."
  exit 0
fi

echo "Creating self-signed code-signing identity '$IDENTITY'..."

# Create a self-signed certificate (valid 10 years) in the login keychain
security create-keychain -p temp temp.keychain 2>/dev/null || true
security unlock-keychain -p temp temp.keychain
security default-keychain -s temp.keychain

# Generate the code-signing certificate
cat > /tmp/cs-req.csr <<EOF
[Req]
distinguished_name = req_distinguished_name
prompt = no
x509_extensions = v3_req

[req_distinguished_name]
CN=$IDENTITY

[v3_req]
basicConstraints=critical,CA:FALSE
keyUsage=critical,digitalSignature
extendedKeyUsage=codeSigning
EOF

openssl req -new -newkey rsa:2048 -nodes -keyout /tmp/cs-key.pem -out /tmp/cs-req.pem -config /tmp/cs-req.csr 2>/dev/null
openssl x509 -req -days 3650 -in /tmp/cs-req.pem -signkey /tmp/cs-key.pem -out /tmp/cs-cert.pem 2>/dev/null

security import /tmp/cs-cert.pem -k temp.keychain
security import /tmp/cs-key.pem -k temp.keychain

# Set the identity as trusted (macOS may still show a dialog)
security add-trusted-cert -d -r trustRoot -k temp.keychain /tmp/cs-cert.pem 2>/dev/null || true

security default-keychain -s login.keychain
security delete-keychain temp.keychain 2>/dev/null || true

rm -f /tmp/cs-req.csr /tmp/cs-req.pem /tmp/cs-key.pem /tmp/cs-cert.pem
echo "Created identity '$IDENTITY'."
