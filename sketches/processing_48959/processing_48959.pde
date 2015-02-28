
void setup()

{
  size(400,600);
  background(198,238,245);
  smooth();

  frameRate(20);
  
}

void draw()
{
  strokeWeight(0);
  fill(random(0),random (200),random (200),50);
  line(400/2,600/2,mouseX,mouseY);
  ellipse(mouseX,mouseY,80,80);
 
}

void keyPressed()
{
  save("snapshot.jpg");
}

