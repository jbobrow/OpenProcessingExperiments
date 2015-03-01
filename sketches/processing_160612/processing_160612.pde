
void setup()
{
  size(500,500);
  background(25,225,25);
  //noStropke();
  fill(25);
}

void draw(){  
  int circleSize = 23;
  int circleXpos = mouseX;
  int circleYpos = mouseY;
  fill(mouseX, mouseY, random(1 , 600));
    ellipse(circleXpos, circleYpos, circleSize, circleSize);
    
  }
