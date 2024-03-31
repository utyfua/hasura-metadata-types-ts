
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

export const driverToLabel: Record<Driver, string> = {
  postgres: 'PostgreSQL',
  mysql: 'MySQL',
  mssql: 'MS SQL Server',
  bigquery: 'BigQuery',
  citus: 'Citus',
  cockroach: 'CockroachDB',
  alloy: 'AlloyDB',
};
