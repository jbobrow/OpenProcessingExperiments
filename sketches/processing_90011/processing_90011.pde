
PFont myChosenFont;

String userInput = "", pass = "word";
boolean matched = false;

void setup()
{
  size(400, 400);
  myChosenFont = loadFont("FelixTitlingMT-48.vlw");
  textFont(myChosenFont, 15);
}

void userInput()
{

  fill(random(255),random(255),random(255));
  ellipse(200, 100, 140, 60);
   fill(random(255),random(255),random(255));
  ellipse(200, 100, 60, 60);
   fill(random(255),random(255),random(255));
 ellipse(200, 100, 10, 10);
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

  void keyPressed()
  {
    /* you do not need to say key.toString() in the processing application. You can just say:
     userInput += key;
     However, when uploading to openprocessing, you will need to use toString()
     */
    if (key != CODED)
      userInput += key.toString();
    if (userInput.equalsIgnoreCase(pass))
      matched = true;
  if (matched == true)
  {
    userInput();
  }
}
