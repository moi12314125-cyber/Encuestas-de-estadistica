-- Supabase -> SQL Editor -> cambia el correo por el tuyo -> Run
-- Permite LEER la tabla solo al usuario administrador (el público sigue pudiendo solo insertar).
grant select on public.respuestas to authenticated;
create policy "admin puede leer" on public.respuestas
  for select to authenticated
  using ((auth.jwt() ->> 'email') = 'adminues12@gmail.com');
