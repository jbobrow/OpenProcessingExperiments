
void setup()
{
  size(500,500);
  background(250,150,0);
  //noStroke();
  frameRate(10000);
}

void draw(){  
if(mousePressed == true) {
int circleSize = 3;
int circleXpose = mouseX;
int circleYpose = mouseY;
fill(mouseX,mouseY,random(250,5,5));
ellipse(circleXpose,circleYpose,circleSize,circleSize);}
}

