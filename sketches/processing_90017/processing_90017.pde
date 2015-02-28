
PFont myChosenFont;

String userInput = "", pass = "word";
boolean matched = false;

void setup()
{
  size(400, 400);
  myChosenFont = loadFont("Andalus-48.vlw");
  textFont(myChosenFont, 15);
}

void draw()
{
  background(0);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);

}





void keyPressed()
{

  if (key != CODED)
    userInput += key;
  if(userInput.equalsIgnoreCase(pass))
    matched = true;
   
    userInput();
}


void userInput()
{
 { 
 ellipse(100, 100, 100, 100);
  fill (random(255));
 
  
  
  
  
 }
 
}
