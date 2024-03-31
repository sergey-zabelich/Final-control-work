import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("Меню:");
            System.out.println("1. Показать список всех животных");
            System.out.println("2. Добавить новое животное в реестр");
            System.out.println("3. Обучить животное командам");
            System.out.println("4. Выход");
            System.out.print("Выберите действие: ");
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline

            switch (choice) {
                case 1:
                    AnimalRegistry.showAnimalList();
                    break;
                case 2:
                    AnimalRegistry.addAnimal(scanner);
                    break;
                case 3:
                    AnimalRegistry.trainAnimal(scanner);
                    break;
                case 4:
                    System.out.println("Программа завершена.");
                    return;
                default:
                    System.out.println("Неверный выбор. Попробуйте снова.");
            }
        }
    }
}