
float value = 0;
float num = random(0, 255);
float move = 0;

void setup() {
	size (400, 400);
	background(227, 226, 224);
	smooth();
	frameRate(30);
}

void keyPressed(){
		value = random(15, 210);;
		move = random(0, 400);
}

void draw(){
	

	//Draw main rectangle (body)
	fill(num, value+45, value-15, 50);
	rectMode(CENTER);
	rect(200,200, 300, 200);
	
	//Draw secondary rectangle (flash)
	fill(128, 200, 255, 50);
	//noStroke();
	rect(move, move+50, 90, 40);
	//rect(200, 80, 90, 40);
	

	//Draw tertiary rectangle (button)
	rect(90, 90, 15, 20);

	//Draw circle
	fill(255);
	stroke(0);
	ellipse(200, 210, value, value);
	
	//Draw letters I & M
	line(150, 170, 150, 250);
	line(175, 170, 175, 250);
	line(175, 170, 212.5, 210);
	line(212.5, 210, 250, 170);
	line(250, 170, 250, 250);

}


