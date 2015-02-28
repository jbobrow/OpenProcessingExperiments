
PFont myChosenFont;
 
String Input = "", pass = "word";
boolean matched = false;
 
void setup()
{
  background(0);
  size(400, 400);
  myChosenFont = loadFont("ArialNarrow-48.vlw");
  textFont(myChosenFont, 15);
}
 
void draw()
{
  frameRate(13); // slows down the speed of the program
  userInput(); // screen allows you to input password
  matchScreen(); // appears if password is correct
}

void userInput()
{
  background(0);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + Input, 0, height/2 - 20);
  
 
 if (keyPressed)
{
  if (key != CODED)
    Input += key.toString();
  }
}
 
 void matchScreen() // appears when 'word' is inputted
 {
   if(Input.equalsIgnoreCase(pass))
   {
   for (int i = 0; i<10;i++) 
   {
     fill(random(255),random(255),random(255)); //randomizes colour of shapes
     ellipse (i*50, height-50, random(100),random(60));
     ellipse (i*50, height-150, random(100),random(100));
     rect(i*10, 40, random (300), random (50));
     text ("Password is a Match!", width/2, height/2);
   }
   }
 }
