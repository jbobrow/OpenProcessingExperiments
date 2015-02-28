

void setup(){
	size(800,600);
	smooth();
	frameRate(30);	
}
void draw(){
	//draw random colorful circles in the background
	float r = random(255);
	float g = random(255);
	float b = random(255);
	float a = random(255);
	float diam = random(80);
	float x = random(width);
	float y = random(height);
	noStroke();
	fill(r,g,b,a);
	ellipse(x,y,diam,diam);
	
	//define random values that update
	float twitch = random(-2,2);
	float eyeColor = random(255);
	
	//main body
	fill(252,234,140,eyeColor);
	stroke(0,0,0,0);
	rectMode(CENTER);
	rect(mouseX,mouseY,250,400);
	//left eye
	fill(200,eyeColor,eyeColor);
	stroke(0);
	strokeWeight(2);
	ellipse(mouseX-125,mouseY-100,150,150);
	//left pupil
	fill(0);
	stroke(0);
	ellipse(((mouseX-150)-twitch),mouseY-80,25,25);
	//right eye
	fill(200,eyeColor,eyeColor);
	ellipse(mouseX+125,mouseY-80,75,75);
	//right pupil
	fill(0);
	stroke(0);
	ellipse(mouseX+115,mouseY-75,10,10); 
	//mouth
	fill(45); 
	stroke(255,20,20,175); 
	strokeWeight(10);
	rectMode(CENTER);
	rect(mouseX,mouseY+140,210,75+(twitch*4));
	//left arm
	stroke(0);
	strokeWeight(10);
	line(mouseX-125,mouseY+70,100,230);
	//right arm
	stroke(0);
	strokeWeight(10);
	line(mouseX+125,mouseY+70,700+twitch,230); 
}
void mousePressed(){
	background(255);
	
}

