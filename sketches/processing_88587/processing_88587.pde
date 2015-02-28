
/*Nafis Sabir
Professor Calli Higgins
HW 1.2.3*/
void setup() {
  size(800, 800);//window size
}
void draw() {
  background(0, 150, 255);//background color
  smooth();//pixel smoothing
  strokeWeight(9);//weight for stems
  stroke(10, 200, 0);//stem color
  line(200, 303, 200, 700);//stem 1
  line(560, 503, 560, 700);//stem 2
  line(380, 403, 380, 700);//stem 3
  noStroke();//removed stroke from flowers
  fill(0, 0, 255);//blue color for left flower
  arc(200, 200, 200, 200, 0, PI+QUARTER_PI);//left flower
  fill(146, 0, 206);//purple color for middle flower
  arc(380, 300, 200, 200, 0, PI+QUARTER_PI);//middle flower
  fill(255, 0, 255);//pink color for left flower
  arc(560, 400, 200, 200, 0, PI+QUARTER_PI);//right flower
} //Done by Nafis Sabir


