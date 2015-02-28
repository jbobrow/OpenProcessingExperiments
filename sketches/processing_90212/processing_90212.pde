
PFont myChosenFont;
 
String userInput = "", pass = "11109866";
boolean matched = false;
float random;
float m,n,x,y,w,h,r,g,b,o,p,q,l,s,t; //All for my random variables 
 
void setup()
{
  size(400, 400);
  myChosenFont = loadFont("firstFont.vlw");
  textFont(myChosenFont, 15);
  frameRate(15);
}
 
void draw()
{
  background(0);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  drawShapes();
}
 
void keyPressed()
{
  if (key != CODED)
    userInput += key;
  if(userInput.equalsIgnoreCase(pass))
    matched = true;   
}

void drawShapes()
{
  if(matched == true)
  {
    o = random (1,399);
    p = random (1,399);
    q = random (1,399);
    l = random (1,399);
    s = random (1,399);
    t = random (1,399);
    m = random (1,399);
    n = random (1,399);
    x = random (1,399);
    y = random (1,399);
    w = random (5,50);
    h = random (5,50);
    r = random (0,255);
    g = random (0,255);
    b = random (0,255);
    background(0); // This is to make the words on screen disappear. I though it would be a good idea.
    fill(r,g,b);
    rect(n,m,w,h);
    ellipse(x,y,w,h);
    triangle(o,p,q,l,s,t);
  }
}
  

void userInput()      // I'm not sure what the purpose of this function is 
{
  if(matched == true)
  drawShapes();
}
