
void setup () {
  size(1020, 715);


  //PImage img;
 // img = loadImage("kandinsky2.jpg");
 // background(img);


  fill(000);
  triangle(815, 550, 825, 438, 600, 502);
  triangle(855, 580, 960, 685, 990, 680);

  strokeWeight(3);
  line( 270, 186, 395, 186);
  line( 315, 200, 325, 170);
  line( 330, 220, 353, 160);


  strokeWeight(20);
  stroke(233, 175, 29);
  ellipse(340, 545, 200, 200);

  strokeWeight(0);
  fill(60, 116, 106);
  triangle(495, 0, 495, 43, 440, 25);

  fill(115, 77, 49);
  triangle(1020, 0, 1020, 300, 745, 0);

  noStroke();
  fill(59, 114, 153);
  rect(450, 655, 24, 24);

  fill(51, 45, 81);
  ellipse(867, 179, 220, 220);

  fill(60, 91, 75);
  rect(515, 316, 20, 32);

  fill(171, 214, 194);
  rect(515, 170, 20, 145);

 fill(235, 236, 220);
  rect(515, 140, 21, 31);
  
   fill(126, 181, 145);
  rect(515, 119, 21, 21);

 fill(213, 166, 36);
  rect(515, 99, 21, 21);
  
  fill(246, 250, 227);
  rect(515, 79, 21, 21); 
  
   fill(56, 139, 113);
  rect(494, 140, 21, 31);
  
   fill(197, 67, 51);
  rect(494, 119, 21, 21);

 fill(241, 243, 230);
  rect(494, 99, 21, 21);
  
  fill(70, 98, 86);
  rect(494, 79, 21, 21); 
  
     fill(229, 217, 179);
  rect(445, 140, 49, 31);
  
   fill(145, 100, 43);
  rect(445, 119, 49, 21);

 fill(202, 166, 16);
  rect(445, 99, 49, 21);
  
  fill(226, 206, 137);
  rect(445, 79, 49, 21); 
  
  fill(173, 132, 44);
  rect(445, 53, 70, 21); 
 
   fill(160, 190, 162);
  rect(515, 0, 21, 55);  
  
  fill(000);
  rect(164, 681, 38, 34);
  rect(164, 605, 38, 34);
  rect(164, 530, 38, 36);

  rect(205, 570, 38, 36);
  rect(205, 645, 38, 36);

  rect(245, 530, 38, 36);
  rect(245, 605, 38, 36);
  rect(245, 681, 38, 36);

  rect(285, 570, 38, 36);
  rect(285, 645, 38, 36);

  fill(255);
  rect(164, 645, 38, 34);
  rect(164, 570, 38, 36);

  rect(205, 530, 38, 36);
  rect(205, 605, 38, 36);
  rect(205, 681, 38, 36);

  rect(245, 570, 38, 36);
  rect(245, 645, 38, 36);

  rect(285, 530, 38, 36);
  rect(285, 605, 38, 36);
  rect(285, 681, 38, 36);

  fill(221, 196, 112);
  quad(890, 80, 810, 70, 970, 240, 990, 150);

  fill(60, 70, 43);
  ellipse(390, 345, 46, 46);

  fill(79, 139, 209);
  rect(280, 350, 50, 18);

  fill(186, 73, 49);
  quad(270, 290, 320, 318, 285, 390, 240, 330);

  fill(231, 56, 71);
  rect(343, 390, 17, 17);


  stroke(0);
  noFill();
  strokeWeight(5);
  beginShape();
  vertex(605, 430);
  vertex(605, 555);
  vertex(470, 555);
  endShape();

  noFill();
  beginShape();
  vertex(350, 500);
  vertex(430, 420);
  vertex(390, 500);
  endShape();

  noFill();
  beginShape();
  vertex(320, 500);
  vertex(390, 690);
  vertex(370, 500);
  endShape();

  strokeWeight(37);
  ellipse(867, 179, 220, 220);

  strokeWeight(2);
  beginShape(QUAD_STRIP); 
  vertex(535, 350); 
  vertex(445, 350);

  vertex(535, 170);
  vertex(445, 170);

  vertex(535, 75); 
  vertex(445, 75);

  vertex(535, 0); 
  vertex(445, 0);
  endShape();


  smooth();
  stroke(0);
  strokeWeight(2);
  curve(780, 980, 580, 300, 655, 10, 900, 0);
  curve(900, 900, 640, 110, 565, 20, 400, 0);


  strokeWeight(2);
  fill(187, 51, 47);
  rect(445, 153, 33, 69);


  fill(231, 204, 58);
  rect(395, 153, 49, 32);

  fill(127, 98, 37);
  rect(395, 186, 49, 36);

  fill(255);
  rect(445, 315, 70, 33);

  fill(160, 134, 39);
  rect(445, 283, 70, 30);

  strokeWeight(9);
  line(330, 0, 610, 430);


  strokeWeight(2);
  fill(203, 127, 43);
  quad(215, 270, 250, 265, 270, 325, 250, 325);

  int[ ] coords = {
    40, 40, 80, 60, 100, 100, 60, 120, 50, 150
  };
  int i;

  smooth();
  noFill();
  color(255);
  strokeWeight(21);
  beginShape();
  curveVertex(0, 0); // the first control point
  curveVertex(100, 0); // is also the start point of curve
  curveVertex(160, 80);
  curveVertex(60, 110);
  curveVertex(70, 200);
  curveVertex(50, 240); 
  endShape();
}



