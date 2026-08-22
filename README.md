# PDF Manager - GitHub + Netlify + Supabase

Gestionnaire de PDF complet avec panel d'administration et page publique. 100% gratuit, sans serveur.

---

## Architecture

| Composant | Role |
|-----------|------|
| **Netlify** | Heberge le site statique (frontend) |
| **Supabase** | Base de donnees + stockage des fichiers PDF |
| **GitHub** | Versionning du code |

---

## Etape 1 : Creer un compte Supabase (gratuit)

1. Allez sur [https://supabase.com](https://supabase.com)
2. Cliquez sur **"Start your project"** -> Sign up avec GitHub
3. Creez un **nouveau projet** (nommez-le `pdf-manager`)
4. Attendez que le projet soit pret (~2 min)

---

## Etape 2 : Configurer la base de donnees

1. Dans le dashboard Supabase, allez dans **"SQL Editor"** (menu gauche)
2. Cliquez sur **"New query"**
3. Copiez-collez le contenu du fichier `setup.sql` (a la racine de ce repo)
4. Cliquez sur **"Run"**

Cela cree :
- La table `pdfs`
- Les regles de securite (RLS)

---

## Etape 3 : Creer le bucket de stockage

1. Allez dans **"Storage"** (menu gauche)
2. Cliquez sur **"New bucket"**
3. Nom : `pdfs`
4. Cochez **"Public bucket"**
5. Cliquez sur **"Create bucket"**

---

## Etape 4 : Recuperer les cles d'API

1. Allez dans **"Project Settings"** -> **"API"**
2. Copiez ces 2 valeurs :
   - **Project URL** (ex: `https://xxxxx.supabase.co`)
   - **anon public** API key (commence par `eyJ...`)

---

## Etape 5 : Modifier la configuration

Ouvrez les fichiers suivants et remplacez les placeholders :

### `admin/index.html` (ligne ~25)
```javascript
const SUPABASE_URL = 'https://VOTRE-PROJET.supabase.co';
const SUPABASE_ANON_KEY = 'eyJ...VOTRE-CLE...';
