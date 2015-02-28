
PImage neon;
  float a = map(second(), 0, 59, 0, 600);
  float b = map(minute(), 0, 59, 0, 600);
  float c = map(hour(), 0, 59, 0, 600);

void setup() {
  size(400, 400);
  rectMode(CENTER);
//  neon = loadImage("neon.jpg");
//  neon.resize(100,100);
}
void draw() {
  background(0);
//  image(neon,width/2,100);
//  if (mousePressed) {
    fill(0,255,0);
    rect(width/2,100,hour(),hour());
    fill(255,0,0);
    rect(width/2,200,minute(),minute());
    fill(0,0,255);
    rect(width/2,300,second(),second());
//    text(hour()+":"+minute()+":"+second(), 220, 220);
//  }
//  if(mousePressed = false){
//    text("click", 220,200);
//  }
}



