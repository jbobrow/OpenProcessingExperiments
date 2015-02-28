
PFont myChosenFont;
String input = "", pass = "word";
boolean matched = false;
int x = 10;
int speed = 1;
void setup()
{
 size(400, 400);
 myChosenFont = loadFont("myfont.vlw");
 textFont(myChosenFont, 15);
}
void draw()
{
 
 if(!matched)
 {
   background(0);
   text("Keep typing until password matches", width/3, 20);
   text("Enter text here: " + input, 0, height/2 - 20);
   text("Does the input match? True or false: " + matched, 0, height/2 + 20);
 }
 else
 drawShapes();
 
}

void keyPressed()
{
 if(key != CODED)
 {
  input += key;
  userInput(); 
 }
 if(key == BACKSPACE)
 {
  input = input.substring(0, input.length() - 2);
 }
}

void userInput()
{
 if(input.equals(pass))
 matched = true;
}

void drawShapes()
{
 
 background(255);
 fill(random(255), random(255), random(255));
 ellipse(x, height/2 , 20, 20);
 rectMode(CENTER);
 fill(random(255), random(255), random(255));
 rect(x, height/2 - 5, 10, 10);
 fill(random(255), random(255), random(255));
 rect(x, height/2 + 5, 10, 10);
 x = x + speed;
 if((x - 10) < 0 || (x + 10) > 400)
 {
  speed = speed * -1;
 }
}

