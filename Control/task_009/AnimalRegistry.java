import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class AnimalRegistry {
    private static List<Animal> animals = new ArrayList<>();

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
                    showAnimalList();
                    break;
                case 2:
                    addAnimal(scanner);
                    break;
                case 3:
                    trainAnimal(scanner);
                    break;
                case 4:
                    System.out.println("Программа завершена.");
                    return;
                default:
                    System.out.println("Неверный выбор. Попробуйте снова.");
            }
        }
    }

    public static void showAnimalList() {
        if (animals.isEmpty()) {
            System.out.println("Список животных пуст.");
            return;
        }

        System.out.println("======================================================================");
        System.out.println("                          РЕЕСТР ЖИВОТНЫХ");
        System.out.println("======================================================================");
        System.out.println("   ИМЯ | ДАТА РОЖДЕНИЯ | ВОЗРАСТ | РОД      | КАТЕГОРИЯ           | КОМАНДЫ");
        System.out.println("----------------------------------------------------------------------");
        for (Animal animal : animals) {
            System.out.println(animal);
        }
    }

    public static void addAnimal(Scanner scanner) {
        System.out.print("Введите имя животного: ");
        String name = scanner.nextLine();
        System.out.print("Введите дату рождения (в формате dd.MM.yyyy): ");
        String birthDate = scanner.nextLine();
        System.out.print("Введите род животного: ");
        String species = scanner.nextLine();
        System.out.print("Введите категорию животного: ");
        String category = scanner.nextLine();

        Animal animal = new Animal(name, birthDate, species, category);
        animals.add(animal);
        System.out.println("Животное успешно добавлено в реестр.");
    }

    public static void trainAnimal(Scanner scanner) {
        System.out.print("Введите имя животного для обучения: ");
        String name = scanner.nextLine();
        Animal animal = findAnimalByName(name);
        if (animal == null) {
            System.out.println("Животное с таким именем не найдено.");
            return;
        }

        System.out.print("Введите команду для обучения (разделите через запятую, например, \"Сидеть, Ко мне\"): ");
        String commandsInput = scanner.nextLine();
        String[] commands = commandsInput.split(",");
        for (String command : commands) {
            animal.addCommand(command.trim());
        }
        System.out.println("Животное успешно обучено.");
    }

    private static Animal findAnimalByName(String name) {
        for (Animal animal : animals) {
            if (animal.getName().equalsIgnoreCase(name)) {
                return animal;
            }
        }
        return null;
    }
}