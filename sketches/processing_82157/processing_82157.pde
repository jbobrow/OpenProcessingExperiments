
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
    landscape = loadImage("alpine.png");
    smooth();
  }
   
  void draw() {
    background(landscape);
     
    float targetOffset = map(mouseY, 0, height, -40, 40);
    offset += (targetOffset - offset) * easing;
     
    shape(bot1, 30 + offset, 65);
     
    float smallerOffset = offset * 0.7;
    shape(bot2, 20 + smallerOffset, 140, 78, 248);
     
    smallerOffset *= -0.5;
    shape(bot3, 50 + smallerOffset, 225, 39, 124);
  }


