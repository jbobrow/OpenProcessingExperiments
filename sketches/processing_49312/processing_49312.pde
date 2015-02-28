
PFont f;

void setup() {
 size(400,400);
 smooth();
 noStroke();
 f = loadFont ("shadowhuntfont.vlw");
 textFont(f,24);
}
void draw() {
  fill(0);
  ellipse(150,250,30,30);
 if(mouseX < 160){
   background(0);
   fill(255);
   text("Right a bit!",50,30);
 }
 else if (mouseX >140){
   background(0);
   fill(255);
   text("Left a bit!!",50,30);
 }
 if(mouseY<240){
  background(0);
   fill(255);
   text("Down a bit",100,30);
 }
 else if(mouseY>260){
   background(0);
   fill(255);
   text("Up a bit",100,30);
 }
 if(mouseX > 130 && mouseX <170 && mouseY> 230 && mouseY < 270){
   background(252,0,0);
   fill(15,0,252);
   ellipse(150,250,30,30);
   text("You found it!",100,30);
  }
 }

