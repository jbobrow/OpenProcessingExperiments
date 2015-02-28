
float random;
float r, g, b;
float x, y, w, h, j, k;

PFont myChosenFont;
 
String userInput = "", pass = "word";
boolean matched = false;
 
void setup()
{
  size(400, 400);
  myChosenFont = loadFont("SimplifiedArabic-Bold-48.vlw");
  textFont(myChosenFont, 15);
  frameRate (10);
}
 
void draw()
{
  background(0);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  if (matched == true);
  drawShapes();
}


 
void keyPressed()
{
/* you do not need to say key.toString() in the processing application. You can just say:
    userInput += key;
  However, when uploading to openprocessing, you will need to use .toString()
    */
  if (key != CODED)
    userInput += key;
  if(userInput.equalsIgnoreCase(pass))
    matched = true;
}

void drawShapes ()
{
  if (matched == true)
  {
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    w = random(400);
    h = random(400);
    x = random(400);
    y = random(400);
    j = random(400);
    k = random(400);
    background(0);
    fill(r, g, b);
    rect(x, y, w,h);
    fill(r, g, b);
    ellipse(x, y, w, h);
    fill(r, g, b);
    triangle( x, y, w, h, j, k);
  }
}
