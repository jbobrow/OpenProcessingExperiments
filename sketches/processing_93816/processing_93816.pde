

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

	Scanner input2 = null;
	boolean up = false;
	boolean down = false;
	boolean left = false;
	boolean right = false;
	boolean space = false;
	boolean back = false;
	boolean forward = false;
	int playerX = 0;
	int playerY = 0;
	int playerZ = 0;
	int playerAngleTheta = 0;
	int playerAnglePhi = 0;
	int playerAngle3 = 0;
	int x = 0;
	int y = 0;
	int z = 0;
	
	float rX = 0;
	float rY = 0;
	float pMX = 0;
	float pMY = 0;
	float pRX = 0;
	float pRY = 0;
	ArrayList<double[]> TestBoxes = new ArrayList<double[]>();
	ArrayList<String> Countries = new ArrayList<String>();
	boolean clicked = false;

	public void setup() {
		String pathname = "earthquake.txt";
		File file = new File(pathname);
		ArrayList<String> temp = new ArrayList<String>();
                String[] temp56 = loadStrings("earthquake.txt");
		for (int i = 1; i < temp56.length;i++){
                    temp.add(temp56[i]);
}

		for (int i = 0; i< temp.size();i++){
			String temp2 = temp.get(i);
			int start = nthOccurrence(temp2, ',', 5);
			int start2 = nthOccurrence(temp2, ',', 6);
			int start3 = nthOccurrence(temp2, ',', 7);
			int start4 = nthOccurrence(temp2, ',', 8);
			int start5 = nthOccurrence(temp2, ',', 9);
			int start6 = nthOccurrence(temp2, ',', 10);
			
			double[] temp3 = new double[7];
			temp3[0] = -Math.cos(Double.parseDouble(temp2.substring(start2+1,start3)) *Math.PI/180)*300*Math.cos(Double.parseDouble(temp2.substring(start+1,start2))*Math.PI/180);
			temp3[1] = Math.cos(Double.parseDouble(temp2.substring(start2+1,start3))*Math.PI/180)*300*Math.sin(Double.parseDouble(temp2.substring(start+1,start2))*Math.PI/180);
			temp3[2] = Double.parseDouble(temp2.substring(start4+1,start5));
			temp3[2] = Math.sin(Double.parseDouble(temp2.substring(start2+1,start3))*Math.PI/180)*300;
			temp3[3] = rX;
			temp3[4] = rY;
			temp3[5] = Double.parseDouble(temp2.substring(start3+1,start4))*5;
			Countries.add(temp2.substring(start6));
			TestBoxes.add(temp3);
			
			
		}
		
		size(800, 800, P3D);
		background(0);
		x = 400;
		y = 400;
	}

	public void draw() {
		this.background(0);

		if (mousePressed) {
			if (!clicked) {
				pMX = mouseX;
				pMY = mouseY;
				pRX = rX;
				pRY = rY;
				clicked = true;
				/*
				 * double[] temp = new double[5]; temp[0] = 400* Math.cos(rY);
				 * temp[1] = 400* Math.sin(rX); temp[2] = 400* Math.sin(rY);
				 * temp[3] = rY; temp[4] = rX; TestBoxes.add(temp);
				 */
			}
			rX = (float) ((mouseX-pMX)/100.0) + pRX;
			rY = (float) ((mouseY-pMY)/100.0) + pRY;
		} else {

			clicked = false;
		}
		if (space) {
			double[] temp = new double[6];
			temp[0] = 0;
			temp[1] = 0;
			temp[2] = 0;
			temp[3] = rY;
			temp[4] = rX;
			temp[5] = 10;
			TestBoxes.add(temp);
		}
		if (left) {
			x += 5;
		}
		if (right) {
			x -= 5;
		}
		if (up) {
			y += 5;
		}
		if (down) {
			y -= 5;
		}
		if (back){
			z += 5;
		}
		if (forward){
			z -= 5;
		}
		/*
		 * this.box(100); for (int i = 0; i < 1000; i++){ pushMatrix();
		 * translate(0, 100*(i/10), 100*(i%(10-(i/100)))); this.box(100);
		 * popMatrix(); }
		 */
		rX += 0.01;
		translate(x, y, z);
		rotateX((float) rY);
		rotateY((float) rX);
		stroke(0, 0, 255, 125);
		fill(0, 0, 255, 125);
		sphere(300);
		// fill(255,255,255,125);
		// sphere(400);
		fill(255, 255, 255, 125);
		stroke(255, 255, 255, 125);
		for (int i = 0; i < TestBoxes.size(); i++) {
			pushMatrix();
			translate((int) TestBoxes.get(i)[0], (int) TestBoxes.get(i)[1],
					(int) TestBoxes.get(i)[2]);
			//TestBoxes.get(i)[0] += (TestBoxes.get(i)[5] * Math.random() - TestBoxes.get(i)[5]/2)/6;
			//TestBoxes.get(i)[1] -= (TestBoxes.get(i)[5] * Math.random()- TestBoxes.get(i)[5]/2)/6;
			//TestBoxes.get(i)[2] -= (TestBoxes.get(i)[5] * Math.random()- TestBoxes.get(i)[5]/2)/6;
			if(Math.round(TestBoxes.get(i)[5]) > 20){
				//this.text(Countries.get(i),0,0,0);
			}
			this.box((float) Math.round(TestBoxes.get(i)[5]));
			popMatrix();
		}

	}

	public void keyPressed() {
		if (keyCode == UP) {
			up = true;
		}
		if (keyCode == DOWN) {
			down = true;
		}
		if (keyCode == LEFT) {
			left = true;
		}
		if (keyCode == RIGHT) {
			right = true;
		}
		if (this.key == 'e'){
			back = true;
		}
		if (this.key == 'd'){
			forward = true;
		}
		if (this.key == ' ') {
			space = true;
		}
	}

	public void keyReleased() {

		if (this.keyCode == UP) {
			up = false;
		}
		if (this.keyCode == DOWN) {
			down = false;
		}
		if (this.keyCode == LEFT) {
			left = false;
		}
		if (this.keyCode == RIGHT) {
			right = false;
		}
		if (this.key == 'e'){
			back = false;
		}
		if (this.key == 'd'){
			forward = false;
		}
		if (this.key == ' ') {
			space = false;
		}
	}
	public static int nthOccurrence(String str, char c, int n) {
	    int pos = str.indexOf(c, 0);
	    while (n-- > 0 && pos != -1)
	        pos = str.indexOf(c, pos+1);
	    return pos;
	}


