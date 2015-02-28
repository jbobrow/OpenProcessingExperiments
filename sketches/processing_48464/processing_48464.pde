
void setup()
{
  size(400, 600);
  background(100, 175, 201);
  smooth();
  frameRate(30);
  strokeWeight(1);
}

void draw()
{
 // fill(115, random(75), random(201));
  //line(width/2, height/2, mouseX, mouseY);

  //ellipse(mouseX, mouseY, 5, 5);
}
void mouseDragged()
{
  fill(random (255), random(255), random(255));
  line(width/2, height/2, mouseX, mouseY);

  rect(mouseX, mouseY,1,1,15,15);
}
void keyPressed()
{
 background(random (255)); 
}


