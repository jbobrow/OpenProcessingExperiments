
void setup() {
  size(600, 600);
  background(0);
}
void draw() {
  smooth();
  stroke(255);
  strokeWeight(2);
  strokeJoin(ROUND);
  strokeCap(ROUND); 
  //body outline 
  beginShape();
  noFill();
  curveVertex(540, 375);//top of front leg
  curveVertex(540, 375);
  curveVertex(595, 285);//breast
  curveVertex(574, 200);//right side neck below cheek
  curveVertex(590, 150);//right cheek
  curveVertex(580, 75);
  curveVertex(590, 15);//point of right ear
  curveVertex(535, 22);
  curveVertex(510, 10);//top of head
  curveVertex(450, 10);//top of head
  curveVertex(425, 22);//L ear
  curveVertex(370, 20);//L ear point
  curveVertex(375, 75);//L ear
  curveVertex(375, 110);//neck
  curveVertex(360, 130);//neck
  curveVertex(250, 100);//back
  curveVertex(150, 120);//back 
  curveVertex(75, 300);
  curveVertex(10, 525);//rump turn in
  curveVertex(40, 580);//rump turn out
  curveVertex(265, 580);//the floor begins
  curveVertex(455, 580);//floor
  curveVertex(580, 580);//floor
  curveVertex(590, 540);//top of front paw
  curveVertex(580, 525);
  curveVertex(565, 525);
  curveVertex(535, 515);
  curveVertex(540, 375);
  curveVertex(540, 375);
  endShape();

  //chin/neck
  beginShape();
  noFill();
  curveVertex(370, 130);//left cheek
  curveVertex(370, 130);
  curveVertex(375, 160);
  curveVertex(430, 190);
  curveVertex(460, 220);//Chin
  curveVertex(510, 220);
  curveVertex(540, 190);
  curveVertex(585, 135);
  curveVertex(587, 130);
  curveVertex(587, 130);
  endShape();

  //tailwrap
  beginShape();
  noFill();
  curveVertex(540, 527);
  curveVertex(540, 527);
  curveVertex(550, 535);
  curveVertex(570, 560);
  curveVertex(515, 570);
  curveVertex(505, 580);
  curveVertex(505, 580);
  endShape();

  //front legs
  beginShape();
  noFill();
  curveVertex(500, 328);
  curveVertex(500, 328);
  curveVertex(472, 414);
  curveVertex(500, 545);
  curveVertex(500, 545);
  endShape();
  
  //front legs
  beginShape();
  noFill();
  curveVertex(343,300);
  curveVertex(343,300);
  curveVertex(370, 350);
  curveVertex(455, 545);
  curveVertex(490, 570);
  curveVertex(490, 570);
  endShape();

  //back foot
  beginShape();
  noFill();
  curveVertex(260,580);
  curveVertex(260,580);
  curveVertex(400, 545);
  curveVertex(490, 570);
  curveVertex(500, 575);
  endShape();

  rect(3, 3, 594, 594, 10);

}
