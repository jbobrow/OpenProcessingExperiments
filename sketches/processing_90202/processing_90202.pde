
PFont myChosenFont;
 
String userInput = "", pass = "colour";
boolean matched = false;
float r,g,b;
 
void setup()
{
  size(400, 400);
  myChosenFont = loadFont("Raavi-48.vlw");
  textFont(myChosenFont, 15);
}
 
void draw()
{
  background(0);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  drawShapes();
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

void drawShapes()
{
  if(matched == true)
  {
    background(0); //black background
    r=random(255);//assigns random color values
    g=random(255);
    b=random(255);
    stroke(0);//outline to shape
    rect(20,30,50,30);//size of rectngle
    r=random(255);
    g=random(255);
    b=random(255);
    stroke(0);//outline to shape
    ellipse(200,190,40,40);//size of ellipse
    fill(r,g,b);//gives the shape a reoccurring colour change
    
  }
}
