
PShape bot1;
PShape bot2;
PShape bot3;
PImage landscape;
 
float easing = 1;
float offset = 1;
 
void setup() {
  size(720, 480);
  bot1 = loadShape("robot1.svg");
  bot2 = loadShape("robot2.svg");
  bot3 = loadShape("robot3.svg");
  landscape = loadImage("alpine.png");
  smooth();
}
 
void draw() {
  background(landscape);
   
  float targetOffset = map(mouseY, 2, height, -20, 35);
  offset += (targetOffset - offset) * easing;
   
  shape(bot1, 52 + offset, 10);
   
  float smallerOffset = offset * 1;
  shape(bot2, 20 + smallerOffset, 140, 78, 248);
   
  smallerOffset *= -0.1;
  shape(bot3, 50 + smallerOffset, 225, 39, 124);
}


