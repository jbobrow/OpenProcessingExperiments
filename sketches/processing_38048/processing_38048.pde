
void setup()
{

size(500, 500);
background(0, 0, 0);
smooth();
stroke(0, 255, 255);
}

void draw()
{
  background(0, 0, 0);

  for(int i = 0; i <= 500; i += 25)
  {
    line(i, 0, mouseX, mouseY);
    line(i, 500, mouseX, mouseY);
  }

}
                
