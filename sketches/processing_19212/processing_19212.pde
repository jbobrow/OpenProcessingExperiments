
//variables
PFont font1;

//background setup
void setup()
{
  size(250, 250);
  background(170, 63, 20, 10);
  font1= loadFont("Monospaced-100.vlw");
  smooth();
}

//shaows the characters in random positions & random sizes
void draw()
{
  background(170, 63, 20, 10);
  frameRate(2);
  fill(255, 150);
  text("L", random(250), random(250));
  text("L", random(250), random(250));
  fill(224, 209, 145, 150);
  text("5", random(250), random(250));
  text("5", random(250), random(250));
  fill(32, 24, 7, 150);
  text("B", random(250), random(250));
  text("B", random(250), random(250));
  fill(160, 145, 78, 150);
  text("3", random(250), random(250));
  text("3", random(250), random(250));
  fill(247, 233, 181, 150);
  text("J", random(250), random(250));
  text("J", random(250), random(250));
  fill(32, 24, 7, 150);
  text("4", random(250), random(250));
  text("4", random(250), random(250));
  textFont(font1, random(10, 100));
}


