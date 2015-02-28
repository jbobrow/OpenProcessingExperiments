
PFont myChosenFont;
 
String userInput = "", pass = "word";
boolean matched = false;
float r=random(255);
float g=random(255);
float b=random(255);
 
void setup()
{
  size(400, 400);
  myChosenFont = loadFont("Algerian-48.vlw");
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
/* you do not need to say key.toString() in the processing application. You can just say:
    userInput += key;
  However, when uploading to openprocessing, you will need to use toString()
    */
  if (key != CODED)
    userInput += key.toString();
  if(userInput.equalsIgnoreCase(pass))
    matched = true;
    if (matched==true)
      {
 fill(r,g,b);
 ellipse(width/4,height/4,30,30);
 fill(r,g,b);
rect(width/4*3,height/4*3,30,40);
fill(r,g,b);
triangle(width/2-20,height/4+20,width/2,height/4-20,width/2+20,height/2);
fill(0);
  }
}
