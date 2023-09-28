package ru.ddc;

public class Task3 {
    public int calculate(int n, int left, int right) {
        if (left < right) {
            return differentDirections(n, left, right);
        } else {
            if ((left - right) % 2 == 1) {
                return differentDirections(n, right, left) + left - right - 1;
            } else {
                int numberOfStepsToChangeDirection = (left - right) / 2;
                left = (left + right) / 2;
                right = left - 2;
                return differentDirections(n, right, left) + numberOfStepsToChangeDirection;
            }
        }
    }

    private int differentDirections(int n, int left, int right) {
        return Math.min(left, n - right) + 1;
    }
}
