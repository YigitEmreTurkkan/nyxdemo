# Nyx Demo Project

A simple demonstration project using Nyx for version management.

## Setup

This project uses Gradle with the Nyx plugin for automatic versioning.

## Versioning

This project follows semantic versioning principles. Version numbers are automatically generated based on git history and commit messages.

- `feat`: New features trigger a minor version increment
- `fix`: Bug fixes trigger a patch version increment
- `chore`: Maintenance tasks usually trigger a patch version increment
- `BREAKING CHANGE`: Major changes that break compatibility trigger a major version increment

### Java Sürüm Kontrolü

Önce Java sürümünüzü kontrol edin:
```bash
java -version
```

Nyx plugin'i Java 17 veya üstünü gerektiriyor. Java 17 yüklemek için:

```bash
# Ubuntu/Debian için:.
sudo apt update
sudo apt install openjdk-17-jdk

# Fedora/RHEL/CentOS için:
sudo dnf install java-17-openjdk-devel

# Arch Linux için:
sudo pacman -S jdk17-openjdk

# Windows için:
# https://adoptium.net/ adresinden Eclipse Temurin 17 indirilebilir

# macOS için (Homebrew ile)
brew install openjdk@17
```

Java 17'yi yükledikten sonra, sistem değişkenlerini ayarlamak gerekebilir:

```bash
# Java home dizinini ayarlayın (örnek)
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
```

### Gradle Kurulumu

Mevcut Gradle sürümünüz (4.4.1) çok eski ve Nyx plugin'i ile uyumlu değil. Daha güncel bir Gradle sürümü (8.x) kurmak için öncelikle eski Gradle dosyalarını temizleyin:

```bash
# Eski Gradle daemon'larını durdur
gradle --stop

# Gradle wrapper dosyalarını temizle (eğer mevcutsa)
rm -rf .gradle gradlew gradlew.bat gradle/
```

Ardından yeni Gradle'ı kurun:

```bash
# Ubuntu/Debian için SDKMAN kullanarak (önerilen)
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install gradle 8.5

# Veya manuel olarak
wget https://services.gradle.org/distributions/gradle-8.5-bin.zip
unzip gradle-8.5-bin.zip -d /opt
export PATH=$PATH:/opt/gradle-8.5/bin
```

Gradle kurulumunu doğrulamak için:
```bash
gradle -v
```

### Yeni Bir Gradle Projesini Sıfırdan Oluşturma

Mevcut projede oluşabilecek uyumluluk sorunlarını önlemek için, projeyi sıfırdan oluşturalım:

```bash
# Yeni bir dizin oluşturun (opsiyonel)
mkdir -p ~/Belgeler/GitProject/nyx-demo-new
cd ~/Belgeler/GitProject/nyx-demo-new

# Gradle projesini başlat
gradle init --type java-application

# Gradle wrapper'ı oluştur
gradle wrapper
chmod +x ./gradlew
```

### Build Dosyasını Düzenleme

```bash
# build.gradle dosyasını düzenle
nano build.gradle
```

build.gradle dosyasında aşağıdaki içeriği kullanın:

```groovy
plugins {
    id 'java'
    id 'application'
    id 'com.mooltiverse.oss.nyx' version '3.1.3'
}

group = 'com.example'
application {
    mainClass = 'com.example.App'
}

repositories {
    mavenCentral()
    gradlePluginPortal()
}

dependencies {
    testImplementation 'org.junit.jupiter:junit-jupiter-api:5.9.1'
    testRuntimeOnly 'org.junit.jupiter:junit-jupiter-engine:5.9.1'
}

test {
    useJUnitPlatform()
}

// Nyx konfigürasyonu
nyx {
    preset = 'simple'
    initialVersion = '0.1.0'
    releasePrefix = 'v'
    releaseLenient = true
    dryRun = false
    verbosity = 'INFO'
    git {
        // Git konfigürasyonu
    }
}
```

### Bağımlılıkları İndirme

```bash
# Gradle bağımlılıklarını indir
./gradlew --refresh-dependencies

# Gradle wrapper'ı güncelle (opsiyonel)
./gradlew wrapper --gradle-version=7.6
```

## Kullanım

Nyx'i Gradle ile çalıştırmak için: .fd

```bash
# Mevcut durum ve versiyon bilgisini görmek için
./gradlew nyxInfer

# Yeni bir sürüm etiketi oluşturmak için
./gradlew nyxMark

# Release işlemini gerçekleştirmek için
./gradlew nyxPublish

# Temizlik işlemleri için
./gradlew nyxClean
```

## Konfigürasyon

Nyx konfigürasyonu iki şekilde yapılabilir:

1. `.nyx.json` dosyası ile (proje kök dizininde)
2. `build.gradle` dosyasındaki `nyx` bloğu ile

## Git ile Kullanım

Nyx, Git ile kullanıldığında en iyi performansı gösterir. Projenizi Git reposu haline getirmek için:

```bash
git init
git add .
git commit -m "Initial commit"
```

- `nyxClean`: Yerel sürüm eserlerini siler ve sürüm sürecini başlangıç durumuna döndürür
- `nyxInfer`: Git deposundan bilgi toplayarak yeni sürümü belirler ve sürüm eylemlerini planlar
- `nyxMake`: Yapılandırılmış yerel sürüm eserlerini oluşturur
- `nyxMark`: Depoyu etiketleyerek ve commit atarak sürümü işaretler
- `nyxPublish`: Yeni sürümü uzak servislere yayınlar ve bildirimler gönderir
- `release`: Tüm sürüm görevlerini çalıştırır.

## Yeni özellikler eklendi
docker run -it  --entrypoint  sh -v /home/yigitemreturkkan/Belgeler/GitProject/nyx-demo:/project mooltiverse/nyx 

yeni değişiklikler denemek için bu 