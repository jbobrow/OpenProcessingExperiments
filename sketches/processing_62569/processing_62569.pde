
float fat = random(50,150);
float skinny = random (30,80);
float fillColor;

void setup() {
  size(400,400);
  smooth();
  cursor(CROSS);
  colorMode(HSB);
}

void draw() {
  background(255);
  strokeWeight(fat);
  stroke(fillColor,75,550,100);
  line(300,0,300,height);
  line(210,0,210,height);
  line(150,0,150,height);
  strokeWeight(skinny);
//  stroke(fillColor,75,550,100);
  line(0,350,width,350);
  line(0,270,width,270);
  line(0,210,width,210);
}

void mouseMoved() {
 fat = mouseX/1.2;
 skinny = mouseY/1.6;
 fillColor++;
}

void mouseDragged() {
 fillColor--;
 fat = mouseX/1.2;
 skinny = mouseY/1.6;
}

