
float mx;
float my;
float targetX, targetY;
float easing = 0.011;

void setup()
{
  size(1000, 1000);
  smooth();
}

void draw()
{
  background(0);
  noStroke();
  
  targetX = mouseX;
  float dx = targetX - mx;
  if(abs(dx) > 1) {
    mx += dx * easing;
  }
  
  targetY = mouseY;
  float dy = targetY - my;
  if(abs(dy) > 1) {
    my += dy * easing;
  }

  drawPlanet(color(255), 35, 10); //mercury
  drawPlanet(color(255), 60, 15); //venus
  drawPlanetWithMoon(color(255), 90, 17); //earth and moon
  drawPlanet(color(255), 120, 12); //mars
  drawPlanetWithMoonJ1(color(255), 230, 85); //jupiter1
  drawPlanetWithMoonJ2(color(255), 230, 85); //jupiter2
  drawPlanetWithMoonJ3(color(255), 230, 85); //jupiter3
//  drawPlanet(color(255), 325, 50); //saturn
  drawPlanetWithRingS(color(255), 325, 50); //saturn
  drawPlanetWithRingU(color(255), 390, 24); //uranus
  drawPlanet(color(255), 445, 23); //neptune
  drawPlanet(color(255), 525, 1.5); //just a ball of ice

}

void drawPlanetWithRingU(color c, float r, float s)
{
  
  pushMatrix();
  float x = cos(frameCount/r) * r;
  float y = sin(frameCount/r) * r;
  translate(mx, my);

  pushMatrix();
  translate(x, y);
  rotate(frameCount/95.0);
  noFill();
  strokeWeight(1);
  stroke(255, 150);
  ellipse(0, 0, 32,33);
  fill(c);
  noStroke();
  ellipse(0, 0, s, s);
  popMatrix();
  popMatrix();
}

void drawPlanetWithRingS(color c, float r, float s)
{
  
  pushMatrix();
  float x = cos(frameCount/r) * r;
  float y = sin(frameCount/r) * r;
  translate(mx, my);

  pushMatrix();
  translate(x, y);
  rotate(frameCount/125.0);
  noFill();
  strokeWeight(6);
  stroke(255, 150);
  ellipse(0, 0, 65,76);
  fill(c);
  noStroke();
  ellipse(0, 0, s, s);
  popMatrix();
  popMatrix();
}


void drawPlanetWithMoonJ3(color c, float r, float s)
{
  pushMatrix();
  float x = cos(frameCount/r) * r;
  float y = sin(frameCount/r) * r;
  translate(mx, my);
  pushMatrix();
  translate(x, y);
  rotate(frameCount/65.0);
  fill(255);
  ellipse(10, -50, 3,3); // jupiter moon 5
  fill(c);
  ellipse(0, 0, s, s);
  popMatrix();
  popMatrix();
}

void drawPlanetWithMoonJ2(color c, float r, float s)
{
  pushMatrix();
  float x = cos(frameCount/r) * r;
  float y = sin(frameCount/r) * r;
  translate(mx, my);
  pushMatrix();
  translate(x, y);
  rotate(frameCount/85.0);
  fill(255);
  ellipse(20, 45, 5,5); // jupiter moon 3
//  ellipse(0, -50, 8,8); // jupiter moon 4
  fill(c);
  ellipse(0, 0, s, s);
  popMatrix();
  popMatrix();
}

void drawPlanetWithMoonJ1(color c, float r, float s)
{
  pushMatrix();
  float x = cos(frameCount/r) * r;
  float y = sin(frameCount/r) * r;
  translate(mx, my);

  pushMatrix();
  translate(x, y);
  rotate(frameCount/120.0);
  fill(255);
  ellipse(50, 0, 8,8); //jupiter moon 1
//  ellipse(0, 50, 3,3); // jupiter moon 2
  fill(c);
  ellipse(0, 0, s, s);
  popMatrix();
  popMatrix();
}

void drawPlanetWithMoon(color c, float r, float s)
{
  pushMatrix();
  float x = cos(frameCount/r) * r;
  float y = sin(frameCount/r) * r;
  translate(mx, my);

  pushMatrix();
  translate(x, y);
  rotate(frameCount/25.0);
  fill(255);
  ellipse(15, 0, 3,3);
  fill(c);
  ellipse(0, 0, s, s);
  popMatrix();
  popMatrix();
}

void drawPlanet(color c, float r, float s)
{
  
  pushMatrix();
  float x = cos(frameCount/r) * r;
  float y = sin(frameCount/r) * r;
  translate(mx, my);

  pushMatrix();
  translate(x, y);
  rotate(-frameCount/(r/2));
  fill(c);
  ellipse(0, 0, s, s);
  popMatrix();
  popMatrix();
}

//void drawSun()
//{
//  pushMatrix();
//  translate(width/2, height/2);
//  rotate(frameCount/500.0);
//  fill(255);
//  ellipse(0, 0, 100, 100);
//  popMatrix();
//}


