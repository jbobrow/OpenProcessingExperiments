
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Sunhyun
// ID: 201420067

import ddf.minim.*;

Minim minim;
AudioInput input;
float x;
float y;
float xLast;
float yLast;
float x1, x2, x3, y4, x5, y5;

void setup() {
  size(600, 600);
  smooth();
  x = 0;
  y = 40;
  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
}
void draw() {
  background(#FFF8AD);
  fill(#FFDB64, 150);

  float dia = input.mix.level() * 1000;

  x1=lerp(x1, mouseX, 0.003);
  x2=lerp(x2, mouseX, 0.010); 
  x3=lerp(x3, mouseX, 0.025); 
  y4=lerp(y4, mouseY, 0.025); 
  x5=lerp(x5, mouseX, 0.035); 
  y5=lerp(y5, mouseY, 0.15); 

  ellipse(100, mouseX, dia, dia);
  ellipse(800, dia, 200, dia);
  ellipse(mouseY, x3, x3, x3);
  ellipse(mouseX, mouseY-300, y4-30, y4-30);
  ellipse(800, 800, dia+100, dia+100);
  ellipse(300, mouseX, x3, x3);
  fill(#FFD0B4, 200);
  ellipse(500, 400, dia, dia);
  ellipse(240, 40, dia, dia);
  fill(#FF5F6D, 100);
  ellipse(mouseX, x5, x5, x5);
  ellipse(mouseY, mouseX-50, y5, y5);
  ellipse(600, 210, 150, 150);
  stroke(#FF7C00);
  strokeWeight(5);
  line(mouseX, mouseY, pmouseX, pmouseY);
  line(mouseX, mouseY, xLast, yLast);
  noStroke();

  //Bear
  fill(#FCBB14);
  ellipse(mouseX, mouseY, 120, 100);
  ellipse(mouseX-55, mouseY-40, 44, 40);
  ellipse(mouseX+55, mouseY-40, 44, 40);
  ellipse(mouseX, mouseY+110, x2, x2);

  fill(#FF8EA4);
  ellipse(mouseX-45, mouseY-105, 20, 20);
  ellipse(mouseX-15, mouseY-120, 30, 30);
  ellipse(mouseX-65, mouseY-90, 10, 10);
  fill(255);
  ellipse(mouseX-43, mouseY-103, 8, 8);
  fill(#FFF97E);
  ellipse(mouseX-55, mouseY-40, 24, 20);
  ellipse(mouseX+55, mouseY-40, 24, 20);
  ellipse(mouseX-40, mouseY+80, 35, 30);
  ellipse(mouseX+40, mouseY+80, 35, 30);
  ellipse(mouseX-40, mouseY+220, 30, 40);
  ellipse(mouseX+40, mouseY+220, 30, 40);

  fill(0);
  ellipse(mouseX-32, mouseY, 19, 12);
  ellipse(mouseX+32, mouseY, 19, 12);
  fill(#642805);
  ellipse(mouseX, mouseY+20, 20, 14);

  xLast=pmouseX;
  yLast=pmouseY;

  x += input.mix.level() * 100;
  if (x > width) {
    x = 0;
    y += 40;
  }
  if (y >height) {
    y = 40;
  }
}

