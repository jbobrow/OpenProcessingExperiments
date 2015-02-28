
PFont myChosenFont;
 
String userInput = "", pass = "word";
boolean matched = false;
float r, g, b;
 
void setup()
{
  size(400, 400);
  myChosenFont = loadFont("Andy-Bold-48.vlw");
  textFont(myChosenFont, 15);
}
 
void draw()
{
  background(0);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  if(matched == true);
  drawShapes();
}

 
void keyPressed()
{
  if(key != CODED)
  {
    userInput += key;
  }
  if(userInput.equalsIgnoreCase(pass))
  {
    matched = true;
  }
}

void drawShapes()
{
  if(matched == true)
  {
    r = random(255);
    g = random(255);
    b = random(255);
    background(0);
    fill(r, g, b);
    rect(100, 100, 50, 50);
    ellipseMode(CENTER);
    ellipse(200, 200, 60, 60);
    triangle(80, 300, 160, 300, 120, 240);
  }
}
