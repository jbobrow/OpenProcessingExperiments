
PImage myImage;
PFont myFont;

void setup() {
  myImage = loadImage("Mountains.jpg");
  myFont = loadFont("AdobeFangsongStd-Regular-40.vlw");


size(618, 282);
}
 void draw() {
  image(myImage, 0, 0);
  textFont(myFont);
  fill(#000000);
  textSize(40);
  text("Come to the USC Hiking Club!", 60, 190);
  
  if (mousePressed == true) {
    fill(#000000);
    textFont(myFont);
    fill(#ffffff);
    textSize(20);
    text("Meetings: Tuesdays 5-6 THH 107", 60, 235);
  }
 

 }




