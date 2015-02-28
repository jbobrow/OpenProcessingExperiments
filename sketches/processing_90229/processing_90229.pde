
String userInput = "", pass = "password";
boolean matched = false;
int rx;
int ry;

void setup()
 {
   size(400,400);
  rx=1;
  ry=1;
  frameRate=2;
 

}
 
void draw()
{
  background(0);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
  if(userInput.equalsIgnoreCase(pass))
  {
 shapes();
  }

}
 
void keyPressed()
{
  if (key != CODED)
    userInput += key.toString();
  if(userInput.equalsIgnoreCase(pass))
    matched = true;
}

void shapes()
{
  fill(255,0,0);
  rect(rx,ry,50,50);
  rx=rx+5;
  ry=ry+5;
  fill(0,255,0);
  ellipse(100,100,100,100);
  fill(0,0,200);
  ellipse(300,300,100,100);
 }
