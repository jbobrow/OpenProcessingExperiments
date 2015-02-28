
PFont myChosenFont;

float random;
float r, g, b;
float a, c, d, f, x, y;


String userInput = "", pass = "word";  
boolean matched = false;  
void setup()  
{  
  size(400, 400);  
  frameRate (5);
}  

void draw()  
{  
  background(0);  
  text("Keep tying until password matches", width/3, 20);  
  text("Enter text here: " + userInput, 0, height/2 - 20);  
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);  
  if (matched == true);
  drawAnimation();
}  

void keyPressed()  
{  
  if (key != CODED) 
 {
  userInput += key.toString();
 } 
  if(userInput.equalsIgnoreCase(pass))
{  
   matched = true;
}
}
 void drawAnimation()
 {
   if (matched == true)
   {
   r = random (255);
   g = random (255);
   b = random (255);
   
   a = random (300);
   c = random (300);
   d = random (300);
   f = random (300);
   x = random (300);
   y = random (300);
   
   background (r, g, b);
   fill (255);
   rect (a, c, d, f);
   fill (0);
   ellipse (a, c, d, f);
   fill (255, 255, 0);
   triangle (a, c, d, f, x, y);
 }
 }
