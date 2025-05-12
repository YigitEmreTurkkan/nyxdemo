// Basit demo projesi
console.log('Nyx Demo Projesi');

// Versiyon bilgisi
const version = 'v2.0.0'; // Nyx tarafından otomatik güncellenecek
console.log(`Sürüm: ${version}`);

// Yeni özellik: GitHub entegrasyonu
console.log('GitHub entegrasyonu aktif!');

// Tarih ve saat özelliği
function getCurrentDateTime() {
  const now = new Date();
  return `Bugün: ${now.toLocaleDateString()} - Saat: ${now.toLocaleTimeString()}`;
}

console.log(getCurrentDateTime());

// Rastgele renk üreteci (Yeni özellik)
function getRandomColor() {
  const colors = ['kırmızı', 'mavi', 'yeşil', 'sarı', 'mor', 'turuncu'];
  const randomIndex = Math.floor(Math.random() * colors.length);
  return colors[randomIndex];
}

console.log(`Bugünün şanslı rengi: ${getRandomColor()}`);

function greet(name) {
  return `Merhaba, ${name}!`;
}

console.log(greet('Dünya'));
