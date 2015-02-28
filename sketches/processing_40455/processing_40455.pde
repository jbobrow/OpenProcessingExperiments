
float radius = 250;
int maxpoints = 600;
int diameter;
int[] coord;
int[] arr = new int[2];
int draughtboard = 5;

void setup() {
	size(600, 600);
	background(0);
	smooth(); // anti-aliasing
	
	noFill();
	noStroke();

	noLoop();
}

void draw() {

	// Draw a draughtboard
	drawDraughtboard();
	
	
	// Draw ellipses within a big circle
	
	for (int i = 0; i < maxpoints; i++) {
		// fill with a random colour
		fill(randcol());
		
		coord = randomCoord();
		diameter = floor(random(12));
		
		ellipse(coord[0], coord[1], diameter, diameter);
	}
}


// Draws a draughtboard

void drawDraughtboard() {
	for (int i = 0; i < width; i += draughtboard) {
		for (int j = 0; j < height; j += draughtboard)
		{

			if((i+j) % 2 == 0) // if S is even (uses modulo)
				fill(0);
			
			else
				fill(30);
			
			rect(i, j, draughtboard, draughtboard);
		}
	}
}


// Returns random coordinates
// if the points are within a 250 pixels radius
// from the centre of the sketch

int[] randomCoord() {
	arr[0] = floor(random(width));
	arr[1] = floor(random(height));

	// If the random point is within the circle, return the coordinates
	if(dist(arr[0], arr[1], width/2, height/2) < radius) {
		return arr;
	}
	
	// Otherwise re-iterate the function
	else {
		return randomCoord();
	}
}   

// Returns a random colour
//
// Range 60-220 to avoid too bright
// or too dark colours

color randcol() {
	int r = floor(random(60, 220));
	int g = floor(random(60, 220));
	int b = floor(random(60, 220));
	//int a = floor(random(70, 100));
	// removed alpha, not aesthetically pleasant with the draughtboard
	
	return color(r, g, b);
}

