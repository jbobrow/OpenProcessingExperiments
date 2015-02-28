
void setup() {
size(800,800);
background(225,220,185);

}
float a_radius = 100;
float a_angle = 0;
float a_x = cos(a_angle*PI/180)*a_radius;
float a_y = sin(a_angle*PI/180)*a_radius;
 
float b_radius = 150;
float b_angle = 0;
float b_x = cos(b_angle*PI/180)*b_radius;
float b_y = sin(b_angle*PI/180)*b_radius;
 
float c_radius = 80;
float c_angle = 0;
float c_x = cos(c_angle*PI/180)*c_radius;
float c_y = sin(c_angle*PI/180)*c_radius;
float n;

 
void draw() {
noStroke();
fill(mouseY*0.5,mouseY*0.3,mouseY*0.5+50,20);
ellipse(mouseX, mouseY,10,10);
n += 0.01;
a_angle = a_angle + 5;
float a_x = cos(a_angle*PI/180)*a_radius;
float a_y = sin(a_angle*PI/180)*a_radius;
strokeWeight(2);
stroke(225,30);
line(mouseX, mouseY, 350+a_x, 320+a_y);

stroke(cos(n)*255+100, -cos(n)*255+200, -sin(n)*250+200,30);
   
  line (mouseX, mouseY , x(sin(n))+250,y(cos(n))-150);
  line (mouseX, mouseY, x(-sin(n))+300,y(-cos(n))+100);
}
  float x (float n) {
  float is = 300 * n;
  return is;
}
 
float y (float n) {
  float is = 300 * n;
  return is;
}
