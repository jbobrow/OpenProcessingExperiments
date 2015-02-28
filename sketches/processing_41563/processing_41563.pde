
bouncingBall b1, b2, b3;


void setup() {
	size(600, 600);
	smooth();
	
	background(0);
	noStroke();
	frameRate(80);

	
	// Initialize instances of the bouncingBall object
	
	b1 = new bouncingBall(23, width/2, height/4);
	b2 = new bouncingBall(68, width/2, height * 0.75);
	b3 = new bouncingBall(90, width/3, height/4);
}



void draw() {
	
	// Clear the screen
	
	fill (0, 20);
	rect(0, 0, width, height);
	
	
	// Display points
	
	b1.display(); // A
	b2.display(); // B
	b3.display(); // C
	
	
	// Make points bounce if they collide
	
	bounce(b1, b2, 'A', 'B');
	bounce(b2, b3, 'B', 'C');
	bounce(b1, b3, 'A', 'C');
}





// Bouncing function

void bounce(bouncingBall pointA, bouncingBall pointB, char pointAname, char pointBname) {

	// If two points are less than 30 pixels away
	
	if(dist(pointA.x, pointA.y, pointB.x, pointB.y) < 30) {
	
		println(pointAname + " bounced with " + pointBname); // debug

		
		// Inverse magnetism
			
		pointA.xMagn *= -1;
		pointB.xMagn *= -1;
		
		pointA.yMagn *= -1;
		pointB.yMagn *= -1;
		
		// Go to another random direction
		pointA.a = random(180);
		pointB.a = random(180);
	}
}






// Main balls drawing class

class bouncingBall {
	float x, y; // Coordinates
	float a; // Angle
	
	int xMagn = 3, yMagn = 3; // Magnitude (for bouncing)
	
	int ialpha = 255;
	int colourCycle = 10; // Alpha value to decrease at each redraw
	
	
	// Foreground random colour
	int[] fillrand = randCol();
	int r = fillrand[0], g = fillrand[1], b = fillrand[2];
	
	// Background random colour
	int[] bgrand = randCol();
	int bgr = bgrand[0], bgg = bgrand[1], bgb = bgrand[2];
	
	
	// Initialize variables
	
	bouncingBall(float angle, float xStartingPoint, float yStartingPoint) {
		a = angle;
		
		x = xStartingPoint;
		y = yStartingPoint;
	}
	
	
	// Compute coordinates of the ellipses and draw them
	
	void display() {

		// Draw the first ellipse (background colour)
		fill(bgr, bgg, bgb);
		ellipse(x, y, 30, 30);
		
		// Draw another ellipse on top of the first
		// with the covering colour & alpha
		
		fill(fadeColour());
		ellipse(x, y, 30, 30);
		
		
		// Define new coordinates
		
		x += cos(radians(a)) * 10;
		y += sin(radians(a)) * 10;
		
		a++;
		
		// a *= random(0.8, 1.2); // crazy mode!
		
		// Define boundaries
		
		if (x > width) {
			x = 0;
			a = a + random(45);
		}
		
		if (x < 0) {
			x = width;
			a = a - random(45);
		}
		
		if (y > height) {
			y = 0;
			a = a - random(45);
		}
		
		if (y < 0) {
			y = height;
			a = a - random(45);
		} 
		
		
		// Add magnitude
		x += xMagn;
		y += yMagn;
	}
	
	
	// Make a colour fade
	
	color fadeColour() {
		ialpha -= colourCycle;
		
		// When the colour is entirely covered, change it
		if (ialpha >= 255 || ialpha <= 0) {
			// Set fill colour as previous bg colour
			r = bgr; g = bgg; b = bgb;
			
			// Set new bg colour to fade on
			fillrand = randCol();
			bgr = fillrand[0];
			bgg = fillrand[1];
			bgb = fillrand[2];
			
			// Reset the fill colour
			ialpha = 255;
		}
		
		// debug:
		// println(r + " - " + g + " - " + b + " - A " + i);
		
		return color(r, g, b, ialpha);
	}
	
	// Set a random colour
	int[] randCol() {
		int temp[] = new int[3];
	
		temp[0] = floor(random(60, 220)); // R
		temp[1] = floor(random(60, 220)); // G
		temp[2] = floor(random(60, 220)); // B
		
		return temp;
	}
}

