
PFont font;
String userInput = "", pass = "password";
boolean correct = false;

void setup()
{
  size(400, 400);
  font = loadFont("Serif-48.vlw");
  textFont(font, 20);
}

void draw()
{
  background(0);
  text("Keep Trying...Dont Give Up", width/3, 20);
  text("Enter password here: " + userInput, 0, height/2 - 20);
  text("Are you right? True/False?: " + correct, 0, height/2 + 20);
  text("Hint: The word is on the screen", 0, height/2 + 50);
 
}

void keyPressed()
{
  if (key != CODED)
  userInput += key.toString();
  if(userInput.equalsIgnoreCase(pass))
  correct = true;
}
