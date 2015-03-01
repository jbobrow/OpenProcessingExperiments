
void setup()
{
size(1000,1000);
background(75,100,45);
noStroke();
text("AWESOME",100,23);

rect(75,85,80,85);
triangle(45,100,75,100,100,300);
triangle(100,100,75,100,85,90);
fill(200,23,85);

size(700,700);


}

void draw(){  
int circleSize = 30;
int circleXpos = mouseX;
int circleYpos = mouseY;
ellipse(circleXpos,circleYpos,circleSize,circleSize);
frameRate(4);
ellipse(100, 75, 45, 90);
arc(60, 85, 100, 75, 0, PI/2);
}
