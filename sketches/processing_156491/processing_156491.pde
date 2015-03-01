
PShape bot1;
PShape bot2;
PShape bot3;
PImage landscape;

float easing = 0.05;
float offset = 0;

void setup()
{
  size(720, 480);
  bot1 = loadShape("robot1.svg");
  bot2 = loadShape("robot2.svg");
  bot3 = loadShape("robot3.svg");
  landscape = loadImage("alpine.png");
  smooth();
}

void draw()
{
  //background = landscape image
  //background size = image size(width, height same)
  background(landscape);
  
  // left, right offset setting  // Easing setting
  float targetOffset = map(mouseY, 0, height, -40, 40);
  offset += (targetOffset - offset) * easing;
  
  //Draw left robot
  shape(bot1, 85 + offset, 65);
  
  //Draw right robot ( smaller than left robot), + offet
  float smallerOffset = offset * 0.7;
  shape(bot2, 510 + smallerOffset, 140, 78, 248);
  
  //Draw the smallest robot + offset
  smallerOffset *= -0.5;
  shape(bot3, 410 + smallerOffset, 225, 39, 124);
}


