
String demoString = "";

void setup()
{
  size(200, 200);
}

void draw()
{
  background(0);
  text(demoString, 0, height/2);
}

void keyPressed()
{
  demoString += key;
}
