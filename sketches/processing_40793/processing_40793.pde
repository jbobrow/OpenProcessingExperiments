

//setup & background
void setup() {
  size(320, 600);
  smooth();
  background(240, 220, 180);
}

void drawCircles(){
  //blue
  stroke(0);
  strokeWeight(1.5);
  fill(100, 110, 150);
  ellipse(203.5, 427, 68, 68);

  //ring
  stroke(0);
  strokeWeight(1.5);
  fill(0);
  arc(203.5, 427, 68, 68, 143*PI/180, 234*PI/180);
  fill(230, 215, 130);
  arc(203.5, 427, 68, 68, 164*PI/180, 187*PI/180);

  fill(255);
  arc(203.5, 427, 68, 68, 249*PI/180, 261*PI/180);
  strokeWeight(1);
  line(203.5, 427, 195, 394);
  line(203.5, 427, 192, 395);
  line(203.5, 427, 198, 394);

  stroke(0);
  strokeWeight(1.5);
  fill(0);
  arc(203.5, 427, 68, 68, 292*PI/180, 351*PI/180);
  fill(230, 215, 130);
  arc(203.5, 427, 68, 68, 332*PI/180, 342*PI/180);

  stroke(0);
  strokeWeight(1.5);
  fill(0);
  arc(203.5, 427, 68, 68, 16*PI/180, 56*PI/180);

  stroke(0);
  strokeWeight(1.5);
  fill(255);
  arc(203.5, 427, 68, 68, 88*PI/180, 112*PI/180);
  line(203.5, 427, 204.7, 460);
  line(203.5, 427, 201.7, 460);
  line(203.5, 427, 197.8, 459);
  line(203.5, 427, 193.7, 458);
  line(203.5, 427, 190.7, 457);

  //white circle
  stroke(0);
  strokeWeight(1);
  fill(238, 228, 207);
  ellipse(203.5, 427, 52, 52);

  //small white circle
  stroke(1);
  fill(238, 228, 207);
  arc(266, 425, 20, 20, 56*PI/180, 236*PI/180);
}

