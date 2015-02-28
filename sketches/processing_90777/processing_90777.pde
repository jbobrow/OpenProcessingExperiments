
PFont myChosenFont;
 
String userInput = "", pass = "word";
boolean matched = false;

float r,g,b;
float x1,x2,x3,y1,y2,y3;
float t,wh,y;
float c1,c2,c3,c4;

void setup()
{
  size(400, 400);
  myChosenFont = loadFont("AgencyFB-Reg-48.vlw");
  textFont(myChosenFont, 15);
  frameRate(60);
}
 
void draw()
{
  background(0);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  if (matched == true)
  {
    animation();
  }
}
 
void keyPressed()
{
/* you do not need to say key.toString() in the processing application. You can just say:
    userInput += key;
  However, when uploading to openprocessing, you will need to use toString()
    */
  if (key != CODED)
    userInput += key.toString();
  if(userInput.equalsIgnoreCase(pass))
    matched = true;
}

void animation()
{
  r = random(0,255);
  g = random(0,255);
  b = random(0,255);
  t = random(100,300);
  y = random(100,300);
  wh = random(0,300);
  c1 = random(25,375);
  c2 = random(25,375);
  c3 = 25;
  c4 = 25;
  x1 = random(100,300);
  x2 = random(100,300);
  x3 = random(100,300);
  y1 = random(100,300);
  y2 = random(100,300);
  y3 = random(100,300);
  fill(r,g,b);
  background(b,g,r);
  ellipse(t,y,wh,wh);
  fill(g,b,r);
  rectMode(CENTER);
  rect(c1,c2,c3,c4);
  fill(b,r,g);
  triangle(x1,y1,x2,y2,x3,y3);
  fill(255);
  text("12134376");
}
