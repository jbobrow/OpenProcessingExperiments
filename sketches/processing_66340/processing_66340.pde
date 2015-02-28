
void setup() {
  size(400, 400);
  background(255, 226, 197);
  smooth();
  
  //background
  //fill(color, color, color, alpha)
  //ellipse(x, y, width, height)
  noStroke();
  fill(250, 117, 70);
  ellipse(400, 277, 200, 50);
  fill(240, 127, 82, 75);
  ellipse(390, 275, 122, 82);
  fill(230, 137, 72, 50);
  ellipse(189, 171, 95, 133);
  fill(220, 137, 72, 50);
  ellipse(200, 35, 95, 131);
  fill(210, 147, 81, 40);
  ellipse(285, 140, 340, 120);
  fill(250, 117, 72);
  ellipse(290, 20, 380, 150);



  //black circle
  fill(0);
  ellipse(209, 25, 15, 15);
  ellipse(155, 9, 25, 25);
  
  //black little  bottom circle 
  ellipse(301, 375, 20, 20);
  //bottom left line
stroke(0);
line(310, 380, 340, 404); //center

  ellipse(151, 400, 25, 25);
  ellipse(340, 405, 20, 20);
  
  //ball & chain
  stroke(0);
  line(209, 25, 155, 9);
 
  //
  ellipse(350, 124, 20, 20);
  ellipse(380, 135, 19, 19);
  
   //ball & chain
  stroke(0);
  line(350, 124, 380, 135);
  //
  
 //arc(x, y, width, height, start, stop)
 //color circle
  fill(244, 98, 80);
  stroke(0);
  
  ellipse(350, 310, 24, 22); //1st right
  //red half
    fill(0);
    arc(350, 310, 24, 22, -0.76, 2.3);
    
  ellipse(320, 330, 16, 14); //2nd right
  //red half
  fill(244, 98, 80);
    arc(320, 330, 16, 14, -0.76, 2.3);
    
  ellipse(100, 330, 14, 10); //center left
  //red half
  fill(244, 98, 80);
    arc(100, 330, 14, 10, -0.76, 2.3);
  
  ellipse(75, 300, 22, 20);
  //red half
  fill(0);
    arc(75, 300, 22, 20, -0.76, 2.3);

 ellipse(58, 242, 15, 9);
   //red half
  fill(244, 98, 80);
    arc(58, 242, 15, 9, -0.76, 2.3);
  
  //swirl
  //bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2);
//    stroke(0);
//    noFill();
//    bezier(175, 150, 236, 49, 311, 217, 175, 200); //outside right
//    bezier(175, 150, 56, 159, 192, 279, 163, 262); //outside left
//    bezier(163, 262, 217, 250, 231, 228, 219, 200); //inside right
//    bezier(219, 200, 185, 165, 147, 199, 149, 252); //final inside curlycue

noFill();
stroke(0);
//big thing in middle
  beginShape();
  curveVertex(60, 165);
  curveVertex(60, 165);
  curveVertex(60, 238);
  curveVertex(70, 284);  
  curveVertex(140, 360);
  curveVertex(265, 345);
  curveVertex(330, 324);   
  curveVertex(385, 260);
  curveVertex(385, 240);
  curveVertex(365, 240);
  curveVertex(362, 220);
  curveVertex(350, 185);
  curveVertex(330, 200);
  curveVertex(310, 215);
  curveVertex(290, 210);
  curveVertex(285, 190);
  curveVertex(295, 160);
  curveVertex(285, 135);
  curveVertex(260, 158);
  curveVertex(230, 180);
  curveVertex(210, 160);
  curveVertex(230, 125);
  curveVertex(255, 85);
  curveVertex(235, 52);
  curveVertex(190, 90);
  curveVertex(150, 135);
  curveVertex(140, 140);
  curveVertex(120, 132);
  curveVertex(125, 95);
  curveVertex(125, 80);
  curveVertex(105, 80);
  curveVertex(80, 115);
  curveVertex(60, 165);
  curveVertex(60, 165);
  endShape();

//triangle(x1, y1, x2, y2, x3, y3);
  fill(120, 117, 179);
  triangle(0, 270, 60, 282, 0, 295);
  
  fill(0);
  triangle(400, 196, 372, 201, 400, 230);
  triangle(400, 47, 372, 72, 405, 80);
  
  triangle(400, 17, 356, 14, 399, 49);
  triangle(400, 230, 386, 244, 400, 252);
  
//line(x1, y1, x2, y2)
//stars
//bottom left
stroke(0);
line(0, 306, 42, 336); //center
line(10, 306, 33, 336); //cross center
line(23, 306, 18, 342); //cross center
line(0, 321, 42, 321);
//top left
//cut off
line(0, 23, 10, 16); //one arm
line(0, 41, 16, 41); //two arm
line(0, 67, 10, 68); //three arm
//bottom right
line(343, 346, 415, 284); 
line(355, 293, 399, 355); 
line(377, 284, 370, 346); 
line(355, 315, 399, 324); 

//curveVertex(x, y)
noFill();
beginShape();
curveVertex(80,  400);
curveVertex(80,  400);
curveVertex(121,  307);
curveVertex(160,  323);
curveVertex(131, 400);
curveVertex(131, 400);
endShape();

//bezierVertex(cx1, cy1, cx2, cy2, x, y) 
//beginShape();
//vertex(30, 20);
//bezierVertex(80, 0, 80, 75, 30, 75);
//bezierVertex(50, 80, 60, 25, 30, 20);
//endShape();



//black/red ball
stroke(0);
fill(0);
ellipse(86, 375, 15, 9);
   //red half
  fill(244, 98, 80);
    arc(86, 375, 15, 9, -0.76, 2.3);

//black half
//  fill(244, 98, 80);
//    arc(146, 292, 0, 0, -0.76, 2.3);

//black/red ball at bottom
stroke(0);
fill(0);
ellipse(240, 405, 75, 60);
   //red half
  fill(244, 98, 80);
    arc(240, 405, 75, 60, -0.76, 2.3);
    









}


