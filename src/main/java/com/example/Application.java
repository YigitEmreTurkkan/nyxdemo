package com.example;

public class Application {
    public static void main(String[] args) {
        System.out.println("Nyx Demo Uygulaması - Gradle ile");
        System.out.println("Merhaba, Dünya!");
    }
    
    public String greet(String name) {
        return String.format("Merhaba, %s!", name);
    }
    
    /**
     * Belirtilen sayının karesini hesaplar
     * @param number Karesi hesaplanacak sayı
     * @return Sayının karesi
     */
    public int calculateSquare(int number) {
        return number * number;
    }
}
