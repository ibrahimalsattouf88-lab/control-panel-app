
import { createClient } from '@supabase/supabase-js';

export default function Home(){
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
  const anon = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || process.env.SUPABASE_ANON_KEY;
  return (
    <main style={{padding:24, fontFamily:'sans-serif'}}>
      <h1>لوحة التحكم - المعاون</h1>
      <p>ارتباط Supabase: {url ? 'OK' : 'مفقود'}</p>
      <ul>
        <li>تحليلات</li>
        <li>جلسات صوت</li>
        <li>المسارات والعبارات</li>
      </ul>
    </main>
  );
}
