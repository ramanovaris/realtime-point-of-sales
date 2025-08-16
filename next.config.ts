import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  experimental: {
    serverActions: {
      bodySizeLimit: "10mb",
    },
  },
  devIndicators: false,
  images: {
    domains: ["https://kkumwythaebzrmcmgavt.supabase.co"],
    remotePatterns: [
      {
        protocol: "https",
        hostname: "kkumwythaebzrmcmgavt.supabase.co",
        port: "",
        pathname: "/**",
      },
    ],
  },
};

export default nextConfig;
