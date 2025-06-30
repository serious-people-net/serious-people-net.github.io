import { defineCollection, z } from 'astro:content';

const campaigns = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    url: z.string().url(),
    description: z.string().optional(),
    publishedAt: z.coerce.date(), // This will convert string dates to Date objects
    featured: z.boolean().default(true),
  }),
});

export const collections = {
  campaigns,
};
