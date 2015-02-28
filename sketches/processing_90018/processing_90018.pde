
PFont myChosenFont;
 
String userInput = "", pass = "word";
boolean matched = false;
 
void setup()
{
  size(400, 400);
  myChosenFont = loadFont("Arial.vlw"); 
  textFont(myChosenFont, 15);
}
 
void draw()
{
  fill(255);
  background(0);
  text("Keep typing until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  
}


  void keyPressed()
  {
    if (key != CODED)
      userInput += key;
    
    if(userInput.equalsIgnoreCase(pass))
    {
      matched = true;
      
      int r = (int)random(0,255);
      int g = (int)random(0,255);
      int b = (int)random(0,255);
      background(0);
      fill(r,g,b);
      rect(20,20,100,50);
      fill(b,r,g);
      ellipse(width/2,height-100,100,50);
      fill(g,b,r);
      triangle(160,200,200,240,200,200);
    } 
  }
