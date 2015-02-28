
float num = random(0, 255);
float value = 0;
float move = 0;
float speed1 = random(1, 10);
float speed2 = 1;
float speed3 = 3;
float speed4 = 1.5;
float circleX = 0;
float circleY = 0;
float rectX = 90;

void setup() {
	size (400, 400);
	background(227, 226, 224);
	smooth();
	frameRate(30);
}

void keyPressed(){
		value = random(15, 210);;
		//move = random(0, 400);
}

void draw(){
	
	//Draw main rectangle (body)
	fill(num, value+45, value-15, 50);
	rectMode(CENTER);
	rect(200,200, 300, 200);
	
	//Draw secondary rectangle (flash)
	fill(move, value+20, value-10, 50);

	rect(move, move, 90, 40);
	move += speed3;

	if (move >= width){
		move = 0;
	}
	

	//Draw tertiary rectangle (button)
	fill(num, value, value-15, 50);
	rect(rectX, 90, 15, 20);
	rectX += speed4;
	if (rectX >= 310 || rectX <= 90){
		speed4 = speed4 * -1;
	}

	//Draw circle
	fill(circleX, circleY, 100);
	stroke(0);
	ellipse(circleX, circleY, 150, 150);
	//Motion
	circleX += speed1;
	circleY += speed2;
	//Bounce
	if (circleX >= width || circleX <= 0){
		speed1 = speed1 * -1;
	} 
	if (circleY >= height || circleY <= 0){
		speed2 = speed2 * -1.2;
	}
	
	//Draw letters I & M
	line(150, 170, 150, 250);
	line(175, 170, 175, 250);
	line(175, 170, 212.5, 210);
	line(212.5, 210, 250, 170);
	line(250, 170, 250, 250);

}


