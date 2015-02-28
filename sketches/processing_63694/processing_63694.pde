
int dragL;
int dragA;
void setup(){
size(356,444);
 smooth(); 

PImage img;
img =loadImage ("willy2.jpg");
tint(255,255,255,255);
image(img,0,0);

}
void draw(){
  fill(#000000);
  ellipse(dragL, dragA, 5, 5);

}
void mouseDragged(){
dragL=mouseX;
dragA=mouseY;
}


