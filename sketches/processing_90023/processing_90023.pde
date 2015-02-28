
PFont myChosenFont;
boolean randomColour = false;
int r = 0, g = 0, b = 0;
 
String userInput = "", pass = "hi";
boolean matched = false;
 
void setup()
{
  size(400, 400);
  myChosenFont = loadFont("Andy-Bold-48.vlw");
  textFont(myChosenFont, 20);
}
 
void draw()
{
  background(0);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
}
 
void keyPressed()
{
  if (key != CODED)
    userInput += key;
  if(userInput.equalsIgnoreCase(pass))
    matched = true;
    {
       background(255);
    }
       if (randomColour)
  {
    r = (int) random(255);
    g = (int) random(255);
    b = (int) random(255);
  }
  fill(r,g,b);
  rect(30,30,50,50);
  triangle(90,350,30,390,100,390);
  ellipse(200,200,60, 60);
  randomColour = !randomColour;
}
