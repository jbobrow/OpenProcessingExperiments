
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/48855*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage img0;
PImage img1;
PFont font;


void setup() {
  size(562, 484);
  img0 = loadImage("bowl.jpg");
  img1 = loadImage("bowl.png");

  font = loadFont("MoolBoran-25.vlw");
  textFont(font);

  colorMode(HSB, 360, 100, 100);

  background(img0);
  smooth();

  noLoop();
}

void draw(){
  for (int i = 0; i < 200;i++) {   

  textSize(20);
    text("rice", random(width), random(height));
    
    image(img1, 0, 0);


  }
 
}

void mousePressed(){
  redraw();
}

