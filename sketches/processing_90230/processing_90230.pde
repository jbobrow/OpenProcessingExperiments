
int x1 = 10, y1 = 175, y2 = 175;
PFont newfont;
 
String userInput = "", pass = "word";
boolean matched = false;
 
void setup()
{
  size(500, 400);
  newfont = loadFont("Serif.bold-48.vlw");
  textFont(newfont, 20);
}
 
void draw()
{
  background(0);
  text("Keep tying until password matches", width/4-20, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  userInput();
}
 
void keyPressed()
{
  if (key != CODED)
    userInput += key.toString();
  if(userInput.equalsIgnoreCase(pass))
    matched = true;
  if (key == 'r') // Press r to animate
  {
  x1 = x1 + 1;
  y1 = y1 + 1;
  y2 = y2 - 1;
  }
}
void userInput()
{
  if (matched == true)
  {
    background(0);
    fill(255);
    rect(x1,y1,50,50);
    rect(x1,175,50,50);
    rect(x1,y2,50,50);
  }
}
