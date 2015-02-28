
PFont myFont;
  
String myInput = "", pass = "word";
boolean matched = false;
  
void setup()
{
  size(400, 400);
  myFont = loadFont("Aharoni-Bold-48.vlw");
  textFont(myFont, 20);
}
  
void draw()
{
     background(255);
  fill(10);
  text("Keep tying until password matches", width/10, 80);
  text("Enter text here: " + myInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  if(myInput.equalsIgnoreCase(pass))
  {
    ellipse(100,100,50,50);
    fill(255,0,0);
    rect(50,50,50,50);
    fill(0,0,255);
    ellipse(200,200,100,100);
  }
}
  
void keyPressed()
{
  if (key != CODED)
    myInput += key.toString();
  if(myInput.equalsIgnoreCase(pass))
    matched = true;
}



