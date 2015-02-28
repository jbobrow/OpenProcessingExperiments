
class Interface {

	public Interface() {
		//
	}
	
	public void drawImage(float yPos) {
		this.skyGradient();
		this.spinningSun();
		
		image(bgAlpha, 0, 86 + yPos);
        image(bgPlain, 0, 313 + yPos);
        
		this.drawAudience();
		this.displayScore();
		if(gameScreen) game.sumoDraw();
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
				
				if(action == "goToPlay") {
					goToGame = true;
					time = 0;
					goToMenu = false;
				}
				
				if(action == "goToMenu") {
					goToGame = false;
					gameScreen = false;
					time = 0;
					goToMenu = true;
					
					//this.pauseGame();
				}
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
	
	private void drawAudience() {
		for (int i = 0; i <= width; i+=20) {
			fill (random(100,200), random(100,200), random(100, 200));
			ellipse(i - 10, yPos+720, 10, 10);
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
	
	/* Go to game/menu screens */

	public void goToGame() {
		yPos = this.easing(time, 0, -700, duration);
		
		
		if(time > 60) this.setDisplayText("Let the game begin!", 80);
		
		if (time < duration) time++;
		else { // callback once the animation is done
			goToGame = false;
			gameScreen = true;
			this.startGame();
			time = 0;
		}
	}

	public void goToMenu() {
		this.stopGame();
		yPos = this.easing(time, -700, 700, duration);
		
		if (time < duration) time++;
		else { // callback once the animation is done
			goToMenu = false;
			gameScreen = false;
			time = 0;
		}
	}
	
	
	/* Start a game */
	
	private void startGame() {
		game.startUp();
		game.newRound();
	}
	
	
	/* Stop a game */
	
	private void stopGame() {
		game.resetGame();
		game.shutDown();
	}
	
	
	/* Show scores */
	
	public void setDisplayText(String txt, int setDisplayTime) {
		textTime = 0;
		textDisplayed = true;
		textToDisplay = txt;
		displayTime = setDisplayTime;
	}
	
	public void displayText(String txt) {
		textTime++;
		textFont(bello, 32);
		fill(30, 15, 10);
		text(txt, 300, yPos+1320);
	}
	
	private void displayScore() {
		fill(255);
		textFont(bello, 26);
		text(game.p1score + " / 4", 130, 895 + yPos);
		text(game.p2score + " / 4", 470, 895 + yPos);
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

