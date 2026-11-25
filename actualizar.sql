-- Para una base de datos que YA tiene la tabla creada: limita la franja a valores válidos.
-- Ejecutar una vez en SQL Editor. Se puede repetir sin error.
alter table public.respuestas drop constraint if exists franja_valida;
alter table public.respuestas add constraint franja_valida
  check (franja is null or franja in ('Mañana','Tarde','Noche'));
