// Basit demo projesi
console.log('Nyx Demo Projesi');

// Versiyon bilgisi
const version = 'v2.0.0';
console.log(`Sürüm: ${version}`);

// Yeni özellik: GitHub entegrasyonu
console.log('GitHub entegrasyonu aktif!');

// Tarih ve saat özelliği
function getCurrentDateTime() {
  const now = new Date();
  return `Bugün: ${now.toLocaleDateString()} - Saat: ${now.toLocaleTimeString()}`;
}

console.log(getCurrentDateTime());

function greet(name) {
  return `Merhaba, ${name}!`;
}

console.log(greet('Dünya'));
