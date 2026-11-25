-- Supabase -> SQL Editor -> cambia tucorreo@gmail.com por el correo del administrador -> Run
-- Permite LEER la tabla solo a ese usuario (el público sigue pudiendo solo insertar).
-- Se puede ejecutar varias veces. Compara en minúsculas, así que escríbelo en minúsculas.
grant select on public.respuestas to authenticated;
drop policy if exists "admin puede leer" on public.respuestas;
create policy "admin puede leer" on public.respuestas
  for select to authenticated
  using (lower(auth.jwt() ->> 'email') = 'tucorreo@gmail.com');
