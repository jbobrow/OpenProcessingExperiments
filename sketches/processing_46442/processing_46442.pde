
	PImage upperLeft, upperRight, lowerLeft, lowerRight, tmp;
	boolean doGray, doTint, doScale = false;

	int red, green, blue;
	int radius = 0;

	public void setup() {
		size(600, 600);
		// load pictures
		upperLeft = loadImage("linksO.jpg");
		upperRight = loadImage("rechtsO.jpg");
		lowerLeft = loadImage("linksU.jpg");
		lowerRight = loadImage("rechtsU.jpg");
	}

	public void draw() {
		background(255);
		// paint lowerRight picture and use blur filter with radius
		image(lowerRight, 300, 300);
		filter(BLUR, radius);
		// get the area of the lowerRight picture and save them into tmp
		tmp = get(300, 300, 300, 300);
		image(upperLeft, 0, 0);
		// check whether to use filter or not
		if (doGray) {
			filter(GRAY);
		}
		// paint the lowerRight picture again because filterGray effects all
		// images above
		image(tmp, 300, 300);
		if (doTint) {
			// tint the picture with the random colors red, blue, green
			tint(red, blue, green);
		}
		image(upperRight, 300, 0);
		// remove the tint from all following pictures
		noTint();
		// maousePressed is a existing boolean
		if (mousePressed) {
			// check if the mouse is in the lower left quadrant
			if (mouseX < 300 && mouseY > 300) {
				// scale the image from the start point 0, 300 to the current
				// mouse position
				// subtract 300 from the current mouseY value for correct
				// scaling
				image(lowerLeft, 0, 300, mouseX, mouseY - 300);
			}
		} else {
			// draw the picture if mouse isn�t pressed
			image(lowerLeft, 0, 300);
		}

	}

	public void mouseClicked() {
		// check if the mouse is in the upper left quadrant
		if (mouseX < 300 && mouseY < 300) {
			// first click boolean is true, second click is false so first click
			// picture is gray, second click it�s not
			doGray = !doGray;
		}
		if (mouseX > 300 && mouseY < 300) {
			// generates random numbers within the intervall [0, 255]
			// representing the RGB values for the tint
			red = (int) random(0, 255);
			green = (int) random(0, 255);
			blue = (int) random(0, 255);
			doTint = !doTint;
		}
		if (mouseX > 300 && mouseY > 300) {
			// checks if the radius is 3 and if this is true it goes back to 0
			if (radius == 3) {
				radius = 0;
				// if the radius is not 3 it increments the radius +1
			} else {
				radius = radius + 1;

			}
		}
	}

