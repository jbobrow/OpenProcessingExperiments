
PFont myChosenFont;
 
String userInput = "", pass = "megan";
boolean matched = false;
 
void setup()
{
  size(500, 500);
  myChosenFont = loadFont("Algerian-48.vlw");
  textFont(myChosenFont, 15);
}
 
void draw()
{
  background(0);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
   if( matched == true)
 {
    drawshapes();
   

 }
   
}
 
void keyPressed()
{

  if (key != CODED)
    userInput += key;
  if(userInput.equalsIgnoreCase(pass))
    matched = true;
}

void userInput()
{
 if( matched == true)
 {
    drawshapes();
   

 }
}
 
 void drawshapes()
 {
    

background(255);
  int m = millis();
  noStroke();
  fill(m % 255,34,34);
  ellipse(30,30,50,50);
   fill(m 6,29,105);
   rect(300,300,70,70);
   fill(m % 206,42,204);
   triangle(300,100,350,200,300,200);
   
 }
