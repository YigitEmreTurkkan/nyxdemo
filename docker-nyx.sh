#!/bin/bash

# Nyx Docker komutlarını kolaylaştırmak için script
PROJECT_DIR=$(pwd)

case "$1" in
  "shell")
    # Docker konteynerde shell açar
    docker run -it --entrypoint sh -v "$PROJECT_DIR:/project" mooltiverse/nyx
    ;;
  "release")
    # Release oluşturur
    docker run -it -v "$PROJECT_DIR:/project" mooltiverse/nyx release
    ;;
  "info")
    # Versiyon bilgilerini gösterir
    docker run -it -v "$PROJECT_DIR:/project" mooltiverse/nyx info
    ;;
  "infer")
    # Bir sonraki versiyonu tahmin eder
    docker run -it -v "$PROJECT_DIR:/project" mooltiverse/nyx infer-version
    ;;
  "plan")
    # Release planını gösterir
    docker run -it -v "$PROJECT_DIR:/project" mooltiverse/nyx plan
    ;;
  "publish")
    # Release oluşturur ve yayınlar
    docker run -it -v "$PROJECT_DIR:/project" mooltiverse/nyx publish
    ;;
  *)
    echo "Kullanım: ./docker-nyx.sh [komut]"
    echo ""
    echo "Kullanılabilir komutlar:"
    echo "  shell    - Docker konteynerde interaktif shell açar"
    echo "  release  - Yeni sürüm oluşturur"
    echo "  info     - Sürüm bilgilerini gösterir"
    echo "  infer    - Bir sonraki sürümü tahmin eder"
    echo "  plan     - Sürüm planını gösterir"
    echo "  publish  - Sürüm oluşturur ve yayınlar"
    ;;
esac 