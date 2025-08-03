import { DarkModeToggle } from "@/components/common/dark-mode-toggle";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";

export default function Home() {
  return (
    <div>
      <Input />
      <Button className="dark:bg-amber-400">Hello</Button>
      <DarkModeToggle />
    </div>
  );
}
