
PFont myChosenFont;
 
String userInput = "", pass = "word";
boolean matched = false;
 
void setup()
{
  size(400, 400);
  myChosenFont = loadFont("AgencyFB-Reg-20.vlw");
  textFont(myChosenFont, 15);
}
 
void draw()
{
  {
   userInput();
  }
  background(0);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);

}
  
void keyPressed()
{
/* you do not need to say key.toString() in the processing application. You can just say:
    userInput += key;
  However, when uploading to openprocessing, you will need to use toString()
    */
  if (key != CODED)
    userInput += key.toString()
  if(userInput.equalsIgnoreCase(pass))
    matched = true;
  {
  fill(random(255),random(255),random(255));
  rect(10,height/2 + 40,50,50);
  ellipse(width/2,height/2+65,50,50);
  rect(340,height/2+40,50,50);
  }
}
void userInput()
{

}
//unable to get fully completed
