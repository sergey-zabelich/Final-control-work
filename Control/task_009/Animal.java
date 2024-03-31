import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Animal {
    public String name;
    public String birthDate;
    public String species;
    public String category;
    public List<String> commands;

    public Animal(String name, String birthDate, String species, String category) {
        this.name = name;
        this.birthDate = birthDate;
        this.species = species;
        this.category = category;
        this.commands = new ArrayList<>();
    }

    public void addCommand(String command) {
        commands.add(command);
    }

    public int getAge() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
        try {
            Date birth = dateFormat.parse(birthDate);
            Date now = new Date();
            long ageInMillis = now.getTime() - birth.getTime();
            return (int) (ageInMillis / (1000L * 60 * 60 * 24 * 365));
        } catch (ParseException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public String getName() {
        return name;
    }

    public String toString() {
        return String.format("%-10s | %-12s | %-5d | %-10s | %-20s | %s",
                name, birthDate, getAge(), species, category, String.join(", ", commands));
    }
}