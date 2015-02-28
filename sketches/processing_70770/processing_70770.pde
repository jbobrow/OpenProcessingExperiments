
void setup()
  {
  size (500, 500);
  fill(255, 255, 255);
  smooth();
  noStroke();
  }
  
void draw()
  {
  background(255, 255, 255);
  
  float xPos;
  float yPos;
  int circleSize = 15;
  int circleDistance = 15;
  float aPos;
  float bPos;
  int rectSize = 15;
  int rectDistance = 15;
  
  
  
  for (int x=75; x< 260; x=x+circleSize)
  {
  for (int y=75; y< 425 ; y=y+circleDistance)
  {
  xPos = x + random(mouseX/15);
  yPos = y + random(mouseY/15);
  noStroke();
  fill(0);
  ellipse(xPos, yPos, 9, 9);
  
  }  
  }
  
  for (int a=0; a<185; a=a+rectSize)
  {
  for (int b=0; b<360; b=b+rectDistance)
  {
  aPos = a + random(mouseX/20);
  bPos = b + random(mouseY/20);
  noFill();
  rect(240, 75, aPos , bPos);
  stroke(random(255), random(255), random(255));
     
  }
  }
  }
