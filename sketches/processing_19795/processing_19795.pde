
// Fill Colors                     Used on:
int white = 255;
int black = 0;
int fillA = 150;                // Head, Body
int fillB = 80;					// Neck
int fillC = 255;				// Eyes, Teeth
int fillD = 130;				// Chest Plate
int fill_BG = 40;               // Background, Neck Lines
int[] red = {255,0,0};
int[] blue = {0,255,255};
int[] green = {0,255,0};

Robot[] robots = new Robot[1];
float gravity = 0.1;
float friction = 0.05;
float r = .5; // Scale
float xSpeed = 0;
float ySpeed = 0;
boolean roboStream = false;
boolean freezeDraw = false;


//////////////////////////////////////////
void setup() {
	basicStuff();
	for (int i=0; i < robots.length; i++){
		robots[i] = new Robot(random(width),random(height/2),random(.3,.5),0,0);
	}
}

void draw() {
	background(fill_BG);
	setSpeed();
	displayBots();
	println(robots.length);
}

void mousePressed() {
	
}

void mouseDragged() {
	if (roboStream == true) {
		Robot b = new Robot(mouseX, mouseY, random(.1,.6),xSpeed,ySpeed);
		robots = (Robot[]) append(robots,b);
	} else if (freezeDraw == true) {
		Robot b = new Robot(mouseX, mouseY, random(.1,.6),xSpeed,ySpeed);
		robots = (Robot[]) append(robots,b);
		noLoop();
	}
}

void mouseReleased() {
	loop();
	if (roboStream == false) {
		Robot b = new Robot(mouseX, mouseY, random(.1,.6),xSpeed,ySpeed);
		robots = (Robot[]) append(robots,b);
	}
}

void keyPressed() {
	if ( key == 'c') {
		robots = (Robot[])expand(robots,0);
		background(fill_BG);
	}
	if ( key == 's') {
		roboStream = !roboStream;
	}
	if ( key == 'f') {
		freezeDraw = !freezeDraw;
	}
}

//////////////////////////////////////////


// Start Robot ///////////////
class Robot {
	
	// Declarations
	float posX;
	float posY;
	float scale;
	float xSpeed;
	float ySpeed;
	
	// Head
	float headW;
	float headH;
	float headX;
	float headY;
	//
	
	// Eyes
	float eyeW;
	float eyeH;
	float eyeLX;
	float eyeRX;
	float eyeY;
	float pupilStrokeW;
	int pupilStrokeColor;
	float pupilW;
	float pupilH;
	float pupilLX;
	float pupilLY;
	float pupilRX;
	float pupilRY;
	float pupilOffset;
	//
	
	// Antenna
	float antennaW;
	float antennaH;
	float antennaX;
	float antennaY;
	float antBallX;
	float antBallY;
	float antBallW;
	float antBallH;
	//
	
	// Mouth
	int toothQuantity;
	float toothW;
	float mouthH;
	float toothH;
	float mouthW;
	float mouthX;
	float mouthY;
	//
	
	
	/*
	Head head;
	Eyes eyes;
	Antenna antenna;
	Mouth mouth;
	*/
	
	
	// Constructor
	Robot(float posX_, float posY_, float scale_, float xSpeed_, float ySpeed_) {
		posX = posX_;
		posY = posY_;
		scale = scale_;
		ySpeed = ySpeed_;
		xSpeed = xSpeed_;
		
		// Head
		headW = 81 * scale;
		headH = 110 * scale;
		//
		
		// Eyes
		eyeW = 35 * scale;
		eyeH = 35 * scale;
		eyeLX = (posX + (20 * scale));
		eyeRX = (posX - (20 * scale));
		eyeY = (posY - (20 * scale));
		pupilStrokeW = 3 * scale;
		pupilStrokeColor = 40;
		pupilW = 8 * scale;
		pupilH = 8 * scale;
		pupilOffset = 5 * scale;
		//
		
		// Antenna
		antennaW = 4 * scale;
		antennaH = 15 * scale;
		antennaX = posX;
		antennaY = (posY - (55 * scale) - (antennaH/2));
		antBallX = antennaX;
		antBallY = antennaY - (antennaH/2);
		antBallW = 10 * scale;
		antBallH = 10 * scale;
		//
		
		// Mouth
		toothQuantity = 8;
		toothW = 13 * scale;
		mouthH = toothW*2;
		toothH = mouthH;
		mouthW = toothQuantity*toothW + 1;
		mouthX = posX;
		mouthY = (posY+(30*scale));
		//
		
		/*
		head = new Head(posX, posY, scale);
		eyes = new Eyes(posX, posY, scale);
		antenna = new Antenna(posX, posY, scale);
		mouth = new Mouth(posX, posY, scale);
		*/
	}
	
