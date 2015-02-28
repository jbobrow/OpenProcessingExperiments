
float r,g,b;
PFont myChosenFont;
 
String userInput = "", pass = "word";
boolean matched = false;

 
void setup()
{
  size(400, 400);
  myChosenFont = loadFont("AgencyFB-Bold-48.vlw");
  textFont(myChosenFont, 15);
}
 
void draw()
{
  background(0);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  if (matched == true );
  drawShapes();
}
 

void keyPressed()
{
/* you do not need to say key.toString() in the processing application. You can just say:
    userInput += key;
  However, when uploading to openprocessing, you will need to use toString()
    */
  if (key != CODED)
    userInput += key.toString;
  if(userInput.equalsIgnoreCase(pass))
    matched = true;
}

  void drawShapes()
{
  if (matched == true)
  {
  background(0);
  r=random(255);
  g=random(255);
  b=random(255);
  fill(r,g,b);
  rect (50,50,50,50);
  ellipse(150,150,80,80);
  triangle(200,200,250,150,250,250);
  }
}
