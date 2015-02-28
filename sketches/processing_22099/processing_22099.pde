
import processing.pdf.*;
boolean savePDF = false;

Pane[] panes = new Pane[5];
boolean offset = false;

void setup() {
  size(800, 600);
  for (int i = 0; i < 5; i++)
  {
    panes[i] = new Pane(loadImage("Journey"+(i+1)+".JPG"));  
  }
  background(0);
  smooth();
  noFill();
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {


if (offset)
{
  int x1 = (int) random(0,width);
  int y1 = (int) random(0,height);

  int x2 = round(x1 + random(-50, 50));
  int y2 = round(y1 + random(-50, 50));

  int w = (int) map(mouseX, 0,height, 5,150);
  int h = (int) map(mouseY, 0,height, 5,150);

  copy(x1,y1, w,h, x2,y2, w,h);
}

else
{  
  for (int i = 0; i < 5; i++)
  {
    panes[i].update();  
  }  
}
}

void keyReleased() {
  if(keyCode == DELETE || keyCode == BACKSPACE) {
    background(0);
  }
  if(key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
  else
  {
    if (offset) offset = false;
    else offset = true;
  }
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}



