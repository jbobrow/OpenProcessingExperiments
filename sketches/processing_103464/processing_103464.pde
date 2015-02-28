
void setup()
{
  size(600, 600);
  background(0);
}

void draw()
{

}

void mousePressed()
{
  float red = random(0, 255);
  float green = random(0, 255);
  float blue = random(0, 255);
  fill(red, green, blue);
  int size = random(10, 60);
  textSize(size);
  text("Hi Jack!!! \n This is Andrea! \n Bye Jack!!!", mouseX, mouseY)
}
