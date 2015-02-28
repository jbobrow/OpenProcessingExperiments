
/* @pjs font="GearedSlab.ttf"; */
PFont myFont;

void setup() {
  size(800,600);
  smooth();
  fill(0);
  img=loadImage("Untitled-1.png");
  myFont = loadFont("GearedSlab.ttf");
  textFont(myFont);
}

void draw(){
  background(255);
  image(img,50,100);
  fill(0);
  textSize(48);
  text("Pistol - 12 Rounds",30,70);
}


