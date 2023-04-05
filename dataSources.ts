
export const drivers = [
    'postgres',
    'mssql',
    'mysql',
    'bigquery',
    'citus',
    'cockroach',
    'alloy',
] as const;
export type Driver = (typeof drivers)[number];
