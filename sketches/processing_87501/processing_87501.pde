
//Copyright Yaakov Lyubetsky / ylyubets@andrew.cmu.edu / Januray 30th, 2013
//Homework #5 - Processing for the Arts

//Move mouse around to change size of wolf
//Press any key to change the tint of the image of the wolf
//Click to see the wolf say "woof"

float x, y, wd, ht;
color col;
PImage b;
PFont font;

void setup()
{
  size(400, 400);
  smooth();
  background(137, 229, 177);
  b = loadImage("wolf.png");
  font = loadFont("Futura-Bold-48.vlw");
  textFont(font);
}

void draw()
{
 figure(mouseX, mouseY, mouseX - mouseY, mouseY - mouseX);  
 //figure(x, y, wd, ht);
 //figure(mouseX, mouseY, pmouseX - pmouseY, pmouseY - pmouseX);
 //figure(mouseX, mouseY, width + (.03 * mouseX), height + (.03 * mouseX));
}

void figure(float fx, float fy, float fwd, float fht)
{
  image(b, fx, fy, fwd, fht);
}

void keyPressed()
{
  col = color(random(255), random(255), random(255));
  tint(col);
}

void mousePressed()
{
  fill(0);
  textFont(font, mouseX - mouseY);
  text("woof", mouseX, mouseY);
  
  //saveFrame("hw5.jpg ");
}

