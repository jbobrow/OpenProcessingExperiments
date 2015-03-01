

float theta;
float theta2;
float theta3;
float theta4;
float theta5;
float theta6;
float theta7;
float theta8;
float ang = 0;
float ang2 = 45;
float ang3 = 90;
float ang4 = 135;
float ang5 = 180;
float ang6 = 225;
float ang7 = 270;
float ang8 = 315;



void setup(){
  size(500, 1000);
  smooth();
  background(255);
}

void draw(){
  background(255);
  theta = radians(ang);
  theta2 = radians(ang2);
  theta3 = radians(ang3);
  theta4 = radians(ang4);
  theta5 = radians(ang5);
  theta6 = radians(ang6);
  theta7 = radians(ang7);
  theta8 = radians(ang8);
  fill(255);
  ellipse(250, 500, 400, 400);
  /*line(250+200*cos(theta), 500+200*sin(theta), 250+200*cos(theta2), 500+200*sin(theta2));
  line(250+200*cos(theta2), 500+200*sin(theta2), 250+200*cos(theta3), 500+200*sin(theta3));
  line(250+200*cos(theta3), 500+200*sin(theta3),250+200*cos(theta4), 500+200*sin(theta4));
  line(250+200*cos(theta), 500+200*sin(theta), 250+200*cos(theta4), 500+200*sin(theta4));*/
  fill(255, 0, 0);
  ellipse(250+200*cos(theta), 500+200*sin(theta), 20, 20);
  ellipse(250+200*cos(theta2), 500+200*sin(theta2), 20, 20);
  ellipse(250+200*cos(theta3), 500+200*sin(theta3), 20, 20);
  ellipse(250+200*cos(theta4), 500+200*sin(theta4), 20, 20);
  fill(255, 255, 0);
  ellipse(250+200*cos(theta5), 500+200*sin(theta5), 20, 20);
  ellipse(250+200*cos(theta6), 500+200*sin(theta6), 20, 20);
  ellipse(250+200*cos(theta7), 500+200*sin(theta7), 20, 20);
  ellipse(250+200*cos(theta8), 500+200*sin(theta8), 20, 20);
  ang += 0.1;
  ang2 += 0.2;
  ang3 += 0.3;
  ang4 += 0.4;
  ang5 += 0.5;
  ang6 += 0.6;
  ang7 += 0.7;
  ang8 += 0.8;
 
}
  


