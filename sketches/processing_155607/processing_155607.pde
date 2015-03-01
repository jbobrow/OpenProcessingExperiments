
int x1;
int speed =1;
void setup() {
  size(500,500);
}
 void draw () {
  background(255,0,0);
fill(60, 0, 200);
ellipse(250, 120, 180, 180);
line(325, 150, 170, 150);
line(250, 210,250, 150);
float r1 =random(255);
float r2 =random(255);
float r3 =random(255);
fill(r1,r2,r3);
rect(235,87,25,45);
fill(0);
ellipse(210, 65, 35,35);
fill(0);
ellipse(285, 65, 35, 35);
fill(255);
ellipse(210+x1, 65, 15, 15);
fill(255);
ellipse(285-x1, 65, 15, 15);
fill(60, 0, 200);
triangle(251, 210, 85, 400, 420, 400);
line(85, 400, 85, 455);
line(420, 400, 420, 455);
line(330, 300, 400, 250);
line(170, 300, 100, 250);
fill(255);
triangle(250, 0, 255, 30, 235, 30);
fill( 227, 150, 88);
ellipse(295,100,7, 7);
fill(227, 150, 88);
ellipse(285, 110, 7, 7);
fill(227, 150  , 88);
ellipse(305, 110, 7, 7); 
fill(227, 150, 88);
ellipse(200, 100,  7, 7);
fill(227, 150, 88);
ellipse(190, 110, 7, 7);
fill(227, 150, 88);
ellipse(210, 110, 7, 7);

x1 = x1 + speed;
if ((x1 > 15 ) || (x1 < -10)) {
  speed = speed * -1;
}
}

