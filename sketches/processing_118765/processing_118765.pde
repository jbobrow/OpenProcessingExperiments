
float number_to_sin = 0;
float fireworks_speed = 0;
float fireworks_angle = 0;
float rotating_speed1 = 0;
float rotating_speed2 = 0;

void setup() {
  size(550, 400);
  smooth();
}

void draw() {


  background(105);
  float tri = (width*.5);
  float cir = (height*.5);

  float xValue = sin(fireworks_speed) * 50;
  float yValue = cos(fireworks_speed) * 50;

  float circleX_1=cos(radians(rotating_speed1))*145;
  float circleY_1=sin(radians(rotating_speed1))*145;

  float circleX_2=-cos(radians(rotating_speed2))*145;
  float circleY_2=-sin(radians(rotating_speed2))*145;

  //-------------------ground
  fill(150, 200, 200);
  noStroke();
  rect(0, 350, 600, 400);
  //-------------------triangle pillar
  noStroke();
  fill(200, 200, 100);
  triangle((tri+40), 350, (tri-40), 350, tri, 190);
  //-------------------white circle
  stroke(255, 255, 255);
  strokeWeight(5);
  ellipseMode(RADIUS);
  fill(255);
  ellipse(tri, cir, 10, 10);
  ellipseMode(CENTER);
  fill(0, 0, 0, 0);
  ellipse(tri, cir, 290, 290);
  noStroke();
  //-------------------fireworks
  pushMatrix();
  fireworks_speed += .09;
  xValue += 10;
  yValue += 50;
  println(xValue);
  //-------------------left
  fill(random(200), 100, 200);
  ellipse(80, 80, xValue, xValue);
  //-------------------right
  fill(255, random(255), 100);
  ellipse(520, 200, yValue, yValue); 
  //-------------------bottom
  fill(100, random(255), 100);
  ellipse(200, 300, yValue*0.2, yValue*.2);
  popMatrix();  


  //------------------------rotating thing
  //----------------------------------1 red
  pushMatrix();
  circleX_1 += width/2;
  circleY_1 += height/2;
  fill(255, 120, 100);
  rotating_speed1 += .2;
  println(degrees(rotating_speed1%360));
  rect(circleX_1, circleY_1, 40, 40); 
  stroke(255, 120, 100);
  line(width/2, height/2, circleX_1, circleY_1);
  popMatrix();
  //----------------------------------2 blue
  pushMatrix();
  circleX_2 += width/2;
  circleY_2 += height/2;
  rotating_speed2 += .2;
  println(degrees(rotating_speed2%360));
  fill(100, 120, 255);
  stroke(100, 120, 255);
  rect(circleX_2, circleY_2, 40, 40); 
  line(width/2, height/2, circleX_2, circleY_2);
  popMatrix();

//
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount /135.0); //speed of rotation
  stroke(0);
  fill(0);
  star(0, 0, 30, 10, 5);
  popMatrix();
  
}
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float i=0; i < TWO_PI; i += angle) {
    float sx = x + cos(i) * radius2;
    float sy = y + sin(i) * radius2;
    vertex(sx, sy);
    sx = x + cos(i+halfAngle) * radius1;
    sy = y + sin(i+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}



