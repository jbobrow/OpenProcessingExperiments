
PFont font;
String letters = "";
PImage bgImage;
PImage kermit, fozzy;
boolean drawBg, drawKermit, drawFozzy;

void setup()
{
  size(600, 600);
  font = loadFont("CourierNewPS-BoldMT-20.vlw");
  textFont(font);
  stroke(255);
  fill(0);
  bgImage = loadImage("bg.jpg");
}
void draw()
{
  background(255);
  image(bgImage, 0,0);
    
  //float cursorPos = textWidth(letters);
  //line(cursorPos, 0, cursorPos, height);
  text(letters, 5, height/2);
}

void keyPressed()
{
  if (key == BACKSPACE)
  {
    if (letters.length() > 0)
    {
      letters = letters.substring(0, letters.length()-1);
    }
  } 
  else if ((key == ENTER) || (key==RETURN))
  {
    if (letters.equals("kermit"))
    {
       bgImage = loadImage("kermit.jpg"); 
    }
    else if (letters.equals("fozzy"))
    {
       bgImage = loadImage("fozzy.png"); 
    }
    else
    {
       bgImage = loadImage("bg.jpg"); 
    }
    letters = "";
  }
  else if (textWidth(letters+key) < width)
  {
    letters = letters+key;
  }
}


