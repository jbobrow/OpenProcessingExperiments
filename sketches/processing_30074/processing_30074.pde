
/*--------------------Lines placed by noise-----------------*/


/*------ cautionunaesthetic code ------------------------*/

int n;

int x1, x2, y1, y2;

 void setup() {
		size(800, 801, JAVA2D);
		frameRate(60);

		colorMode(HSB, 360, 100, 100, 100);
		background(0, 100, 0, 100);
		smooth();

		thaX();
		pushMatrix();
		translate(-width/2,-height/2);
		thaX();
		popMatrix();
		pushMatrix();
		translate(width+(width/2),height+(height/2));
		rotate(PI);
		thaX();
		popMatrix();
		pushMatrix();
		translate(-width/2,height+height/2);
		rotate((float) (1.5 * PI));
		thaX();
		popMatrix();
		pushMatrix();
		translate(width+width/2,-height/2);
		rotate(PI/2);
		thaX();
		popMatrix();
	}

	void thaX()
	{
		for (n = 0; n <= 3000; n++) {
			
			stroke((int)(noise(n)*360), 100, 100,random(0,6));
			fill(random(100, 200), 100, 100, 100);
			
			strokeWeight(1);
			
			x1 = (int) (noise(n) * width);
			x2 = (int) (noise(height-n) * width);
			y1 = (int) (noise(n) * height);
			y2 = (int) (noise(width-n) * height);

			line(x1, y1, x2, y2);
		}
		
		pushMatrix();
		translate(0,height);
		rotate(-PI/2);
		for (n = 0; n <= 3000; n++) {
			
			stroke((int)(noise(n)*360), 100, 100,random(0,6));
			fill(random(100, 200), 100, 100, 100);
			
			strokeWeight(1);
			
			x1 = (int) (noise(n) * width);
			x2 = (int) (noise(height-n) * width);
			y1 = (int) (noise(n) * height);
			y2 = (int) (noise(width-n) * height);

			line(x1, y1, x2, y2);
		}
		
		popMatrix();
		
		pushMatrix();
		translate(width,0);
		rotate((float) (-1.5*PI));
		for (n = 0; n <= 3000; n++) {
			
			stroke((int)(noise(n)*360), 100, 100,random(0,6));
			fill(random(100, 200), 100, 100, 100);
			
			strokeWeight(1);
			
			x1 = (int) (noise(n) * width);
			x2 = (int) (noise(height-n) * width);
			y1 = (int) (noise(n) * height);
			y2 = (int) (noise(width-n) * height);

			line(x1, y1, x2, y2);
		}
		
		popMatrix();
		

		
		pushMatrix();
		translate(width,height);
		rotate(PI);
		for (n = 0; n <= 3000; n++) {
			
			stroke((int)(noise(n)*360), 100, 100,random(0,6));
			fill(random(100, 200), 100, 100, 100);
			
			strokeWeight(1);
			
			x1 = (int) (noise(n) * width);
			x2 = (int) (noise(height-n) * width);
			y1 = (int) (noise(n) * height);
			y2 = (int) (noise(width-n) * height);

			line(x1, y1, x2, y2);
		}
		
		popMatrix();


		
	}
	void draw() {

	}