void drawArrow(){
   //left
  noStroke();
  fill(200, 200, 170);
  arc(210, 426.5, 166, 166, 197*PI/180, 207*PI/180);
  noStroke();
  fill(238, 228, 207);
  arc(210, 426.5, 124, 124, 197*PI/180, 207*PI/180);
  noStroke();
  fill(195, 60, 30);
  arc(210, 426.5, 114, 114, 197*PI/180, 207*PI/180);
  noStroke();
  fill(238, 228, 207);
  arc(210, 426.5, 102, 102, 197*PI/180, 207*PI/180);
  noStroke();
  fill(0);
  arc(210, 426.5, 100, 100, 197*PI/180, 207*PI/180);
  noStroke();
  fill(238, 228, 207);
  arc(210, 426.5, 98, 98, 197*PI/180, 207*PI/180);
  noStroke();
  fill(0);
  arc(210, 426.5, 96, 96, 197*PI/180, 207*PI/180);
  noStroke();
  fill(238, 228, 207);
  arc(210, 426.5, 94, 94, 197*PI/180, 207*PI/180);
  noStroke();
  fill(0);
  arc(210, 426.5, 92, 92, 197*PI/180, 207*PI/180);
  noStroke();
  fill(238, 228, 207);
  arc(210, 426.5, 90, 90, 197*PI/180, 207*PI/180);
  noStroke();
  fill(195, 60, 30);
  arc(210, 426.5, 81, 81, 197*PI/180, 207*PI/180);

  //right upper
  noStroke();
  fill(0);
  arc(210, 426.5, 214, 214, 307.55*PI/180, 311.45*PI/180);
  stroke(240, 220, 180);
  fill(240, 220, 180);
  arc(210, 426.5, 146.6, 146.6, 307*PI/180, 312*PI/180);
  noStroke();
  fill(195, 60, 30);
  arc(210, 426.5, 132, 132, 307*PI/180, 312*PI/180);
  noStroke();
  fill(238, 228, 207);
  arc(210, 426.5, 88, 88, 307*PI/180, 312*PI/180);
  noStroke();
  fill(195, 60, 30);
  arc(210, 426.5, 60, 60, 307*PI/180, 312*PI/180);
  //right below
  noStroke();
  fill(230, 215, 100);
  arc(210, 426.5, 328, 328, 45*PI/180, 51*PI/180);
  noStroke();
  fill(0);
  arc(210, 426.5, 144, 144, 45*PI/180, 51*PI/180);
  noStroke();
  fill(255);
  arc(210, 426.5, 140, 140, 45*PI/180, 51*PI/180);
  noStroke();
  fill(0);
  arc(210, 426.5, 130, 130, 45*PI/180, 51*PI/180);
  noStroke();
  fill(255);
  arc(210, 426.5, 120, 120, 45*PI/180, 51*PI/180);
  noStroke();
  fill(0);
  arc(210, 426.5, 110, 110, 45*PI/180, 51*PI/180);
  noStroke();
  fill(255);
  arc(210, 426.5, 104, 104, 45*PI/180, 51*PI/180);
  noStroke();
  fill(195, 60, 30);
  arc(210, 426.5, 60, 60, 45*PI/180, 51*PI/180);

  stroke(0);
  strokeWeight(1.5);
  noFill();
  ellipse(203.5, 427, 68, 68);
}
void draw() {
  //big triangle
  stroke(0);
  strokeWeight(3);
  fill(238, 228, 207);
  triangle(122, 60, -23, 600, 280, 600);

  //left-down green triangle
  noStroke();
  fill(220, 230, 190, 255);
  triangle(0, 416, 0, 600, 210, 600);
  strokeWeight(4);
  stroke(0);
  line(-23, 600, 22, 433);

  //3 half circles at bottom
  //yellow
  stroke(230, 215, 130);
  strokeWeight(7);
  fill(235, 230, 210);
  ellipse(70, 600, 100, 100);
  stroke(0);
  strokeWeight(1);
  fill(235, 230, 210);
  ellipse(70, 600, 100, 100);
  //red
  stroke(190, 60, 30);
  strokeWeight(6);
  fill(235, 230, 210);
  ellipse(177, 600, 100, 100);
  //black
  stroke(0);
  strokeWeight(1);
  fill(235, 230, 210);
  ellipse(280, 600, 100, 100);
  strokeWeight(2);
  stroke(0);
  strokeWeight(4);
  line(280, 600, 265, 550);

  //同心圓1
  //red
  stroke(195, 60, 30);
  strokeWeight(6);
  fill(240, 220, 180);
  ellipse(266, 425, 80, 80);
  //yellow
  stroke(230, 215, 130);
  strokeWeight(6);
  fill(222, 222, 222);
  ellipse(266, 425, 50, 50);
  //black
  noStroke();
  fill(0);
  ellipse(266, 425, 20, 20);

  //brown & green triangle
  fill(90, 130, 90);
  triangle(44, 490, 227, 365, 308, 490);
  fill(170, 120, 55);
  triangle(44, 490, 215, 374, 247, 490);


  //left-down lines
  stroke(0);
  strokeWeight(1);
  fill(0);
  quad(-5, 507, -5, 515, 142, 486, 140, 481);
  stroke(0);
  strokeWeight(1);
  fill(134, 55, 30);
  quad(-5, 531, -5, 537, 103, 505, 99, 502);
  noStroke();
  fill(235, 225, 190);
  quad(-5, 515, -5, 531, 99, 502, 93, 497);
  stroke(0);
  strokeWeight(3);
  line(-5, 415, 132, 530);

  //left circles
  //blue
  stroke(0);
  strokeWeight(1);
  fill(145, 155, 160);
  ellipse(65, 115, 35, 35);
  //red
  stroke(0);
  strokeWeight(1);
  fill(195, 60, 30);
  ellipse(0, 205, 20, 20);
  //B&W
  stroke(0);
  strokeWeight(1);
  fill(255);
  ellipse(4, 290, 80, 80);

  stroke(0);
  strokeWeight(1);
  fill(0);
  ellipse(4, 290, 53, 53);

  stroke(0);
  strokeWeight(1);
  fill(195, 60, 30);
  ellipse(4, 290, 45, 45);

  stroke(255);
  strokeWeight(1);
  fill(255);
  ellipse(4, 290, 38, 38);

  //left side rect
  stroke(0);
  fill(0);
  quad(19.5, 330, 30, 338, 0, 372, 0, 350);
  stroke(0);
  fill(225);
  quad(6.6, 347, 13, 352, 3.8, 364, -4, 358);

  //left side lines
  strokeWeight(1);
  fill(0);
  triangle(216, 246, 9.5, 112, 9, 115);
  triangle(216, 246, 14.8, 164, 16.6, 162.5);

  //middle up objects
  //triangle
  noStroke();
  fill(255, 200, 60);
  triangle(160, 100, 130, 145, 183, 145);
  //circle
  stroke(0);
  strokeWeight(1);
  fill(185, 185, 160);
  ellipse(200, 157.5, 37, 37);

  stroke(255);
  strokeWeight(1);
  fill(80, 100, 140);
  ellipse(200, 157.5, 28, 28);

  stroke(0);
  strokeWeight(2);
  line(234, -2, 235, 192);

  stroke(0);
  strokeWeight(2);
  line(240, -2, 240, 192);

  stroke(0);
  strokeWeight(1);
  line(212.6, 71, 256, 70);

  stroke(0);
  strokeWeight(1);
  line(217.4, 73, 256, 72);

  stroke(0);
  strokeWeight(1);
  line(220, 176, 255, 175);

  stroke(0);
  strokeWeight(1);
  line(220, 179, 256, 178);

  stroke(0);
  strokeWeight(1);
  noFill();
  line(220, 182, 255, 181);
  arc(242.5, 103, 34, 34, PI/4, 7*PI/4);

  //lines in big triangle
  noStroke();
  fill(135, 160, 115);
  triangle(0, 441.5, 118.5, 280.5, 127.5, 285.5);
  triangle(118.5, 280.5, 111, 289.5, 303, 392);

  stroke(0);
  strokeWeight(1);
  line(28.5, 347, 153, 285);

  stroke(0);
  strokeWeight(1.5);
  line(30, 349, 154.5, 289);

  fill(195, 60, 30);
  noStroke();
  quad(17, 377, 19, 380, 220, 273, 218, 270.5);

  stroke(0);
  strokeWeight(1.5);
  line(19, 380, 215, 274);

  noStroke();
  fill(0);
  triangle(0, 441.5, 118.5, 280.5, 123, 283);
  triangle(118.5, 280, 113.5, 286, 303, 392);

  //arcs
  stroke(195, 60, 30);
  strokeWeight(4);
  noFill();
  arc(122, 404.5, 70, 70, 3*PI/4, 7*PI/4);
  stroke(0);
  strokeWeight(1);
  noFill();
  arc(122, 404.5, 66, 66, 3*PI/4, 7*PI/4);

  stroke(195, 60, 30);
  strokeWeight(7);
  noFill();
  arc(170.5, 359.5, 55, 55, 3*PI/4, 7*PI/4);
  stroke(0);
  strokeWeight(2.5);
  noFill();
  arc(170.5, 359.5, 50, 50, 3*PI/4, 7*PI/4);

  stroke(195, 60, 30);
  strokeWeight(4);
  noFill();
  arc(210.5, 323.5, 45, 45, 3*PI/4, 7*PI/4);

  stroke(195, 60, 30);
  strokeWeight(4);
  noFill();
  arc(243, 298.5, 30, 30, 3*PI/4, 7*PI/4);
  stroke(0);
  strokeWeight(1);
  noFill();
  arc(243, 298.5, 26, 26, 3*PI/4, 7*PI/4);

  //***
  noStroke();
  fill(238, 228, 207);
  quad(92.7, 430, 101, 444, 209, 359, 201, 332);
  noStroke();
  fill(240, 220, 180);
  quad(209, 359, 201, 330, 261, 282, 273, 310);

  noStroke();
  fill(135, 160, 115);
  triangle(192, 333, 201, 333, 303, 392);
  //yellow & black line
  noStroke();
  fill(230, 215, 22);
  quad(156, 378, 253, 304, 258, 310, 160, 383);
  noStroke();
  fill(0);
  quad(156, 378, 253, 304, 255, 306, 157, 379);

  noStroke();
  fill(0);
  //triangle(118.5,280,113.5,286,303,392);
  triangle(196.5, 332, 202, 330, 303, 392);

  //pink rect
  noStroke();
  fill(205, 140, 150, 80);
  rect(241, 224, 69, 56.2);

  //lines near arcs
  stroke(0);
  strokeWeight(2);
  line(123, 366, 254, 254);

  stroke(0);
  strokeWeight(1);
  line(88, 421, 264, 257.5);

  //triangle edge
  stroke(0);
  strokeWeight(3);
  line(122, 60, 280, 600);

  //circles in triangle
  //green
  noStroke();
  fill(220, 220, 190);
  ellipse(120.5, 245, 41, 41);

  stroke(0);
  strokeWeight(1.5);
  fill(255, 255, 200);
  ellipse(120.5, 245, 32, 32);

  drawCircles();

   drawArrow();
  //left
  noStroke();
  fill(200, 200, 170);
  arc(210, 426.5, 166, 166, 197*PI/180, 207*PI/180);
  noStroke();
  fill(238, 228, 207);
  arc(210, 426.5, 124, 124, 197*PI/180, 207*PI/180);
  noStroke();
  fill(195, 60, 30);
  arc(210, 426.5, 114, 114, 197*PI/180, 207*PI/180);
  noStroke();
  fill(238, 228, 207);
  arc(210, 426.5, 102, 102, 197*PI/180, 207*PI/180);
  noStroke();
  fill(0);
  arc(210, 426.5, 100, 100, 197*PI/180, 207*PI/180);
  noStroke();
  fill(238, 228, 207);
  arc(210, 426.5, 98, 98, 197*PI/180, 207*PI/180);
  noStroke();
  fill(0);
  arc(210, 426.5, 96, 96, 197*PI/180, 207*PI/180);
  noStroke();
  fill(238, 228, 207);
  arc(210, 426.5, 94, 94, 197*PI/180, 207*PI/180);
  noStroke();
  fill(0);
  arc(210, 426.5, 92, 92, 197*PI/180, 207*PI/180);
  noStroke();
  fill(238, 228, 207);
  arc(210, 426.5, 90, 90, 197*PI/180, 207*PI/180);
  noStroke();
  fill(195, 60, 30);
  arc(210, 426.5, 81, 81, 197*PI/180, 207*PI/180);

  //right upper
  noStroke();
  fill(0);
  arc(210, 426.5, 214, 214, 307.55*PI/180, 311.45*PI/180);
  stroke(240, 220, 180);
  fill(240, 220, 180);
  arc(210, 426.5, 146.6, 146.6, 307*PI/180, 312*PI/180);
  noStroke();
  fill(195, 60, 30);
  arc(210, 426.5, 132, 132, 307*PI/180, 312*PI/180);
  noStroke();
  fill(238, 228, 207);
  arc(210, 426.5, 88, 88, 307*PI/180, 312*PI/180);
  noStroke();
  fill(195, 60, 30);
  arc(210, 426.5, 60, 60, 307*PI/180, 312*PI/180);
  //right below
  noStroke();
  fill(230, 215, 100);
  arc(210, 426.5, 328, 328, 45*PI/180, 51*PI/180);
  noStroke();
  fill(0);
  arc(210, 426.5, 144, 144, 45*PI/180, 51*PI/180);
  noStroke();
  fill(255);
  arc(210, 426.5, 140, 140, 45*PI/180, 51*PI/180);
  noStroke();
  fill(0);
  arc(210, 426.5, 130, 130, 45*PI/180, 51*PI/180);
  noStroke();
  fill(255);
  arc(210, 426.5, 120, 120, 45*PI/180, 51*PI/180);
  noStroke();
  fill(0);
  arc(210, 426.5, 110, 110, 45*PI/180, 51*PI/180);
  noStroke();
  fill(255);
  arc(210, 426.5, 104, 104, 45*PI/180, 51*PI/180);
  noStroke();
  fill(195, 60, 30);
  arc(210, 426.5, 60, 60, 45*PI/180, 51*PI/180);

  stroke(0);
  strokeWeight(1.5);
  noFill();
  ellipse(203.5, 427, 68, 68);

  noStroke();
  fill(238, 228, 207);
  ellipse(210, 426.5, 24, 24);
  fill(0);
  ellipse(210, 426.5, 11, 11);

  //longest line
  stroke(0);
  strokeWeight(1);
  fill(170, 170, 110);
  quad(111, 600, 127, 600, 190, 551, 179, 548);

  stroke(0);
  strokeWeight(1);
  fill(0);
  quad(190, 551, 179, 548, 216, 520, 220, 527);

  stroke(0);
  strokeWeight(1);
  fill(195, 60, 30);
  quad(220, 527, 216, 520, 333, 429.5, 339, 436);

  stroke(0);
  strokeWeight(1);
  fill(0);
  quad(333, 429.5, 339, 436, 541, 283, 534, 275);

  //bottom lines
  strokeWeight(5);
  line(220, 500, 320, 603);

  strokeWeight(1);
  line(166, 570, 140, 601);

  strokeWeight(1.5);
  line(183.5, 557, 145, 600.5);

  strokeWeight(1);
  line(203, 540, 150, 601);
}


