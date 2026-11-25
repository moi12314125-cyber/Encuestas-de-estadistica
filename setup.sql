-- Supabase → SQL Editor → pegar todo y ejecutar (Run)
create table public.respuestas (
  id            bigint generated always as identity primary key,
  creado        timestamptz not null default now(),
  registro      text check (length(registro) <= 40),
  fecha         date,
  franja        text check (franja in ('Mañana','Tarde','Noche')),
  tipo_usuario  text not null check (tipo_usuario in ('Estudiante','Docente','Administrativo','Externo')),
  tramite       text not null check (length(tramite) <= 200),
  resuelto      text not null check (resuelto in ('Sí','No')),
  espera_min    numeric check (espera_min between 0 and 100000),
  duracion_min  numeric check (duracion_min between 0 and 100000),
  veces         numeric check (veces between 0 and 100000),
  satisfaccion  smallint not null check (satisfaccion between 1 and 5),
  p8_1 smallint check (p8_1 between 1 and 5),
  p8_2 smallint check (p8_2 between 1 and 5),
  p8_3 smallint check (p8_3 between 1 and 5),
  p8_4 smallint check (p8_4 between 1 and 5),
  p8_5 smallint check (p8_5 between 1 and 5),
  p8_6 smallint check (p8_6 between 1 and 5),
  p8_7 smallint check (p8_7 between 1 and 5),
  mejora        text check (length(mejora) <= 2000)
);

-- Seguridad: el público solo puede INSERTAR; nadie sin sesión puede leer, editar ni borrar.
alter table public.respuestas enable row level security;
revoke all on public.respuestas from anon, authenticated;
grant insert on public.respuestas to anon;
create policy "publico puede enviar" on public.respuestas for insert to anon with check (true);
