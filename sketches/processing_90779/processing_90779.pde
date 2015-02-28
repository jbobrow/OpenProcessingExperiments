
PFont myChosenFont;
float r;
float g;
float b;
int velocityX;
int currentX, currentY;
 
String userInput = "", pass = "word";
boolean matched = false;
 
void setup()
{
  size(400, 400);
  myChosenFont = loadFont("AngsanaNew-48.vlw");
  textFont(myChosenFont, 15);
  smooth();
  velocityX = 1;
  currentX = 0;
  currentY = height/2;
}
 
void draw()
{
  background(0);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  if (matched == true)
  {
   background(255);
   r = random(255);
   g = random(255);
   b = random(255);
   fill(r, g, b);
   ellipse(currentX, currentY, 50, 50);
   triangle(30, 300, 50, 250, 150, 300); 
   rect(250, 350, 40, 40);
   currentX = currentX + velocityX;
   if (currentX > width)
   {
     velocityX = velocityX * -1;
   }
   if (currentX < 0)
   {
     velocityX = velocityX * -1;
   }  
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
  if(userInput.equalsIgnoreCase(pass))
    matched = true;
}
