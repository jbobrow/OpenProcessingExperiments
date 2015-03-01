
int globalX = 0;
int globalY = 100;
int speed = 1;


void setup() {
	size(200, 200);
	smooth();
	
}

void draw() {
	background(255);
	move ();
	bounce ();
	drawCar (globalX, globalY, 24, color (100));
}

void move () {
	// Change the x location by speed
	globalX = globalX + speed;
}

void bounce () {
	if ((globalX > width) || (globalX < 0)) {
		speed = speed * -1;
	}
}



void drawCar (int x, int y, int thesize, color c) {
	// Using a local variable "offset"
	int offset = thesize/4;
	//Draw main car body
	rectMode(CENTER);
	stroke(200);
	fill(c);
	rect(x, y, thesize, thesize/2);
	//Draw four wheels relative to the center
	fill(200);
	rect(x-offset, y-offset, offset, offset/2);
	rect(x+offset, y-offset, offset, offset/2);
	rect(x-offset, y+offset, offset, offset/2);
	rect(x+offset, y+offset, offset, offset/2);

}


// size(200, 200);
// background(255);
// int x = 100;
// int y = 100;
// int thesize = 64;
// int offset = thesize/4;

// // draw main car body (i.e. a rect)
// rectMode(CENTER);
// stroke(0);
// fill(175);
// rect(x, y, thesize, thesize/2);

// // draw four wheels relative to the center
// fill(0);
// rect(x-offset, y-offset, offset, offset/2);
// rect(x+offset, y-offset, offset, offset/2);
// rect(x-offset, y+offset, offset, offset/2);
// rect(x+offset, y+offset, offset, offset/2);


// x = 50;
// y = 50;
// thesize = 24;
// offset = thesize/4;

// // draw main car body (i.e. a rect)
// rectMode(CENTER);
// stroke(0);
// fill(175);
// rect(x, y, thesize, thesize/2);

// // draw four wheels relative to the center
// fill(0);
// rect(x-offset, y-offset, offset, offset/2);
// rect(x+offset, y-offset, offset, offset/2);
// rect(x-offset, y+offset, offset, offset/2);
// rect(x+offset, y+offset, offset, offset/2);