	// Functions
	void display() {
		//head.display();
		fill(fillA);
		noStroke();
		rectMode(CENTER);      
		rect(posX, posY, headW, headH);
		//
		
		// eyes.display();
		noStroke();
		fill(white);
		rect((posX + (20 * scale)),(posY - (20 * scale)),eyeW,eyeH);
		rect((posX - (20 * scale)),(posY - (20 * scale)),eyeW,eyeH);
		strokeWeight(pupilStrokeW);
		stroke(pupilStrokeColor);
		fill(white);
		rectMode(CENTER);
		pupilLX = (posX + (20 * scale)) + pupilOffset;
		pupilLY = (posY - (20 * scale)) - pupilOffset;
		pupilRX = (posX - (20 * scale)) - pupilOffset;
		pupilRY = (posY - (20 * scale)) - pupilOffset;
		rect(pupilLX,pupilLY,pupilW,pupilH);
		rect(pupilRX,pupilRY,pupilW,pupilH);
		//
		
		//antenna.display();
		noStroke();
		fill(fillB);
		rect(posX, (posY - (55 * scale) - (antennaH/2)), antennaW, antennaH);
		ellipseMode(CENTER);
		fill(red[0],red[1],red[2]);
		ellipse(posX,(posY - (55 * scale) - antennaH),antBallW,antBallH);
		//
		
		//mouth.display();
		noStroke();
		fill(white);
		rect(posX, (posY+(30*scale)), mouthW, mouthH);
		strokeWeight(1);
		stroke(200);
		line((posX-(mouthW/2)), (posY+(30*scale)), (posX+(mouthW/2)), (posY+(30*scale)));
		for ( float i = toothW; i < 1+(mouthW-toothW); i += (toothW)) {
			line(i+(posX-(mouthW/2)), ((posY+(30*scale))-(mouthH/2)), i+(posX-(mouthW/2)), ((posY+(30*scale))+(mouthH/2)));
		}
		//
	}
	
	void gravity() {
	    ySpeed = ySpeed + gravity + scale;
	}
	
	void friction() {
		if (posY >= height) {
			if (xSpeed > 0 + (scale/2)) {
	    		xSpeed = xSpeed - scale;
			} else if (xSpeed < 0 - (scale/2)) {
				xSpeed = xSpeed + scale;
			} else {
				xSpeed = 0;
			}
		}
	}
	
	void move() {
	    posY = posY + ySpeed;
	    posX = posX + xSpeed;
	}
	
	void wallCheck() {
		if (posY > height) {
			ySpeed = ySpeed *-0.95;
			posY = height;
		}
		if (posX > width) {
	      xSpeed = xSpeed *-1;
	      posX = width;
	    }
	    if (posX < 0) {
	      xSpeed = xSpeed *-1;
	      posX = 0;
	    }
	}
} // End Robot //////////////




void basicStuff() {
	size(800,600);
	colorMode(RGB);
 	background(fill_BG);
	smooth();
	noStroke();
	rectMode(CENTER);
}

void setSpeed() {
	if ( mouseX-pmouseX > 0 ) {
	    xSpeed = abs(mouseX-pmouseX);
	} else {
	    xSpeed = -abs(mouseX-pmouseX);
	}

	if ( mouseY-pmouseY > 0 ) {
	    ySpeed = abs(mouseY-pmouseY);
	} else {
	    ySpeed = -abs(mouseY-pmouseY);
	}
}

void displayBots() {
	for (int i=0; i < robots.length; i++) {
		robots[i].gravity();
		robots[i].friction();
		robots[i].move();
		robots[i].display();
		robots[i].wallCheck();
	}
}
/*

class Button {
	// Declarations
	float posX, posY;
	float diameter;
	color fillColor;
	String variable;
	
	
	// Constructor
	Head(String variable_, float posX_, float posY_, float fillColor_) {
		variable = variable_;
		posX = posX_;
		posY = posY_;
		fillColor = fillColor_;
		diameter = 10;
	}
	// End Constructor
	
	void display() {
		fill(fillColor);
		noStroke();
		ellipse(posX,posY,diameter/2,diameter/2);
	}
	
	void pressed() {
		if (mousePressed() && mouseX < (posX+diameter/2) && mouseX > (posX-diameter/2) &&  mouseY < (posY+diameter/2) && mouseY > (posY-diameter/2)) {
			variable
		}
	}

}




class Head {
	// Declarations
	
	// Constructor
	Head(float posX_, float posY_, float scale_) {
	}
	// End Constructor
	
	void display() {
	}

}

class Eyes {
	
	// Constructor
	Eyes(float posX_, float posY_, float scale_) {
	}
	// End Constructor
	
	void display() {
	}
	
}

class Antenna {
	
	// Constructor
	Antenna(float posX_, float posY_, float scale_) {
	}
	// End Constructor
	
	void display() {
	}
}


class Mouth {
	
	// Constructor
	Mouth(float posX_, float posY_, float scale_) {	
	}
	// End Constructor
	
	void display() {
	}
	
}

*/

