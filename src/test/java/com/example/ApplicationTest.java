package com.example;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class ApplicationTest {
    @Test
    void testGreet() {
        Application app = new Application();
        assertEquals("Merhaba, Test!", app.greet("Test"));
    }
}
