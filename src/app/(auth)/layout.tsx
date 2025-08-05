import { DarkModeToggle } from "@/components/common/dark-mode-toggle";
import { Coffee } from "lucide-react";
import { ReactNode } from "react";

type AuthLayoutProps = {
  children: ReactNode;
};

export default function AuthLayout({ children }: AuthLayoutProps) {
  return (
    <div className="relative bg-muted flex min-h-svh flex-col items-center justify-center gap-6 p-6 md:p-10">
      <div className="absolute top-4 right-4">
        <DarkModeToggle />
      </div>
      <div className="flex w-full max-w-sm flex-col gap-5">
        <div className="flex items-center gap-2 self-center font-medium">
          <div className="bg-teal-500 flex items-center justify-center p-2 rounded-md">
            <Coffee className="size-4" />
          </div>
          Rama Cafe
        </div>
        {children}
      </div>
    </div>
  );
}
