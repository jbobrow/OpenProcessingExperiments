
//PFont font;
String letters = "";
PImage bgImage;
PImage help;
boolean drawBg, drawKermit, drawFozzy;
boolean start;
 
void setup()
{
  size(700, 550);
//  font = loadFont("CourierNewPS-BoldMT-20.vlw");
//  textFont(font);
  stroke(255);
  bgImage = loadImage("bg.jpg");
  help = loadImage("help.png");
  start = false;
}
void draw()
{
  background(0);
  image(bgImage, 0,0);
  if(!start) {image(help, 0,0);  tint(255, 200);}
  else tint(255,255);
  //float cursorPos = textWidth(letters);
  //line(cursorPos, 0, cursorPos, height);
  text(letters, 60, 510);
  textSize(10);
}
 
void keyPressed()
{
  if (key == BACKSPACE)
  {
    if (letters.length() > 0)
    {
      letters = letters.substring(0, letters.length()-16);
    }
  }
  else if ((key == ENTER) || (key==RETURN))
  {
    start = true;
    letters = "";
  }
  else if (textWidth(letters+key) < width && start)
  {
    letters = letters+binary(key);
    if (letters.length() > 96) {
      letters = letters.substring(16);
    }
  }
}


