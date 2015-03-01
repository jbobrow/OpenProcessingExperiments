
color a1, a2, a3, a4;
float circleX, circleY, circleRadius;
float angle;
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  counter = 0;
  angle = 0;

  circleX = mouseX + 100;
  circleY = mouseY;
  circleRadius = 60;

  a1 = colorA1();
  a2 = colorA2();
  a3 = colorA3();
  a4 = colorA4();
}
color colorA1() {
  float r = 255;
  float g = 0;
  float b = 0;

  color a1 = color (r, g, b);

  return(a1);
}

color colorA2() {
  float r = 25;
  float g = 255;
  float b = 25;

  color a2 = color (r, g, b);

  return(a2);
}

color colorA3() {
  float r = 25;
  float g = 25;
  float b = 255;

  color a3 = color (r, g, b);

  return(a3);
}

color colorA4() {
  float r = 25;
  float g = 175;
  float b = 200;

  color a4 = color (r, g, b);

  return(a4);
}


void draw() {  //draw function loops 
//  background(255);
  fill(255, 255, 255, 100);
  rect(0, 0, width, height);

  noStroke();
  angle++;

  translate(mouseX, mouseY);
  rotate((angle/16));

  fill(a1);
  ellipse(circleX, circleY, circleRadius, circleRadius);

  fill(a2);
  ellipse(-circleX, circleY, circleRadius, circleRadius);

  fill(a3);
  ellipse(0, circleY + 100, circleRadius, circleRadius);

  fill(a4);
  ellipse(0, circleY - 100, circleRadius, circleRadius);
  
  translate(-250, -250);
  rotate(-angle/8);
}

void keyPressed(){
if(key == ' '){
angle--;
}
}



