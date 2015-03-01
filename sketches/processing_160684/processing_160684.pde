
PImage myImage;
PImage Image2;
PFont myFont;

void setup() {
  myImage=loadImage("VillageUsc.jpg");
  Image2=loadImage("UV.jpg");
  myFont=loadFont("Arial-Black-150.vlw");
  
  size(692,384);
}
void draw(){
  image(myImage, 0, 0);
  textFont(myFont);
  fill(255);
  textSize(40);
  text("UNIVERSITY VILLAGE 2030", 50, 50);
  textSize(30);
  text("GRAND OPENING TOMORROW", 100, 80);
  
  if (mousePressed == true) {
    image(Image2,0,0);
}

}
  




