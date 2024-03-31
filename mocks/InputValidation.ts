// extracted from https://github.com/hasura/graphql-engine/blob/v2.38.0/frontend/libs/console/legacy-ce/src/lib/components/Services/Data/TablePermissions/InputValidation/InputValidation.tsx

import { z } from 'zod';

export const inputValidationEnabledSchema = z.object({
  enabled: z.literal(true),
  type: z.enum(['http']),
  definition: z.object({
    url: z.union([z.string().url(), z.string().regex(/{{.*}}\/.*/)]),
    forward_client_headers: z.boolean().optional(),
    headers: z
      .array(
        z.object({
          name: z.string(),
          value: z.string(),
          type: z.string(),
        })
      )
      .optional(),
    timeout: z.union([z.number().int().positive().min(1), z.nan()]).optional(),
  }),
});

export const inputValidationSchema = z.discriminatedUnion('enabled', [
  z.object({
    enabled: z.literal(false),
  }),
  inputValidationEnabledSchema,
]);
