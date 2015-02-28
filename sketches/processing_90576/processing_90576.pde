
PFont myChosenFont;
 
String userInput = "", password = "tianwenbin";
boolean matched = false;
int r,g,b;
 
void setup()
{
  size(400, 400);
  myChosenFont = loadFont("Andy-Bold-48.vlw");
  textFont(myChosenFont, 15);
}
void draw()
{
  background(0);
  text("Keep trying until password matches", width/3, 20);
  text("Enter text here:" + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  if(userInput.equals(password))
  {
    if (frameCount % 340 == 0)
      background(255);
    if (frameCount % 60 == 0)
    {
      r = (int) random(255);
      g = (int) random(255);
      b = (int) random(255);
    }
    fill(r, g, b);
    rect(random(width - 40), random(height-40), 40, 40);
  }
}
 
void keyPressed()
{
  if (key != CODED)
  userInput += key.toString();
  if(userInput.equals(password))
  matched = true;
}
