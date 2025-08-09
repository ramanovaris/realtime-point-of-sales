import { DarkModeToggle } from "@/components/common/dark-mode-toggle";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import Link from "next/link";

export default function Home() {
  return (
    <div className="bg-muted space-y-4 flex flex-col items-center justify-center h-screen">
      <h1 className="font-semibold text-4xl">Welcome Rama Novaris</h1>
      <Link href={"/admin"}>
        <Button className="bg-teal-500 text-white">Access Dashboard</Button>
      </Link>
    </div>
  );
}
