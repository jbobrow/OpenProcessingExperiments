
PFont myChosenFont;
 
String userInput = "", pass = "word";
boolean matched = false;
 
void setup()
{
  size(400, 400);
  myChosenFont = loadFont("AngsanaUPC-Bold-48.vlw");
  textFont(myChosenFont, 15);
  frameRate(30);
}
 
void draw()
{
  background(0);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
   if(userInput.equalsIgnoreCase(pass))
  drawShape();
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
    
      
      
      
      
void drawShape ()
{ 
  background(255);
  float r= random(1,255); //red value 
  float g= random(1,255);  //green value
  float b= random(1,255);  //blue value
  stroke(r,g,b);  //rect colour
  fill(r,g,b);  //rect colour
  rect(80,100,100,100);
  stroke(r,g,b);  //ellipse1 colour
  fill(r,g,b);   //ellipse1 colour
  ellipse(300,250,100,100);
  stroke(r,g,b);  //ellipse2 colour
  fill(r,g,b); //ellipse2 colour
  ellipse(70,40,30,30);
}
