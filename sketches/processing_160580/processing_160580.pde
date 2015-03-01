
void setup()
{
  size(500,500);
  background(200,150,0)
  frameRate(0)
  noStroke();
}

void draw(){  
  int circleSize = 5;
  int circleXpos = mouseX;
  int circleYpos = mouseY;
  fill(mouseX,mouseY,random(20,200));
  ellipse(circleXpos,circleYpos,circleSize,circleSize);
  ellipse(250,250,50,50);
  if (keyPressed) {
  if (key =='s' || key == 'S'){
  saveFrame("line-######.png");}
  }
  
}
