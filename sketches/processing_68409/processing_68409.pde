
//1. Rohan Rathod, rkrathod
//2. All materials and images on this site Copyright (c) 
//Rohan Rathod, 2012. Reproduction, sale and use of 
//any materials or images without consent is strictly prohibited.

void setup() {
  size(550, 500);
  background(138, 44, 94);
  smooth();
  strokeCap(ROUND);




  //backgroundfillFACE
  fill(220, 72, 151, 200);
  beginShape();
  vertex(250, 0);
  vertex(250, 180);
  vertex(250, 180);
  vertex(180, 380);
  vertex(300, 380);
  vertex(300, 500);
  vertex(700, 700);
  vertex(700, 0);
  vertex(250, 0);
  endShape(CLOSE);


  //NOSE
  stroke(60, 216, 76);
  strokeWeight(8);
  line(250, 0, 250, 180);//vertical
  line(250, 180, 180, 380);//oblique clockwise
  line(180, 380, 320, 380);//horizontal east

  fill(220, 72, 151, 200);
  arc(350, 380, 55, 55, PI, 2*PI);//nostril
  line(378, 380, 460, 370);//leg of R
  strokeWeight(4);
  line(300, 380, 300, 500);//chin/mouth vertical

  fill(200, 72, 151, 200);
  arc(350, 380, 40, 40, PI, 2*PI);//nostril

  //MOUSTACHE R
  strokeWeight(1);
  stroke(0);
  fill(0);
  pushMatrix();
  translate(324, 388);
  beginShape();
  vertex(0, 0);
  vertex(0, 50);
  vertex(150, 50);
  vertex(0, 0);
  endShape();
  popMatrix();

  //MOUSTACHE L
  pushMatrix();
  translate(320, 388);
  beginShape();
  vertex(0, 0);
  vertex(0, 50);
  vertex(-150, 50);
  vertex(0, 0);
  endShape();
  popMatrix();

  //'R' on NOSE
  stroke(60, 216, 76);
  strokeWeight(3);
  line(250, 180, 300, 180);
  line(300, 210, 240, 210);
  noFill();
  bezier(240, 210, 280, 210, 250, 210, 250, 380);

  //R NOSE, arc
  pushMatrix();
  translate(300, 195);
  rotate(-PI/2);
  noFill();
  arc(0, 0, 30, 30, 0, PI );
  popMatrix();



  //LEFT EYEBROW
  stroke(0);
  fill(0);
  rect(300, 55, 120, 35);

  //RIGHT EYE
  fill(255);
  strokeWeight(7);
  ellipse(460, 150, 50, 50);
}
//===========================================================
void draw() {

  stroke(0);
  //LEFT EYE
  float r = random(50, 100);

  float g = random(107, 255);



  fill(0, g, 0); 
  ellipse(360, 150, r, r);

  //LEFT EYEBALL
  fill(255);
  strokeWeight(3);
  ellipse(360, 150, 70, 70);



  //RIGHT EYEBROW ZIGZAG
  pushMatrix();
  translate(440, 80);
  noFill();
  beginShape();
  vertex(0, 0);
  vertex(10, 30);
  vertex(20, 0);
  vertex(30, 30);
  vertex(40, 0);
  vertex(50, 30);
  vertex(60, 0);
  vertex(70, 30);
  vertex(80, 0);
  endShape();
  popMatrix();

stroke(254, 131, 180);
strokeWeight(2);
  for (int a = 180; a < 270; a=a+5){
   
    line(425, a, 515, a);
    }
 //saveFrame( “hw1.jpg”);
}
