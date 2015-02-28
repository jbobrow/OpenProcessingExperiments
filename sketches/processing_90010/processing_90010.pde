
PFont myChosenFont;
 
String userInput = "", pass = "word";
boolean matched = false;
 
void setup()
{
  size(400, 400);
  myChosenFont = loadFont("AgencyFB-Reg-50.vlw");
  textFont(myChosenFont, 15);
  int x=0;
  int speed=1;
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
/* you do not need to say key.toString() in the processing application. You can just say:
    userInput += key;
  However, when uploading to openprocessing, you will need to use toString()
    */
  if (key != CODED)
    userInput += key;
  if(userInput.equalsIgnoreCase(pass))
    matched = true;
}
/* Ok so all the above code runs ok its only when I input the code below to draw the moving
   shapes i get into bother.. 
   */
void draw()
if (matched == true)
{
  fill(255,0,0);
  ellipse(x,123,20,20);
  x=x+speed;
  if(x+20>width||x<0)
  speed=speed*-1;
  fill(0,255,0);
  ellipse(x,256,20,20);
  x=x+speed;
  if(x+20>width||x<0)
  speed=speed*-1;
  fill(0,0,255);
  ellipse(x,389,20,20);
  x=x+speed;
  if(x+20>width||x<0)
  speed=speed*-1;
}
