
PFont font1;

void setup()
{
  size(250, 250);
  background(73, 10, 61);
  font1= loadFont("Ripe-Light-200.vlw");
  smooth();
}

void draw()
{
  fill(73, 10, 61, 4);
  noStroke();
  //makes fades longer on mouse control
  rect(0, 0, width, height);
  fill(248, 202, 0, 100);
  //mouse control of characters
  text("L", mouseX, mouseY);
  text("5", pmouseX+10, pmouseY+10);
  text("B", mouseX+20, mouseY+20);
  text("3", pmouseX+30, pmouseY+30);
  text("J", mouseX+40, mouseY+40);
  text("4", pmouseX+50, pmouseY+50);
  //random text texture in background
  fill(189, 21, 80, 100);
  text("L5B 3J4", random(250), random(250));
}


