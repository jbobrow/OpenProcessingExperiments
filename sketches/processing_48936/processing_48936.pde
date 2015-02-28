

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(35);
}

void draw()
{
  fill(255,255,255,50);
  rect(0,0,width,height);
  fill(0, 255, 255);
  ellipse(mouseX, mouseY, mouseX, mouseY);
}

void mousedragged()
{
  fill(255,255,255,50 );
  ellipse(mouseX, mouseY,50, 50);
}

void keyPressed()
{
  //save("snapshot.png");
  background(255, 255, 255);
}


