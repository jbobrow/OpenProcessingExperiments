
void setup() {
  size(700, 780);
  background(235, 170, 0);
  
  // vertical line
  stroke(140, 80, 0);
  strokeWeight(1.5);
  beginShape(LINES);
  vertex(10, 10);
  vertex(700, 10);
  endShape();
  
  
  // horizontal line
  stroke(235, 150, 0);
  strokeWeight(1);
  beginShape(LINES);
  vertex(10, 10);
  vertex(10, 770);
  endShape();
  
  stroke(40);
  strokeWeight(6);
  
  // box
  fill(113, 107, 57);
  rect(50, 40, 600, 700);
  
  // sky
  fill(164, 94, 58);
  beginShape();
  vertex(270, 40);
  vertex(650, 40);
  vertex(650, 410);
  vertex(490, 410);
  vertex(460, 160);
  vertex(400, 240);
  vertex(375, 240);
  vertex(350, 150);
  vertex(340, 220);  
  vertex(275, 220);
  vertex(270, 40);
  endShape();
  
  // bottom ship
  fill(138, 101, 82);
  beginShape();
  vertex(275, 470);
  vertex(260, 450);
  vertex(650, 450);
  vertex(650, 740);
  vertex(450, 740);
  vertex(275, 470);
  endShape();
 
 
  // fish ears
  fill(137, 97,87);
  beginShape();
  vertex(340, 220);
  vertex(350, 150);
  vertex(375, 240);
  endShape();
  beginShape();
  vertex(400, 240);
  vertex(460, 160);
  vertex(460, 160);
  vertex(490, 410);
  vertex(400, 410);
  endShape();
  
  // fish beard
  fill(248, 203, 138);
  beginShape();
  vertex(175, 430);
  vertex(270, 468);
  vertex(235, 560);
  vertex(185, 560);
  vertex(175, 430);
  endShape();
  
  // fish face
  fill(235, 107, 8);
  ellipse(280, 331, 310, 268);
  
 
  stroke(40);
  strokeWeight(6);
  
  // eyeball
  fill(248, 203, 138);
  ellipse(340, 300, 70, 65);
  
  // eye pupil
  noStroke();
  fill(10);
  ellipse(340, 300, 20, 20);
  
  // mouth
  noStroke();
  fill(248, 203, 138);
  beginShape();
  vertex(100, 288);
  vertex(315, 288);
  vertex(315, 318);
  vertex(127, 318);
  vertex(135, 288);
  endShape();
  
  stroke(40);
  strokeWeight(6);
  
  // mouth outline
  line(135, 288, 308, 288);
  line(310, 318, 127, 318);
  
  
  // sea
  fill(166, 101, 73);
  beginShape();
  vertex(50, 600);
  vertex(390, 650);
  vertex(450, 740);
  vertex(50, 740);
  vertex(50, 660);
  endShape();

  // wave 1 
  fill(119, 20, 21);
  beginShape();
  vertex(53, 530);
  vertex(95, 570);
  vertex(95, 570);
  vertex(125, 540);
  vertex(125, 540);
  vertex(150, 570);
  vertex(150, 570);
  vertex(185, 543);
  vertex(185, 543);
  vertex(205, 565);
  vertex(205, 565);
  vertex(225, 538);
  vertex(225, 538);
  vertex(255, 575);
  vertex(255, 575);
  vertex(280, 550);
  vertex(280, 550);
  vertex(300, 575);
  vertex(300, 575);
  vertex(315, 560);
  vertex(315, 560);
  vertex(330, 560);
  vertex(330, 560);
  vertex(345, 580);
  vertex(345, 580);
  vertex(320, 610);
  vertex(320, 610);
  vertex(300, 600);
  vertex(300, 600);
  vertex(280, 620);
  vertex(280, 620);
  vertex(245, 590);
  vertex(245, 590);
  vertex(220, 610);
  vertex(220, 610);
  vertex(187, 580);
  vertex(187, 580);
  vertex(150, 610);
  vertex(150, 610);
  vertex(125, 580);
  vertex(125, 580);
  vertex(90, 610);
  vertex(90, 610);
  vertex(53, 580);
  endShape(CLOSE); 
  
  // wave 2
  fill(244, 198, 143);
  beginShape();
  vertex(53, 580);
  vertex(90, 610);
  vertex(90, 610);
  vertex(125, 580);
  vertex(125, 580);
  vertex(150, 610);
  vertex(150, 610);
  vertex(187, 580);
  vertex(187, 580);
  vertex(220, 610);
  vertex(220, 610);
  vertex(245, 590);
  vertex(245, 590);
  vertex(280, 620);
  vertex(280, 620);
  vertex(300, 600);
  vertex(300, 600);
  vertex(320, 610);
  vertex(320, 610);
  vertex(345, 580);
  vertex(345, 580);
  vertex(365, 615);
  vertex(365, 615);
  vertex(340, 635);
  vertex(340, 635);
  vertex(320, 645);
  vertex(320, 645);
  vertex(300, 635);
  vertex(300, 635);
  vertex(280, 645);
  vertex(280, 645);
  vertex(250, 620);
  vertex(250, 620);
  vertex(217, 640);
  vertex(217, 640);
  vertex(187, 618);
  vertex(187, 618);
  vertex(150, 640);
  vertex(150, 640);
  vertex(125, 620);
  vertex(125, 620);
  vertex(93, 640);
  vertex(93, 640);
  vertex(53, 616);
  vertex(53, 580);
  endShape();
  
  // wave 3
  fill(119, 20, 21);
  beginShape();
  vertex(50, 640);
  vertex(85, 670);
  vertex(85, 670);
  vertex(123, 650);
  vertex(123, 650);
  vertex(150, 670);
  vertex(150, 670);
  vertex(192, 645);
  vertex(192, 645);
  vertex(240, 675);
  vertex(240, 675);
  vertex(275, 655);
  vertex(275, 655);
  vertex(310, 670);
  vertex(310, 670);
  vertex(350, 650);
  vertex(350, 650);
  vertex(360, 625);
  vertex(360, 625);
  vertex(320, 645);
  vertex(320, 645);
  vertex(300, 635);
  vertex(300, 635);
  vertex(280, 645);
  vertex(280, 645);
  vertex(250, 620);
  vertex(250, 620);
  vertex(217, 640);
  vertex(217, 640);
  vertex(187, 618);
  vertex(187, 618);
  vertex(150, 640);
  vertex(150, 640);
  vertex(125, 620);
  vertex(125, 620);
  vertex(94, 640);
  vertex(93, 640);
  vertex(53, 616);
  vertex(53, 616);
  vertex(50, 660);
  endShape();

  // triangle 
  stroke(40);
  strokeWeight(2);
  fill(21, 4, 41);
  beginShape();
  vertex(360, 605);
  vertex(340, 645);
  vertex(340, 645);
  vertex(400, 665);
  endShape(CLOSE);
  
  stroke(40);
  strokeWeight(6);
  
 // rectangle 1  
  fill(210, 100, 0);
  rect(360, 410, 290, 38);
  
  // rectangle 2
  fill(145, 17, 18);
  rect(360, 480, 290, 38);
  
  //sun 
  fill(197, 95, 11);
  arc(645, 44, 240, 240, PI/2, PI);
  
  //egg white
  fill(207, 166, 104);
  ellipse(565, 640, 120, 120);
  
  //egg yellow
  fill(232, 156, 22);
  ellipse(565, 640, 70, 70);
 
  
}

