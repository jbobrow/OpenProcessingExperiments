
PFont myChosenFont;
int x = 26, speedX = 1, p= 150, directionP =1, y = 40, sizeY=1;
String userInput = "", pass = "word";
boolean matched = false;
 
void setup()
{
  size(400, 400);
  myChosenFont = loadFont("AngsanaNew-Bold-48.vlw");
  textFont(myChosenFont, 15);
}
 
void draw()
{
  background(0);
  fill(255);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  if (matched == true)
  {   
    userInput();
}
}

 void userInput()
 {
    background(0);
    fill(255, 0, 0);
    ellipse(x, 50, 50, 50);
    x= x + speedX;
    if(x>width-25)
    speedX=speedX*-1;
    if(x<25)
    speedX= speedX*-1;
    fill(p, 200, 0);
    triangle(200, 150, 150, 250, 250, 250);
    p=p+directionP;
    if (p == 255)
    directionP = directionP*-1;
    if (p==0)
    directionP = directionP*-1;
    rectMode(CENTER);
    fill(0, 255, 255);
    rect(350, 200, 40, y);
    y=y+sizeY;
    if (y>150)
    sizeY=sizeY*-1;
    if (y==0) 
    sizeY=sizeY*-1;
  }
void keyPressed()
{
  if (key != CODED)
    userInput += key.toString;
  if(userInput.equalsIgnoreCase(pass))
    matched = true;
}
