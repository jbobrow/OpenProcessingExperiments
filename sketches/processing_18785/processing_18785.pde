
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

Head head;

//////////////////////////////////////////
void setup() {
	basicStuff();
	rectMode(CENTER);
}

void draw() {
	background(fill_BG);
	float r = random(.1,1);
	noLoop();
	head = new Head(mouseX,mouseY,r);
	head.display();
}

void mousePressed() {
	loop();
}
//////////////////////////////////////////




class Head {
	float posX;
	float posY;
	float scale;
	// Head Variables
	float headW;
	float headH;
	float headX;
	float headY;
	Eyes eyes;
	Antenna antenna;
	Mouth mouth;
	
	
	// Constructor
	Head(float posX_, float posY_, float scale_) {
		posX = posX_;
		posY = posY_;
		scale = scale_;
		headW = 81 * scale;
		headH = 110 * scale;
		headX = posX;
		headY = posY;
		eyes = new Eyes(posX,posY,scale,headW,headH);
		antenna = new Antenna(posX,posY,scale,headW,headH);
		mouth = new Mouth(posX,posY,scale,headW,headH);
	}
	// End Constructor
	
	void display() {
		fill(fillA);
		noStroke();
		rectMode(CENTER);      
		rect(headX, headY, headW, headH);
		eyes.display();
		antenna.display();
		mouth.display();
	}
	
}

class Eyes {
	float posX;
	float posY;
	float scale;
	float headW;
	float headH;
	//
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
	
	// Constructor
	Eyes(float posX_, float posY_, float scale_, float headW_, float headH_) {
		posX = posX_;
		posY = posY_;
		scale = scale_;
		headW = headW_;
		headH = headH_;
		eyeW = 35 * scale;
		eyeH = 35 * scale;
		eyeLX = posX + (headW/4);
		eyeRX = posX - (headW/4);
		eyeY = posY - (20 * scale);
		pupilStrokeW = 3 * scale;
		pupilStrokeColor = 40;
		pupilW = 8 * scale;
		pupilH = 8 * scale;
		pupilOffset = 5 * scale;
	}
	// End Constructor
	
	void display() {
		noStroke();
		fill(white);
		rect(eyeLX,eyeY,eyeW,eyeH);
		rect(eyeRX,eyeY,eyeW,eyeH);
		strokeWeight(pupilStrokeW);
		stroke(pupilStrokeColor);
		fill(white);
		rectMode(CENTER);
		pupilLX = eyeLX + pupilOffset;
		pupilLY = eyeY - pupilOffset;
		pupilRX = eyeRX - pupilOffset;
		pupilRY = eyeY - pupilOffset;
		rect(pupilLX,pupilLY,pupilW,pupilH);
		rect(pupilRX,pupilRY,pupilW,pupilH);
	}
	
}

class Antenna {
	float posX;
	float posY;
	float scale;
	float headW;
	float headH;
	//
	float antennaW;
	float antennaH;
	float antennaX;
	float antennaY;
	float antBallX;
	float antBallY;
	float antBallW;
	float antBallH;
	
	// Constructor
	Antenna(float posX_, float posY_, float scale_, float headW_, float headH_) {
		posX = posX_;
		posY = posY_;
		scale = scale_;
		headW = headW_;
		headH = headH_;
		antennaW = 4 * scale;
		antennaH = 15 * scale;
		antennaX = posX;
		antennaY = posY - (headH/2) - (antennaH/2);
		antBallX = antennaX;
		antBallY = antennaY - (antennaH/2);
		antBallW = 10 * scale;
		antBallH = 10 * scale;
	}
	// End Constructor
	
	void display() {
		noStroke();
		fill(fillB);
		rect(antennaX, antennaY, antennaW, antennaH);
		ellipseMode(CENTER);
		fill(red[0],red[1],red[2]);
		ellipse(antBallX,antBallY,antBallW,antBallH);
	}
}


class Mouth {
	float posX;
	float posY;
	float scale;
	float headW;
	float headH;
	//
	int toothQuantity;
	float toothW;
	float mouthH;
	float toothH;
	float mouthW;
	float mouthX;
	float mouthY;
	float mouthOpenX;
	float mouthOpenY;
	float mouthOpenW;
	float mouthOpenH;
	
	// Constructor
	Mouth(float posX_, float posY_, float scale_, float headW_, float headH_) {
		posX = posX_;
		posY = posY_;
		scale = scale_;
		headW = headW_;
		headH = headH_;
		toothQuantity = 8;
		toothW = 13 * scale;
		mouthH = toothW*2 * scale;
		toothH = mouthH;
		mouthW = toothQuantity*toothW + 1;
		mouthX = posX;
		mouthY = posY+(headH/4);
		mouthOpenX = mouthX;
		mouthOpenY = mouthY + (5 * scale);
		mouthOpenW = mouthW;
		mouthOpenH = mouthH - (10 * scale);
	}
	// End Constructor
	
	void display() {
		noStroke();
		fill(white);
		rect(mouthX, mouthY, mouthW, mouthH);
		strokeWeight(1);
		stroke(200);
		line((mouthX-(mouthW/2)), (mouthY), (mouthX+(mouthW/2)), (mouthY));
		for ( float i = toothW; i < 1+(mouthW-toothW); i += (toothW)) {
			line(i+(mouthX-(mouthW/2)), (mouthY-(mouthH/2)), i+(mouthX-(mouthW/2)), (mouthY+(mouthH/2)));
		}
	}
	
}




void basicStuff() {
	size(200,200);
	colorMode(RGB);
 	background(fill_BG);
	smooth();
	noStroke();
}

