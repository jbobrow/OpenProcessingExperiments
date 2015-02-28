
PFont myChosenFont;
 
String userInput = "", pass = "word";
boolean matched = false;
float r,g,b;
int x = 0 , speedX =1;
float x2;
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
  drawShapes();
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

void drawShapes()
{
if (matched == true)
{
  x2= random(width);
  r=random(255); 
  g=random(255);
  b=random(255);
  triangle(width/4,height*3/4,width/4-20,height*3/4+40,width/4+20,height*3/4+40);
  rect(x,height*3/4,40,40);
  x=x+speedX;
  ellipse(width*3/4,height*3/4+20,x2,40);
  fill(r,g,b);
  if (x>width-40 || x<0)
     speedX = speedX* -1;
}
}
