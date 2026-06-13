import { useEffect, useState } from "react";

export function App() {
  const [message, setMessage] = useState("");

  useEffect(() => {
    void window.electronAPI.ping().then(setMessage);
  }, []);

  return (
    <main className="flex min-h-screen items-center justify-center bg-neutral-950 text-white">
      <p className="text-lg">{message || "Loading..."}</p>
    </main>
  );
}
