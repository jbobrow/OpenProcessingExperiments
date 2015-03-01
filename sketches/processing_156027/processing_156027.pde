
PImage bg; 
PImage spin;
PImage bed;
int amplitude = 70;
PFont font;

void setup() {
  background (255);
  size(600, 450);
  font = loadFont("8BITWONDERNominal-48.vlw");
  textAlign(CENTER, CENTER);

  bg = loadImage("1.jpg");
  spin = loadImage("sleepyhead.gif");
  bed = loadImage("fabric.jpg");
}
void draw() {
  float time = millis() *0.005;
  float time2 =millis() *0.002;

  float posX=cos(time)* amplitude +width/2;
  float posY = sin(time)* amplitude +height/2;

  image(bg, 0, 0, 600, 450);

  pushMatrix();
  translate(width/2, height/2);
  rotate(time2);
  imageMode(CENTER);
  image(spin, 0, 0, 150, 150);
  popMatrix();
 
  imageMode(CORNER);
  
  if (mousePressed) {
    fill(255);
  } else {
    fill(0);
  }
  strokeWeight(0);
  text("Happy Holiday", mouseX, mouseY-25);
  
  if (mousePressed) {
    
  } else {
    image(bed, 0, 0, 600, 450);
  tint(255, 255);
  }
  strokeWeight(0);
  text("Happy Holiday", mouseX, mouseY-25);
  
  
}
  




