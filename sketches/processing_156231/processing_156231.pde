

float theta;
float theta2;
float theta3;
float theta4;
float theta5;
float theta6;
float theta7;
float theta8;
float theta9;
float theta10;
float theta11;
float theta12;
float ang = 0;
float ang2 = 30;
float ang3 = 60;
float ang4 = 90;
float ang5 = 120;
float ang6 = 150;
float ang7 = 180;
float ang8 = 210;
float ang9 = 240;
float ang10 = 270;
float ang11 = 300;
float ang12 = 330;





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
  theta9 = radians(ang9);
  theta10 = radians(ang10);
  theta11 = radians(ang11);
  theta12 = radians(ang12);
 
  noStroke();
  fill(0, 255, 0, 100);
  quad(250+200*cos(theta), 500+200*sin(theta),250+200*cos(theta2), 500+200*sin(theta2), 250+200*cos(theta3), 500+200*sin(theta3),250+200*cos(theta4), 500+200*sin(theta4));
  fill(255, 0, 0, 100);
  quad(250+200*cos(theta5), 500+200*sin(theta5),250+200*cos(theta6), 500+200*sin(theta6), 250+200*cos(theta7), 500+200*sin(theta7),250+200*cos(theta8), 500+200*sin(theta8));
  fill(0, 0, 255, 100);
  quad(250+200*cos(theta9), 500+200*sin(theta9),250+200*cos(theta10), 500+200*sin(theta10), 250+200*cos(theta11), 500+200*sin(theta11),250+200*cos(theta12), 500+200*sin(theta12));
  fill(0, 255, 0);
  ellipse(250+200*cos(theta), 500+200*sin(theta), 20, 20);
  ellipse(250+200*cos(theta2), 500+200*sin(theta2), 20, 20);
  ellipse(250+200*cos(theta3), 500+200*sin(theta3), 20, 20);
  ellipse(250+200*cos(theta4), 500+200*sin(theta4), 20, 20);
  fill(255, 0, 0);
  ellipse(250+200*cos(theta5), 500+200*sin(theta5), 20, 20);
  ellipse(250+200*cos(theta6), 500+200*sin(theta6), 20, 20);
  ellipse(250+200*cos(theta7), 500+200*sin(theta7), 20, 20);
  ellipse(250+200*cos(theta8), 500+200*sin(theta8), 20, 20);
  fill(0, 0, 255);
  ellipse(250+200*cos(theta9), 500+200*sin(theta9), 20, 20);
  ellipse(250+200*cos(theta10), 500+200*sin(theta10), 20, 20);
  ellipse(250+200*cos(theta11), 500+200*sin(theta11), 20, 20);
  ellipse(250+200*cos(theta12), 500+200*sin(theta12), 20, 20);
  
  ang += 0.1;
  ang2 += 0.2;
  ang3 += 0.3;
  ang4 += 0.4;
  ang5 += 0.5;
  ang6 += 0.6;
  ang7 += 0.7;
  ang8 += 0.8;
  ang9 += 0.9;
  ang10+= 1;
  ang11 += 1.1;
  ang12 += 1.2;
 
}
  
  

