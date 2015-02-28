
PShape bot1;
PShape bot2; 
PShape bot3; 
PImage landscape;

float easing = 0.05; float offset = 0;

void setup() { 
  size(600, 450); 
  bot1 = loadShape("BEE.svg"); 
  bot2 = loadShape("BEE2.svg");
  bot3 = loadShape("BEE3.svg"); 
  landscape = loadImage("grass.jpg"); 
  smooth();
  }
void draw() {
  background(landscape);
  float targetOffset = map(mouseY, 0, height, -40, 40);
  offset += (targetOffset - offset) * easing;
  
  shape(bot1, 85 + offset, 65);
  
  float smallerOffset = offset * 0.5; 
  shape(bot2, 257 + smallerOffset, 180, 220, 253);
  smallerOffset *= -0.5; 
 shape(bot3, 410 + smallerOffset, 225, 100, 124);
}

