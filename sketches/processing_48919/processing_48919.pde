
void setup()
{
  size(400, 600);
  background(34, 154, 196);
  smooth();
}






void draw()
{
  fill(34, 154, 196, 2);
  rect(0,0, width, height);
  
  
  fill(random(255), random(255), random(255), 20);

  ellipse(mouseX, mouseY, 50, 50);
}

void mouseDragged()

{
  fill(random(255), random(255), random(255), 20);
   ellipse(mouseX, mouseY, 50, 50);
}

void keyPressed()

{
  save("snapshot.jpg");
}


