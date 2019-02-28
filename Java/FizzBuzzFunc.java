import java.util.stream.*;

/**
 * Functional implementation of FizzBuzz in Java
 */
public class FizzBuzzFunc {
    public static void main(String args[]) {
        IntStream.rangeClosed(1, 100) // Create IntStream with values from 1 to 100 inclusive.
            .forEach(i -> System.out.println( // Replace numbers with Fizz/Buzz when needed.
                i % 15 == 0 ? "FizzBuzz" : (i % 3 == 0 ? "Fizz" : (i % 5 == 0 ? "Buzz" : i))
            ));
    }
}
