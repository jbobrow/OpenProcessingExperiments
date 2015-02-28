
//Jerry Pierre-Charles
//google image

PImage b;

 PFont font;
 int opacity = 0;
 int direction = 1;
 

void setup() {
  
  size(460,268);
  background(100);
  noStroke();
  b = loadImage("davis.jpg");
  
  font = loadFont("Georgia-BoldItalic-48.vlw");
  textFont(font);
  //fill(198,10,10);
  noStroke();
  
  
}

void draw() {
 background (b);
 opacity += 4 * direction;
 if ((opacity < 0) || (opacity > 200)) {
   direction = -direction;
 }

fill(200, opacity);
text(" I AM TROY DAVIS", 50,260);
textSize(25);
}
void mouseDragged() {
  fill(255,3,32);
  text("INHUMANE!", mouseX,mouseY-50);

}

