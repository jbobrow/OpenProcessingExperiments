
void setup()
{
  size(600, 600);
  background(0, 0, 0);
  smooth();
  frameRate(60);
}

void draw()
{  
  if (mousePressed)
  fill(random (255), random (255) , random(255));
  triangle(300, 200, 250, 275, 350, 275);
  triangle(250, 275, 200, 350, 300, 350);
  triangle(350, 275, 300, 350, 400, 350);
  fill(242, 207, 2);

 

}


