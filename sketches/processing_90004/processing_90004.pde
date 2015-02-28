
PFont myChosenFont;

String userInput = "", pass = "word";
boolean matched = false;

void setup()
{
  size(400, 400);
  myChosenFont = loadFont("JingJing-48.vlw");
  textFont(myChosenFont, 11);
}

void draw()
{
  background(0);
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
  float r = random(255);
  float g = random(255);
  float b = random(255);
  noStroke();
  fill(r, g, b);
  ellipse(50, 50, 50, 50);
  rect(35, 50, 30, 70);
  triangle(50, 50, 20, 80, 80, 80);
}

void keyPressed()
{
  /* you do not need to say key.toString() in the processing application. You can just say:
   userInput += key;
   However, when uploading to openprocessing, you will need to use toString()
   */
  if (key != CODED)
    userInput += key;
  if (userInput.equalsIgnoreCase(pass))
    matched = true;
}
