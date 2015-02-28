
float scale = 1;

void setup()
{
  size(600, 600);
  background(255, 255, 255);
}


void draw()
{
  fill(0, 0, 0, 50);
  
  translate(mouseX, mouseY);
  textSize(48);
  
  if (mousePressed)
  {
     scale = scale + 0.01;
     scale(scale);
     text("Hello!", 0, 0);
  }

}

