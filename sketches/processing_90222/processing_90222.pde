
PFont myChosenFont;
 
String userInput = "", pass = "word";
boolean matched = false;
 
void setup()
{
  size(400, 400);
  myChosenFont = loadFont("ArialMT-48.vlw");
  textFont(myChosenFont, 15);
}
 
void draw()
{
  background(150);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  if(userInput.equalsIgnoreCase(pass))
  ClassRoom();
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

 void ClassRoom()
{
  if(matched == true);
float r = random(1,255);
float g = random(1,255);
float b = random(1,255);
stroke(r,g,b);  
fill(r,g,b);
ellipse(100,100,80,80);
stroke(r,g,b);
fill (r,g,b);
rect(200,200,110,110);
stroke(r,g,b);
fill(r,g,b);
triangle(150,200,230,150,190,60);
stroke(r,g,b);
fill(r,g,b);
rect(80,300,40,60);

}
