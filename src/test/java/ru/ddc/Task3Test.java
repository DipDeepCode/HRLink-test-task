package ru.ddc;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class Task3Test {
    private final Task3 notMain = new Task3();

    @Test
    public void test0() {
        assertEquals(1, notMain.calculate(5, 2, 0));
    }

    @Test
    public void test1() {
        assertEquals(2, notMain.calculate(4, 1, 3));
    }

    @Test
    public void test2() {
        assertEquals(3, notMain.calculate(4, 4, 1));
    }

    @Test
    public void test3() {
        assertEquals(1, notMain.calculate(4, 4, 3));
    }

    @Test
    public void test3_1() {
        assertEquals(1, notMain.calculate(4, 1, 0));
    }

    @Test
    public void test3_2() {
        assertEquals(3, notMain.calculate(6, 3, 2));
    }
}