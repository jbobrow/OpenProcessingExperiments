
//Pinocchio
void setup() {
  size(400, 400);
  strokeWeight(10);
}
void draw() {
//background
  background(141,27,221);
//fill the face color  
  fill(167, 125, 87);
//head  
  ellipse(0, 200, 300, 300);
//mouth
  line(113, 300, 103, 290);  
  line(103, 290, 93, 300);
  line(93, 300, 83, 290);
  line(83, 290, 73, 300);
  line(73, 300, 63, 290);
//suture on the face
  ellipse(0, 200, 150, 300);
//fill color of the suture 
  fill(205, 198, 188);
//suture  on the eye rim
  arc(70, 150, 150, 150, HALF_PI, PI);
  line(70, 200, 70, 225);
  line(0, 150, 20, 150);
//the white of the eye  
  fill(0);
  ellipse(70, 150, 100, 100);
  fill(255);
//iris  
  ellipse(70, 150, 70, 70);
  fill(255, 8, 8);
//pupil  
  ellipse(70, 150, 20, 20);
  fill(167, 125, 87);
//nose  
  rect(150, 200, mouseX + 15, 20);
//speech bubble  
  noFill();
  arc(230, 30, 200, 150, HALF_PI+QUARTER_PI, TWO_PI+HALF_PI);
  line(230, 105, 160, 130);
  line(160, 130, 160, 85);
//speech (X)  
  line(180, 10, 280, 70);
  line(280, 10, 180, 70);
}
