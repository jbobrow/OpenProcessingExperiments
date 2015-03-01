
void setup() 
{

size(1000,800);
background(400,50,45);
noStroke();
frameRate(30);
}

void draw() { 
int circleSize = 30;
int circleXpos = mouseX;
int circleYpos = mouseY;
fill(mouseX,mouseY,random(0,255));
ellipse(circleXpos, circleYpos, circleSize, circleSize);

}

