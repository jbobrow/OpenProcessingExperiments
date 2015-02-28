
//Author: Herbert Hsu
//Purpose: Using randomness and function to create the flowering image
//Concept: Flowering Flower
//Reference: class-example from Nik, schien@mail.ncku.edu.tw
float radius;
int centX=250;
int centY=250;
//---------------------------initial
void setup() {
  size(500, 500);
  frameRate(3);
  background(5);
}
//-----------------------------drawing
void draw() {
  flower();
  fade();
}
//----------------------------refresh
void mousePressed() {
  background(0);  
  redraw();
}
//---------------------------------------------flower
void flower() {
  fill(mouseX, random(60)+100, mouseY, 15);
  //noStroke();
  strokeWeight(2);
  stroke(20, 40);
  radius = 10;
  float x, y;
  float lastx = -999;
  float lasty = -999;
  float radiusNoise = random(10);
  beginShape();
  for (float ang=0; ang<=random(240)+1200; ang+=5) {
    radiusNoise += 0.1;
    radius += 0.6;
    float thisRadius = radius + (noise(radiusNoise*2)*200) - random(20)-90;
    float rad = radians(ang);
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));

    if (lastx > -999) {
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
    curveVertex(x, y);
  }

  endShape();
}

//---------------------------------------------The fading
void fade() {
  fill(5, 10);
  noStroke();
  rect(0, 0, width, height);
}
void keyPressed(){
saveFrame("flowering.jpg");
}

