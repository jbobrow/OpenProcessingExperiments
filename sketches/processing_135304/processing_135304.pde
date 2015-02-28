
void setup() {
  size(600, 600);
  background(245);
}
float radius=40;
float angle=0;
float radius_1=40;
float angle_1=0;
float radius_2=50;
float angle_2=0;
float radius_3=80;
float angle_3=0;
float radius_4=40;
float angle_4=0;
float radius_5=20;
float angle_5=0;
void draw() {
  noStroke();
  fill(255, 10);
  rect(0, 0, 600, 600);
  float x=cos(angle*PI/180)*radius;
  float y=sin(angle*PI/180)*radius;
  fill(142, 255, 207, 150);
  ellipse(width/2+x, height/2+y, 20, 20);
  angle = angle+2;
  if (radius<300) {
    radius++;
  }
  if (radius>298) {
    radius=radius-random(300);
  }
  float x_1=cos(angle_1*PI/180)*radius_1;
  float y_1=sin(angle_1*PI/180)*radius_1;
  fill(240, 142, 255, 150);
  ellipse(width/2+x_1, height/2+y_1, 20, 20);
  angle_1 =angle_1+3;
  if (radius_1<300) {
    radius_1++;
  }
  if (radius_1>298) {
    radius_1=radius_1-random(300);
  }
  float x_2=cos(angle_2*PI/180)*radius_2;
  float y_2=sin(angle_2*PI/180)*radius_2;
  fill(255, 193, 142, 150);
  ellipse(width/2+x_2, height/2+y_2, 20, 20);
  angle_2=angle_2-2;
  if (radius_2<300) {
    radius_2++;
  }
  if (radius_2>298) {
    radius_2=radius_2-random(300);
  }
  float x_3=cos(angle_3*PI/180)*radius_3;
  float y_3=sin(angle_3*PI/180)*radius_3;
  fill(151, 142, 255, 150);
  ellipse(width/2+x_3, height/2+y_3, 20, 20);
  angle_3=angle_3-1;
  if (radius_3<300) {
    radius_3++;
  }
  if (radius_3>298) {
    radius_3=radius_3-random(300);
  }
  float x_4=cos(angle_4*PI/180)*radius_4;
  float y_4=sin(angle_4*PI/180)*radius_4;
  fill(142, 216, 255, 150);
  ellipse(width/2+x_4, height/2+y_4, 20, 20);
  angle_4++;
  if (radius_4<300) {
    radius_4++;
  }
  if (radius_4>298) {
    radius_4=radius_4-random(300);
  }
  float x_5=cos(angle_5*PI/180)*radius_5;
  float y_5=sin(angle_5*PI/180)*radius_5;
  fill(255, 252, 142, 150);
  ellipse(width/2+x_5, height/2+y_5, 20, 20);
  angle_5=angle_5-3;
  if (radius_4<300) {
    radius_5++;
  }
  if (radius_5>298) {
    radius_5=radius_5-random(300);
  }
  if (mousePressed) {
    noStroke();
  }
  else { 
    stroke(0, 100);
    strokeWeight(0.3);
  }
  line(width/2+x, height/2+y, width/2+x_1, height/2+y_1);
  line(width/2+x_2, height/2+y_2, width/2+x_4, height/2+y_4);
  line(width/2+x_3, height/2+y_3, width/2+x_5, height/2+y_5);
}

