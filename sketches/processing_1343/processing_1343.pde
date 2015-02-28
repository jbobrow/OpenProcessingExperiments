
import processing.core.PApplet;

public class SandChaser extends PApplet {

	int numGrains;
	Grain[] grains;
	int dx, dy = 0;

	int sourceColors[][] = new int[2][4];

	public void setup() {
		randomSeed(System.currentTimeMillis());

		size(512, 512, P3D);
		// hint( ENABLE_OPENGL_4X_SMOOTH );
		resetAll();
	}

	public void draw() {
		int count = 0;
		for (int i = 0; i < grains.length; i++) {
			Grain grain = grains[i];
			count += grain.move();
		}
		if (count >= grains.length) {
			try {
				Thread.sleep(1);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			resetAll();
		}
	}

	public void mousePressed() {
		resetAll();
	}

	public void resetAll() {
                numGrains =   (int) ((random(5)+2) * (Math.pow(10,random(2)+1)));
		grains = new Grain[numGrains];
		sourceColors[0][0] = (int) random(255);
		sourceColors[0][1] = (int) random(255);
		sourceColors[0][2] = (int) random(255);
		sourceColors[0][3] = (int) random(255) + 45;

		sourceColors[1][0] = (int) random(255);
		sourceColors[1][1] = (int) random(255);
		sourceColors[1][2] = (int) random(255);
		sourceColors[1][3] = (int) random(255) + 45;
		// num_grains = (int) (((myrand.nextInt(5))+2) * Math.pow(10,
		// (myrand.nextInt(2)+1)));
		// start with two source colors
		// set the backgrond color to black
		background(0);
		for (int i = 0; i < numGrains; i++) {
			// initialize the sand grains with a
			// random vector going in any direction
			// starting from the center of the screen.
			float vx = random(-1, 1); // random number
			// between -1
			// and 1
			float vy = random(-1, 1); // random number
			// between -1
			// and 1
			// magnitude multiplier based on the screen size
			float k = ((width + height) / 2) / 5;
			grains[i] = new Grain(width / 2, height / 2, k * vx, k * vy, i,
					this);
			// vvt -= 0.00033
			// vt += vvt
		}
		for (int i = 0; i < grains.length; i++) {
			Grain grain = grains[i];
			grain.find_target();
		}
	}

	public int[] someColor() {
		// randomly pick from one of the 2 source colors.
		int[] choice = sourceColors[(int) random(2)];
		// boost the 4 elements of the color by upto 60
		for (int i = 0; i < choice.length; i++) {
			int c = choice[i];
			c = (int) (c + (random(60)));
		}
		// decrease the alpha by 30percent.
		choice[3] = (int) (choice[3] * 0.7);
		// introduce random colors a 5th of the time
		return choice;
	}

	static public void main(String args[]) {
		PApplet.main(new String[] { "SandChaser" });
	}
}

