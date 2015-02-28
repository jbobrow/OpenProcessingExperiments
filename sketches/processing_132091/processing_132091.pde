

void setup() {
	size (400, 400);
	background(227, 226, 224);
	smooth();
	frameRate(30);
}

void draw(){

	//Draw main rectangle (body)
	fill(mouseX, 200, mouseY, 50);
	rectMode(CENTER);
	rect(200,200, 300, 200);
	
	//Draw secondary rectangle (flash)
	fill(128, 200, 255, 50);
	//noStroke();
	rect(mouseX, mouseY, 90, 40);
	//rect(200, 80, 90, 40);
	

	//Draw tertiary rectangle (button)
	rect(90, 90, 15, 20);

	//Draw circle
	fill(255);
	stroke(0);
	ellipse(200, 210, mouseX, mouseY);
	
	//Draw letters I & M
	line(150, 170, 150, 250);
	line(175, 170, 175, 250);
	line(175, 170, 212.5, 210);
	line(212.5, 210, 250, 170);
	line(250, 170, 250, 250);
	

	

}


