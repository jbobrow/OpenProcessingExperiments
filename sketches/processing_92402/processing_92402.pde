
PShape bot1;
PShape bot2;
PShape bot3;
PImage landscape;
   
float easing = 0.05;
float offset = 0;
   
void setup() {
  size(720, 480);
  bot1 = loadShape("robot1.svg");
  bot2 = loadShape("robot2.svg");
  bot3 = loadShape("robot3.svg");
  landscape = loadImage("winter.jpg");
  smooth();
}
   
void draw() {
  background(landscape);
     
  float targetOffset = map(mouseY, 0, height, -400, 750);
  offset += (targetOffset - offset) * easing;
     
  shape(bot1, 10 + offset, 50);
     
  float smallerOffset = offset * 0.7;
  shape(bot2, 50 + smallerOffset, 75, 150, 75);
     
  smallerOffset *= -0.5;
  shape(bot3, 100 + smallerOffset, 200, 50, 150);
}



