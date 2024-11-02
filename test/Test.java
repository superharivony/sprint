
public class Test {
	public static void main(String[] args) {
		try {
			Class.forName("controllers.Login");
			System.out.println("huhu");
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
}
