
String userInput = "", pass = "word";
boolean matched = false;
PFont myownFont;

void setup()
{
  size(500,500);
  background(0);
  frameRate(30);
  myownFont = loadFont("TimesNewRomanPS-BoldItalicMT-48.vlw");
  textFont(myownFont, 15);
}

void draw()
{
  userInput();
}

void keyPressed()
{
  if (key != CODED)
    userInput += key.toString();
  if (userInput.equalsIgnoreCase(pass))
    matched = true;
}


void userInput()
{
  textFont(myownFont, 20);
  text("Please Enter Correct Password", 50, 50);
  textFont(myownFont, 15);
  text("Enter Password Here - " + userInput, 110,200);
  if (matched == true)
  {
    drawShapes();
  }
  
}

void drawShapes()
{
  background(0);
  if (mousePressed)
  {
    int shapeColour1 = int (random(255));
    int shapeColour2 = int (random(255));
    int shapeColour3 = int (random(255));
    float r = random(30);
    strokeWeight(r);
    fill(shapeColour1,shapeColour2,shapeColour3);
    frameRate(2);
    rect(350,80,50,50);
    triangle(200,300,250,220,300,300);
    rect(100,350,300,40);
    fill(shapeColour1,shapeColour2);
    rect(100,80,50,50);
     
  }
  else
  {
    text("Press A Mouse Button!!", 10,50);
  }
}
