import { defineCollection, z } from 'astro:content';

const campaigns = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    url: z.string().url(),
    description: z.string().optional(),
    order: z.number().optional(),
    featured: z.boolean().default(false),
  }),
});

export const collections = {
  campaigns,
};
