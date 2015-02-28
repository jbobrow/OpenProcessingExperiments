
void setup() {
  size(720, 480); 
  smooth(); 
  strokeWeight(2); 
  background(255); 
  ellipseMode(RADIUS);
  // eye zone
  beginShape(); 
  vertex(280, 240);
  vertex(265, 200); // point
  vertex(280, 160);
  vertex(440, 160);
  vertex(455, 200); // point
  vertex(440, 240);
  endShape();
  // eyes
  ellipse(320, 200, 35, 30);
  ellipse(400, 200, 35, 25);
  fill(0);
  ellipse(310, 190, 5, 5);
  ellipse(390, 190, 5, 5);
  fill(255);
  // head
  beginShape();
  vertex(355, 90);
  vertex(358, 10);
  vertex(363, 10);
  vertex(365, 90);
  endShape();
  arc(360, 90, 20, 20, PI-0.15, PI+PI+0.15);
  arc(360, 160, 80, 70, PI, PI+PI);
  ellipse(360, 10, 10, 10);

  //mouth
  rect(280, 240, 160, 80);
  arc(320, 280, 25, 25, HALF_PI, PI+HALF_PI);
  arc(400, 280, 25, 25, -HALF_PI, HALF_PI);
  line(320, 255, 400, 255); // horizon 
  line(297, 271, 423, 271);
  line(297, 288, 423, 288);
  line(320, 305, 400, 305);

  line(320, 255, 320, 305); // vertical
  line(346, 255, 346, 305);
  line(373, 255, 373, 305);
  line(400, 255, 400, 305);

  //hands
  beginShape();
  vertex(230, 350);
  vertex(130, 200);
  vertex(110, 215);
  vertex(220, 390);
  endShape();
  beginShape();
  vertex(485, 350);
  vertex(585, 200);
  vertex(605, 215);
  vertex(495, 390);
  endShape();
  ellipse(90,170, 40,40); 
  ellipse(626,167, 40, 40);
  quad(130,200, 130, 170, 80, 210, 110, 215);
  quad(585,200, 585, 170, 640, 205, 605, 215);
  
  //point(630, 200); 
  //body
  ellipse(250, 380, 30, 40);
  ellipse(470, 380, 30, 40);
  beginShape();
  vertex(280, 320);
  vertex(240, 360); // point
  vertex(260, 480);
  vertex(280+180, 480);
  vertex(480, 360);
  vertex(440, 320);
  vertex(280, 320);
  endShape();
  line(240, 360, 480, 360);
  rect(300, 380, 120, 100);

  //  vertex(
  //  line(355, 90, 358, 10);
  //  line(365, 90, 363, 10);
}

//void setup(){
//  size(720, 480); 
//  smooth(); 
//  strokeWeight(2); 
//  background(204); 
//  ellipseMode(RADIUS);
//// Neck 
//  stroke(102); 
//  line(266, 257, 266, 162); 
//  line(276, 257, 276, 162); 
//  line(286, 257, 286, 162);
//// Antennae 
//  line(276, 155, 246, 112); 
//  line(276, 155, 306, 56); 
//  line(276, 155, 342, 170);
//// Body 
//  noStroke(); 
//  fill(102); 
//  ellipse(264, 377, 33, 33); 
//  fill(0);
//  rect(219, 257, 90, 120); 
//  fill(102); 
//  rect(219, 274, 90, 6);
//// Head 
//  fill(0); 
//  ellipse(276, 155, 45, 45); 
//  fill(255); 
//  ellipse(288, 150, 14, 14); 
//  fill(0); 
//  ellipse(288, 150, 3, 3); 
//  fill(153); 
//  ellipse(263, 148, 5, 5); 
//  ellipse(296, 130, 4, 4); 
//  ellipse(305, 162, 3, 3);
//}

//void setup(){
//  size(480,120);
//  smooth();
//  
//  //Left creature
//  beginShape();
//  vertex(50,120);
//  vertex(100,90);
//  vertex(110,60);
//  vertex(80,20);
//  vertex(210,60);
//  vertex(160,80);
//  vertex(200,90);
//  vertex(140,100);
//  vertex(130,120);
//  endShape();
//  fill(0);
//  ellipse(155,60,8,8);
//  //Right creature
//  fill(255);
//  beginShape();
//  vertex(370,120);
//  vertex(360, 90);
//  vertex(290,80);
//  vertex(340,70);
//  vertex(280, 50);
//  vertex(420, 10);
//  vertex(390, 50);
//  vertex(410, 90);
//  vertex(460, 120);
//  endShape();
//  fill(255,0,0);
//  ellipse(345,50,10,10);
//}

//void setup(){
//  size(480,120);
//   beginShape();
//   vertex(180, 82); 
//   vertex(207,36);
//   vertex(214,63);
//   vertex(407,11); 
//  vertex(412,30);
////  vertex(219,82);
////  vertex(226,109);
//  endShape(CLOSE);
//}

//void setup(){
//  size (480,120);
//  noStroke();
//  smooth();
//  background(0,26,51); // dark blue color
//  fill(255,0,0,160);    // red color
//  ellipse (132,82,200,200); // red color
//  fill(0,255,0,160);
//  ellipse (255, -16, 200, 200); // green circle
//  fill(0,0,255,160);  // blue color
//  ellipse(265, 118,200,200); // blue color
//}

//void setup(){
//  size(480,120);
//  smooth();
// // background(0); // black
//  fill(153);
//  ellipse(132,82,200,200);
//  //fill(153);
//  noFill();
//  ellipse(228,-16,200,200);
//  fill(102);
//   noStroke();
//   ellipse(268,118,200,200);
//}

//void setup(){
//  size(480,120);
//  smooth();
//  strokeWeight(12);
//  strokeJoin(ROUND);
//  rect(40,25,70,70);
//  //arc(190,60,80,80,0, PI+HALF_PI);
//  strokeJoin(BEVEL);
//  //noSmooth();
//  rect(140,25,70,70);
////  arc(290,60,60,60,PI, PI+HALF_PI);
//  strokeCap(SQUARE);
//  line(270,25,340,95);
//  //arc(390,60,80,80, QUARTER_PI, PI+QUARTER_PI);
//  strokeCap(ROUND);
//  line(350,25,420,95);
//  
//}
//
///*void draw() {
//  
//   if (mousePressed) {
//    fill(80,100,201,20);
//  
//   } else {
//    fill (255,15,23,234);    
//   }
//   line(30,100,450,20);
//   triangle (60,100, 420,30, 420, 100);
//}*/


