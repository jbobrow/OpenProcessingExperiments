
PFont myChosenFont;
 
String userInput = "", pass = "word";
boolean matched = false;


void setup()
{
  size(400, 400);
  myChosenFont = loadFont("MinionPro-Bold-48.vlw");
  textFont(myChosenFont, 15);
}
 
void draw()
{
  background(0);
  text("Keep typing until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  userinput();
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

void userinput()
{
  if(matched == true)
  {
    
  background(255,59,220);
  strokeWeight(10);
  line(70,20,140,160);
  line(140,20,70,160);
  line(330,20,260,160);
  line(260,20,330,160);
  strokeWeight(10);
  line(30,300,260,300);
  
  }
}
