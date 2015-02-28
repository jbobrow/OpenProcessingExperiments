
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/48855*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage img0;
PImage img1;
PFont font;
float r;
float g;
float b;
float a;
 
void setup() {
  size(300, 300);
  img0 = loadImage("bg.png");
  font = loadFont("Futura-Medium-48.vlw");
  textFont(font);
  background(img0);
  smooth();
  //colours
  
  noLoop();
}
 
void draw(){
  
  
  r = random(255);
  g = random(140);
  b = random(200);
  a = random(255);
  
  if (mousePressed){
  img0 = loadImage("bg.png");
  background(img0);
  fill(255,255,255,255);
  textSize(150);
  text("HEY",0, 150);
}

  for (int i = 0; i < 1;i++) {  
 float r = random(25);
 
 fill(255,g,b,a);
  textSize(r*2);
    text("BARK", random(width), random(height));
  }
 
  }
void keyPressed(){
  redraw();
}





