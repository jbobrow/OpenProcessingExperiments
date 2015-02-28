
void setup()
{
  size(600, 600);
  background(0, 255, 0);
  smooth();
  frameRate(90);
}

void draw()
{
  fill(255, 255, 255, 50);
  rect(0,0, height, width);

  fill(random(255), random(255), random(255) );  
  ellipse(mouseX, mouseY, mouseX, mouseY);
  noStroke();
  frameRate(30);

  fill(0, 0, 255, 40);
  quad(300, 300, 600, 300, 600, 300, 600, 600);
  
  fill(0, 0, 255, 40);
  triangle(0, 0, 300, 300, 0, 300);
  
  fill(255, 0, 0, 40);
  triangle(300, 0, 300, 300, 600, 0);

  fill(255, 0, 0, 40);
  triangle(300, 600, 300, 300, 0, 600);
  
  fill(0, 255, 0, 40);
  triangle(600, 600, 300, 300, 300, 600);

  fill(0, 255, 0, 40);
  triangle(0, 0, 300, 300, 300, 0);

  ellipse(mouseX-10, mouseY-10, mouseX,mouseY);
  
}
