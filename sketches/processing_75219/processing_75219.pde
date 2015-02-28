
int xPosition=100;
int yPosition=200;
int d=50;
PFont font;
void setup (){
size (640,480);
}

void draw (){
   xPosition=mouseX;
  yPosition=mouseY;
  if (mousePressed == true) {
    noCursor();
  } else {}
     frameRate(5);
  font = loadFont("CooperBlackStd-48.vlw");
textFont(font, 30);
  fill(random(200,255),random(0,65),random(71,255));
text("BOOBS", mouseX, mouseY);

  } 


