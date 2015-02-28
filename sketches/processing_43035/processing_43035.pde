
// Graphics
PImage bgAlpha, bgPlain;
PImage playNormal, playHover, playActive;
PImage menuNormal, menuHover, menuActive;

// Classes
Interface UI;

float yPos = 0; // Position on the screen

// Set if we're in the menu or the game
//and if we switch between them

boolean goToGame = false, goToMenu = false;
boolean gameScreen = false;

// Easing variables
int time = 0;
float beginning, change;
float duration = 140;	


void setup() {
	size(600, 800);
	smooth();
	background(255);

	//frameRate(30);
	
	UI = new Interface();
	bgAlpha = loadImage("sumoRingAlpha.png");
        bgPlain = loadImage("sumoRingPlain.jpg");
	
	// Load buttons
	playNormal = loadImage("buttonPlayNormal.png");
	playHover = loadImage("buttonPlayHover.png");
	playActive = loadImage("buttonPlayActive.png");	
	
	menuNormal = loadImage("buttonMenuNormal.png");
	menuHover = loadImage("buttonMenuHover.png");
	menuActive = loadImage("buttonMenuActive.png");	
}

void draw() {
	background(255);
	UI.drawImage(yPos);

	
	if(goToGame) {
		UI.goToGame();
	}
	if(goToMenu)
		UI.goToMenu();

	UI.drawButton(playNormal, playHover, playActive, (width/2-(playNormal.width/2)), 400, "goToPlay");
	UI.drawButton(menuNormal, menuHover, menuActive, 30, 810, "goToMenu");
}

void mousePressed() {
	//if(!gameScreen) goToGame = true;
	//else goToMenu = true;
}





class Interface {

	public Interface() {
		//
	}
	
	public void drawImage(float yPos) {
		this.skyGradient();
		this.spinningSun();
		
		image(bgAlpha, 0, 86 + yPos);
                image(bgPlain, 0, 313 + yPos);
	}
	

	public void drawButton(PImage inactive, PImage hover, PImage active, int xpos, int ypos, String action) {
		ypos = (int)(ypos + yPos); // take the screen offset into account
		
		// If the mouse is on the button…
		if (mouseX > xpos && mouseX < (xpos + inactive.width) && mouseY > ypos && mouseY < (ypos + inactive.height)) {
			
			// Change to hover state
			if(!mousePressed) {
				image(hover, xpos, ypos);
			}
			// Or if it's clicked, change to active state and do something
			else {
				image(active, xpos, ypos);
				
				delay(40);
				
				if(action == "goToPlay") goToGame = true;
				if(action == "goToMenu" && gameScreen) goToMenu = true;
			}
			
		}
		else {
			image(inactive, xpos, ypos);
		}
	}

	private void skyGradient() {
		int blue = 250;
		for (int i = 120; i >= -300; i--) {
			stroke(blue, 255, 255);
			blue -= 2;
			line(0, yPos + i, width, yPos + i);		
		}
		
	}
	
	float radius = 540;
	float angle2, angle3, theta;
	float x1, y1, x2, y2, x3, y3;
		
	private void spinningSun() {
		noStroke();
		fill(160, 0, 0);
		
		x1 = 250;
		y1 = yPos + 30;
		
		ellipse(x1, y1, 120, 120);

		for(int j = 0; j <= 7; j++) {
			angle2 = j * radians(360/8) + theta;
			angle3 = angle2 + radians(20);
	
			x2 = x1 + radius * cos(angle2);
			y2 = y1 + radius * sin(angle2);
			
			x3 = x1 + radius * cos(angle3);
			y3 = y1 + radius * sin(angle3);	
			
			triangle(x1, y1, x2, y2, x3, y3);
		}
	
		theta += 0.002;
	}

	public void goToGame() {
		yPos = this.easing(time, 0, -700, duration);
		
		if (time < duration) time++;
		else { // callback once the animation is done
			goToGame = false;
			gameScreen = true;
			time = 0;
		}
	}

	public void goToMenu() {
		yPos = this.easing(time, -700, 700, duration);
		
		if (time < duration) time++;
		else { // callback once the animation is done
			goToMenu = false;
			gameScreen = false;
			time = 0;
		}
	}
	
	
	/*
	Elastic tweening function - based on the original equations
	by Robert Penner - http://www.robertpenner.com/easing/ (BSD licence)
	*/
	
	private float easing(float t, float b , float c, float d) {
		if (t == 0) return b;
		if ((t/=d) == 1) return b + c;  
		float p = d*.3f;
		float a = c; 
		float s = p / 4;
		return (a*(float)Math.pow(2,-10*t) * (float)Math.sin( (t*d-s)*(2*(float)Math.PI)/p ) + c + b);	
	}

}

