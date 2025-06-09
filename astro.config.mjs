// @ts-check
import { defineConfig } from 'astro/config';
import tailwindcss from "@tailwindcss/vite";

// https://astro.build/config
export default defineConfig({
  vite: {
    plugins: [tailwindcss()],
  },
  outDir: 'dist',
  site: 'https://serious-people-net.github.io/',
  base: '/',
});
