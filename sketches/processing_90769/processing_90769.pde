
PFont myChosenFont, OtherFont;

String userInput = "", pass = "word";
boolean matched = false;
 
void setup()
{
  size(400, 400);
  myChosenFont = loadFont("Serif.bolditalic-48.vlw");
  OtherFont= loadFont("Andy-Bold-40.vlw");//I want to change the font when the password is right.
  textFont(myChosenFont, 15);
  
}
 
void draw()
{
  background(0);
  text("Keep tying until password matches", width/3, 20);
  text("Enter text here: " + userInput, 0, height/2 - 20);
  text("Does the input match? True or false: " + matched, 0, height/2 + 20);
      if (matched)//This will change the screen when the password is right
    {
       background(204,138,234);
       fill(0,255,0);
       textFont(OtherFont);
       text("Correct! ",150,100);//The font does not look correct on openprocessing.
       text("You Were Right!",100,300);
       fill(255,255,0);
       ellipse(height/2,width/2,50,50);//smiley face
       fill(0);
       ellipse(195,195,8,8);//eyes
       ellipse(210,195,8,8);
       line(190,210,193,215); //Not much of a smile but it's a smile.
       line(193,215,205,215);
       line(205,215,210,210);
       Flash();
    }
  
}
 
void keyPressed()
{

  if (key != CODED)
    userInput += key.toString();
  if(userInput.equalsIgnoreCase(pass))
    matched = true;

}
void Flash()//Doing this to create flashing squares.
{
  
  frameRate(10);//Slow down the rate the colour changes as it was way too fast.
  float r,g,b;
  r=random(255);//I want to use random different colours.
  g=random(255);
  b=random(255);
  fill(r,g,b);
  rect(10,10,40,40);
  rect(350,10,40,40);
  rect(10,350,40,40);
  rect(10,10,40,40);
  rect(350,350,40,40);
}
