
PFont myChosenFont;
int x = 200, speedX = 1, y = 0, speedY = 1;

 
String userInput = "", pass = "w";
boolean matched = false;
 
void setup()
{
  size(400, 400);
  fill(0);
  myChosenFont = loadFont("MonotypeCorsiva-100.vlw");
  textFont(myChosenFont, 15);
}
 
void draw()
{
  userInput();
  if (matched == true)
    {
      animation();
    }
}

void userInput()
{
  
  frameRate(60);
  background(0, 255, 255);
  textAlign(CENTER);
  text("Press 'w' for something amazing" + userInput, width/2, height/2 + 20);
  if (keyPressed == true)
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
}

void animation()
{
  {
    background (255);
    x = x + speedX;
    if (x < 0 || x > width)
    {
      speedX = speedX * -1;
    }
    y = y + speedY;
    if (y < 0 || y > width)
    {
      speedY = speedY * -1;
    }
    noFill();
    fill(255, 0, 0, 150);
    ellipse ( width/2, height/2, x, x);
    fill(0, 255, 0, 150);
    ellipse (width/2, height/2, width-x, width-x);
    fill(0, 0, 255, 150);
    ellipse (width/2, height/2, y, y);
    fill(0, 255, 255, 150);
    ellipse (width/2, height/2, width-y, width-y);
    rectMode(CENTER);
    fill(255, 255, 0);
    rect(x, height/2, 50, 50);
    ellipseMode(CENTER);
    fill(255, 0, 255);
    ellipse(x, height/2, 50, 50);
    fill(255, 130, 20);
    ellipse(x, height/2, 30, 30);
  }
}
