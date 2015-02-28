
int x = 0, speedX = 1;
float xfill;
PFont xFont; 
String userInput ="", pass = "bank";
boolean matched = false;

void setup()
{
  size(400,400);
  xFont = loadFont("BellMTItalic-24.vlw");
  textFont(xFont, 24);
}

void draw()
{
  userInput();
}

void userInput()
{
  background(0);
  text("Enter Password: " + userInput, 0, height/2);
  text("Does the input match? True or False: " + matched, 0, height/2 + 20);
}

void keyPressed()
{
  animateShape();
}

void animateShape()
{
  if (key!= CODED)
  userInput += key;
  if(userInput.equalsIgnoreCase(pass))
  {
    matched = true;
    if (keyCode == RIGHT)
   {
    background(255);
    rectMode(CENTER);
    xfill = random(255);
    fill(xfill);
    ellipse(x, height/2, 30, 30);
    rect(x - 20, height/2, 10, 10);
    rect(x + 20, height/2, 10, 10);
    x = x + speedX;
    if (x > width || x < 0)
    speedX = speedX * -1;
  }
}
}
