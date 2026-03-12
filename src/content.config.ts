import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const campaigns = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/campaigns' }),
  schema: z.object({
    title: z.string(),
    url: z.string().url(),
    description: z.string().optional(),
    publishedAt: z.coerce.date(),
    featured: z.boolean().default(true),
  }),
});

export const collections = {
  campaigns,
};
