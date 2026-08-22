-- ============================================================
-- SETUP SUPABASE - PDF Manager
-- Copiez ce script dans SQL Editor > New query > Run
-- ============================================================

-- 1. Creer la table pdfs
CREATE TABLE IF NOT EXISTS public.pdfs (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT,
  filename TEXT NOT NULL,
  file_path TEXT NOT NULL,
  size BIGINT,
  public_url TEXT NOT NULL,
  uploaded_at TIMESTAMPTZ DEFAULT NOW(),
  views INT DEFAULT 0
);

-- 2. Activer Row Level Security
ALTER TABLE public.pdfs ENABLE ROW LEVEL SECURITY;

-- 3. Creer les policies (tout public pour simplifier)
--    Vous pouvez restreindre plus tard avec l'authentification
DROP POLICY IF EXISTS "Allow all" ON public.pdfs;
CREATE POLICY "Allow all" ON public.pdfs
  FOR ALL USING (true) WITH CHECK (true);

-- 4. Activer la replication en temps reel (optionnel)
ALTER PUBLICATION supabase_realtime ADD TABLE public.pdfs;
