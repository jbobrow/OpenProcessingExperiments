
int xPosition=100;
int yPosition=200;
int d=50;
PFont font;
void setup (){
size (640,480);
frameRate(60);
 font = loadFont("CooperBlackStd-48.vlw");
}

void draw (){
  {
fill(random(0,255),random(0,255),176);
textFont(font, 100);
text("PARTY", 130, 420);
text("BOOB", 130, 240);
text("BEACH",90, 330);
  xPosition=mouseX;
  yPosition=mouseY;
  if (mousePressed) {
    noCursor();
  } else {
    cursor(HAND);
  }

  fill (255,235,201);
  ellipse (xPosition,yPosition,d,d);
    ellipse (xPosition+35,yPosition+35,d,d);
    fill (255,195,201);
  ellipse (xPosition,yPosition,d/3,d/3);
    ellipse (xPosition+35,yPosition+35,d/3,d/3);
    fill (240,103,148);
ellipse (xPosition,yPosition,d/10,d/10);
    ellipse (xPosition+35,yPosition+35,d/10,d/10);
}
}

