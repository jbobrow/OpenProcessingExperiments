
void setup() {

 
  size(600, 600);
  

  smooth();
 
  strokeWeight(3);
}


void draw() {
  
fill(255);
rect(152, 112, 285, 285, 7);
fill(255,0,127);
ellipse(300,168,70,70);

noFill();
arc(235, 252, 130, 150, PI+QUARTER_PI, TWO_PI-QUARTER_PI);
arc(356, 260, 130, 150, PI+QUARTER_PI, TWO_PI-QUARTER_PI);
arc(234, 272, 130, 150, PI+QUARTER_PI, TWO_PI-QUARTER_PI);
arc(356, 280, 130, 150, PI+QUARTER_PI, TWO_PI-QUARTER_PI);
arc(300, 158, 25, 25, HALF_PI, PI+HALF_PI+QUARTER_PI);
arc(298, 182, 25, 25, PI+HALF_PI, TWO_PI+HALF_PI+QUARTER_PI);
fill(0);
triangle(189, 198, 188, 222, 162, 220);
triangle(400, 202, 397, 225, 428, 220);
noFill();
arc(282, 246, 90+mouseX/10, 55, TWO_PI-QUARTER_PI,QUARTER_PI+TWO_PI);
arc(250, 249, 90, 80, TWO_PI-QUARTER_PI,QUARTER_PI+TWO_PI);
arc(290, 310, 70, 65, PI, PIE+HALF_PI);
line(313, 268, 303,283);
line(257,312,270,390);
line(279,312,290,390);
line(283,312,320,390);
line(302,282,335,390);


}
