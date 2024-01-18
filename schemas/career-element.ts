import { z } from 'zod'

const BaseCareerElement = z.object({
  elementType: z.never(),
})

export const Skill = BaseCareerElement.extend({
  elementType: z.literal('skill'),
  skill: z.string(),
})

export type Skill = z.infer<typeof Skill>
