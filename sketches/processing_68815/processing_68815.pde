
void setup() {
  size(400, 600);
  background(0);
}

void draw() {


  //background(240,161,252);
  background(250, 18, 255);


  //fill(map(mouseY, 0, 600, 0, 255),random(0,255));

fill(map(mouseX, 0, 400, 0, 255), map(mouseY, 0,400,0,255), random(0,400));
 //ellipse(200,200,200,200);

 arc(93, 87, 140, 150, 0, PI/2);
 arc(307, 87, 140, 150, PI/2, PI);
 
  //fill(255,255,255);

  //fill(36,33,255);
  //fill(143,5,165);
  //fill(99,52,245);
  //fill(91,9,106);
  arc(110, 60, 200, 100, PI, TWO_PI-PI/2);
  arc(290, 60, 200, 100, TWO_PI-PI/2, TWO_PI);
  rect(60, 60, 285, 350);
  rect(10, 60, 381, 350);
  arc(290, 60, 100, 100, PI, TWO_PI-PI/2);
  arc(110, 60, 100, 100, TWO_PI-PI/2, TWO_PI);
  noStroke();
  rect(11, 60, 379, 10);
  fill(255,255,255);
  rect(10, 420, 380, 10);
    //arc(93, 87, 140, 150, 0, PI/2);
 // arc(307, 87, 140, 150, PI/2, PI);
  //base king
  fill(31, 131, 34);
  ellipse(200, 90, 75, 110);
  ellipse(90, 200, 110, 75);
  ellipse(310, 200, 110, 75);
  ellipse(200, 290, 100, 110);


 
  noStroke();
  fill(31, 131, 34);
  ellipse(200, 340, 60, 30);
  

  ellipse(100, 200, 60, 60);
  ellipse(300, 200, 40, 60);
  ellipse(310, 190, 70, 30);
  ellipse(310, 210, 70, 30);
  ellipse(90, 190, 70, 30);
  ellipse(90, 210, 70, 30);

  ellipse(200, 200, 225, 225);

  fill(34, 113, 36);
  ellipse(200, 200, 150, 150);

  //fill(254,255,15);
fill(map(mouseX, 0, 400, 0, 255), map(mouseY, 0,400,0,255), random(0,400));
 arc(93, 87, 140, 150, 0, PI/2);
 arc(307, 87, 140, 150, PI/2, PI);


  fill(31, 131, 34);

  noStroke();
  ellipse(200, 300, 95, 25);
  noFill();

  stroke(31, 62, 18);
  strokeWeight(3);
  beginShape();
  vertex(150, 277);
  vertex(160, 284);
  vertex(210, 310);
  vertex(215, 312);
  vertex(208, 307);
  endShape();

  beginShape();
  vertex(250, 277);
  vertex(240, 284);
  vertex(190, 310);
  vertex(185, 312);
  vertex(192, 307);
  endShape();


  beginShape();
  vertex(148, 298);
  vertex(150, 300);
  vertex(161, 310);
  endShape();

  beginShape();
  vertex(252, 298);
  vertex(250, 300);
  vertex(239, 310);
  endShape();
  noStroke();
  //strokeweight(3);


  //fill(36,33,255);
  //fill(143,5,165);
  fill(255, 255, 255);
  
  //need to be clovers
 // fill(map(mouseX, 0, 400, 0, 255), map(mouseY, 0,400,0,255), random(0,400));
 //arc(93, 87, 140, 150, 0, PI/2);
 //arc(307, 87, 140, 150, PI/2, PI);
 
 fill(255,255,255);

  //beard
  beginShape();
  stroke(255, 255, 255);
  vertex(170, 90);
  vertex(165, 110);
  vertex(160, 130);
  vertex(170, 150);
  vertex(180, 160);
  vertex(200, 170);
  vertex(220, 160);
  vertex(230, 150);
  vertex(240, 130);
  vertex(240, 130);
  vertex(235, 110);
  vertex(230, 100);
  endShape();

  beginShape();
  vertex(90, 170);
  vertex(110, 165);
  vertex(130, 160);
  vertex(150, 170);
  vertex(160, 180);
  vertex(170, 200);
  vertex(160, 220);
  vertex(150, 230);
  vertex(130, 240);
  vertex(130, 240);
  vertex(110, 235);
  vertex(100, 230);
  endShape();

  beginShape();
  vertex(310, 170);
  vertex(290, 165);
  vertex(270, 160);
  vertex(250, 170);
  vertex(240, 180);
  vertex(230, 200);
  vertex(240, 220);
  vertex(250, 230);
  vertex(270, 240);
  vertex(270, 240);
  vertex(290, 235);
  vertex(300, 230);
  endShape();


  //forehead
  fill(255, 238, 180);

  noStroke();
  //ellipse(100,200,60,60);
  //ellipse(300,200,40,60);
  //ellipse(310,190,70,30);
  //ellipse(310,210,70,30);
  //ellipse(90,190,70,30);
  //ellipse(90,210,70,30);

  noStroke();
  //main
  ellipse(200, 70, 60, 40);
  ellipse(200, 330, 60, 40);
  ellipse(330, 200, 40, 60);
  ellipse(70, 200, 40, 60);

  fill(214, 184, 76);
  //blue fill(93,145,255);
  beginShape();
  vertex(180, 90);
  bezierVertex(160, 90, 175, 50, 190, 70);
  bezierVertex(193, 77, 190, 85, 180, 90);
  endShape();

  beginShape();
  vertex(90, 180);
  bezierVertex(90, 160, 50, 175, 70, 190);
  bezierVertex(77, 193, 85, 190, 90, 180);
  endShape();

  beginShape();
  vertex(180, 310);
  bezierVertex(160, 310, 175, 350, 190, 330);
  bezierVertex(193, 323, 190, 315, 180, 310);
  endShape();

  beginShape();
  vertex(310, 180);
  bezierVertex(310, 160, 350, 175, 330, 190);
  bezierVertex(323, 193, 315, 190, 310, 180);
  endShape();

  beginShape();
  vertex(220, 90);
  bezierVertex(240, 90, 225, 50, 210, 70);
  bezierVertex(207, 77, 210, 85, 220, 90);
  endShape();
  beginShape();
  vertex(220, 310);
  bezierVertex(240, 310, 225, 350, 210, 330);
  bezierVertex(207, 323, 210, 315, 220, 310);
  endShape();
  beginShape();
  vertex(310, 220);
  bezierVertex(310, 240, 350, 225, 330, 210);
  bezierVertex(323, 207, 315, 210, 310, 220);
  endShape();
  beginShape();
  vertex(90, 220);
  bezierVertex(90, 240, 50, 225, 70, 210);
  bezierVertex(77, 207, 85, 210, 90, 220);
  endShape();
  noStroke();
  //eyes

  //right
  fill(255, 255, 255);
  beginShape();
  vertex(170, 90);
  bezierVertex(175, 80, 180, 70, 185, 85);
  vertex(180, 90);
  endShape();

  beginShape();
  vertex(170, 310);
  bezierVertex(175, 320, 180, 330, 185, 315);
  vertex(180, 310);
  endShape();

  //left
  beginShape();
  vertex(230, 90);
  bezierVertex(225, 80, 220, 70, 215, 85);
  vertex(220, 90);
  endShape();

  beginShape();
  vertex(230, 310);
  bezierVertex(225, 320, 220, 330, 215, 315);
  vertex(220, 310);
  endShape();

  //west
  //pupils
  fill(0);
  ellipse(175, 90, 5, 15);
  ellipse(225, 90, 5, 15);

  ellipse(175, 310, 5, 15);
  ellipse(225, 310, 5, 15);

  //cheek
  fill(255, 238, 180);
  beginShape();
  vertex(165, 110);
  bezierVertex(170, 80, 185, 90, 195, 80);
  bezierVertex(195, 100, 185, 100, 165, 110);
  endShape();

  beginShape();
  vertex(165, 290);
  bezierVertex(170, 320, 185, 310, 195, 320);
  bezierVertex(195, 300, 185, 300, 165, 290);
  endShape();

  beginShape();
  vertex(110, 165);
  bezierVertex(80, 170, 90, 185, 80, 195);
  bezierVertex(100, 195, 100, 185, 110, 165);
  endShape();

  beginShape();
  vertex(290, 165);
  bezierVertex(320, 170, 310, 185, 320, 195);
  bezierVertex(300, 195, 300, 185, 290, 165);
  endShape();

  //cheek
  beginShape();
  vertex(235, 110);
  bezierVertex(230, 80, 215, 90, 205, 80);
  bezierVertex(205, 100, 215, 100, 235, 110);
  endShape();

  beginShape();
  vertex(235, 290);
  bezierVertex(230, 320, 215, 310, 205, 320);
  bezierVertex(205, 300, 215, 300, 235, 290);
  endShape();

  beginShape();
  vertex(110, 235);
  bezierVertex(80, 230, 90, 215, 80, 205);
  bezierVertex(100, 205, 100, 215, 110, 235);
  endShape();

  beginShape();
  vertex(290, 235);
  bezierVertex(320, 230, 310, 215, 320, 205);
  bezierVertex(300, 205, 300, 215, 290, 235);
  endShape();

  stroke(0);

  //crown
  fill(254, 255, 15);

  noStroke();
  fill(254, 255, 15);
  beginShape();
  vertex(165, 70);
  vertex(162, 65);
  vertex(165, 60);
  vertex(168, 58);
  endShape();

  beginShape();
  vertex(235, 70);
  vertex(238, 65);
  vertex(235, 60);
  vertex(232, 58);
  endShape();

  beginShape();
  vertex(165, 70);
  bezierVertex(183, 50, 217, 50, 235, 70);
  bezierVertex(217, 40, 183, 40, 165, 70);
  endShape();

  ellipse(200, 35, 9, 9);
  ellipse(192, 40, 9, 9);
  ellipse(208, 40, 9, 9);

  //beginShape();
  //vertex(192,35);
  //vertex(185,40);
  //vertex(215,40);
  //vertex(208,35);
  //
  endShape();

  beginShape();
  vertex(192, 40);
  vertex(195, 50);
  vertex(208, 50);
  vertex(205, 40);
  endShape();



  beginShape();


  //nose
  fill(214, 184, 76);
  noStroke();
  ellipse(200, 90, 10, 10);
  ellipse(195, 95, 6, 6);
  ellipse(205, 95, 6, 6);

  ellipse(200, 310, 10, 10);
  ellipse(195, 305, 6, 6);
  ellipse(205, 305, 6, 6);

  ellipse(90, 200, 10, 10);
  ellipse(95, 195, 6, 6);
  ellipse(95, 205, 6, 6);

  ellipse(310, 200, 10, 10);
  ellipse(305, 195, 6, 6);
  ellipse(305, 205, 6, 6);
  //nostrils
  fill(0);
  ellipse(205, 95, 2, 2);
  ellipse(195, 95, 2, 2);
  ellipse(205, 305, 2, 2);
  ellipse(195, 305, 2, 2);
  ellipse(95, 205, 2, 2);
  ellipse(95, 195, 2, 2);
  ellipse(305, 205, 2, 2);
  ellipse(305, 195, 2, 2);


  noStroke();
  //side clovers
  ellipse(100, 100, 20, 40);
  ellipse(130, 100, 20, 30);
  //side clovers
  ellipse(300, 100, 20, 40);
  ellipse(270, 100, 20, 30);


  //teeth
  noStroke();
  fill(255, 255, 255);
  ellipse(120, 210, 5, 5);
  ellipse(120, 190, 5, 5);
  ellipse(120, 200, 5, 5);
  ellipse(110, 205, 5, 5);
  ellipse(110, 195, 5, 5);

  ellipse(280, 210, 5, 5);
  ellipse(280, 190, 5, 5);
  ellipse(280, 200, 5, 5);
  ellipse(290, 205, 5, 5);
  ellipse(290, 195, 5, 5);

  //staff
  //fill(0);
  //rect(114,120,4,350);

  //ellipse(115, 118, 15,4);

  //rect(283,120,4,350);

  //ellipse(285,118,15,4);

  //finish staffs
  //color beards
  //reconsider background
  //cloth head/drapery

  fill(250, 18, 255);
  rect(0, 390, 400, 10);

  arc(400, 390, 200, 100, PI, TWO_PI-PI/2);
  arc(10, 390, 200, 100, TWO_PI-PI/2, TWO_PI);


  fill(254, 255, 15);
  ellipse(370, 370, 30, 30);
  ellipse(30, 370, 30, 30);
  ellipse(335, 380, 20, 20);
  ellipse(65, 380, 20, 20);


  

  //fill(255,255,80);
  fill(73, 75, 27);
  //chair

 float mx = constrain(map(mouseX, 0, 400, 0, 200), 10, 200);
//xoffset = map(mouseX, 0, 00, 0, 00);

  //fill(255,255,80);
  fill(73, 75, 27);
  //chair

  //back
  rect(mx+60, 375, 75, 120);
  //back legs
  rect(mx+60, 475, 10, 70);
  rect(mx+125, 475, 10, 70);



  //back
  //rect(200, 375, 75, 120);
  //back legs
 // rect(265, 475, 10, 70);
 // rect(200, 475, 10, 70);




  //ass part
  beginShape();
  vertex(mx+60, 475);
  vertex(mx+10, 500);
  vertex(mx+185, 500);
  vertex(mx+135, 475);
  endShape();
  //legs
  rect(mx+10, 500, 10, 75);
  rect(mx+175, 500, 10, 75);

}

