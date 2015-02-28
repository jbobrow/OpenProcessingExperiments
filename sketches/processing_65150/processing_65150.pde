
/******************************************
*  Processing Self Portrait
*  class 1
*  Stephanie Mongon 070512
******************************************/

void setup(){
  size(500,500);
  smooth(); 
}

void draw(){
  background(#d5b401);
  
  //NECK
  fill(#fff6d7); //purple
  stroke(0);
  strokeWeight(5);
  quad(116, 350, 140, 510, 365, 510, 370, 350);
  
  //FACE
  noStroke();
  ellipse(170, 100, 200, 300);
  ellipse(310, 100, 200, 300);
  ellipse(105, 200, 100, 150);
  ellipse(375, 185, 100, 200);
  ellipse(115, 275, 100, 200);
  ellipse(365, 280, 100, 200);
  ellipse(255, 300, 300, 275);
  ellipse(215, 290, 300, 275);

  //EYEBALL Right
  //white
  fill(#ffffff);
  noStroke();
  ellipse(330, 115, 70, 35);
  //iris
  fill(#2c4542);
  ellipse(331, 117, 38, 43);
  //pupil
  fill(0);
  ellipse(331, 117, 18, 18); 
  //pupil cover - lower
  noFill();
  strokeWeight(10);
  stroke(#fff6d7);
  curve(300, 135,  365, 127,  309, 135,  10, 60);
  //lower line
  stroke(0);
  strokeWeight(1);
  curve(300, 125,  365, 117,  304, 128,  10, 20);
  //pupil cover - upper
  strokeWeight(10);
  stroke(#fff6d7);
  curve(230, 215,  285, 115,  370, 115,  395, 300);
  //upper line
  noFill();
  stroke(0);
  strokeWeight(4);
  curve(230, 220,  285, 120,  370, 120,  395, 300);
  //corner
  strokeWeight(1);
  curve(320, 100,  285, 120,  304, 128,  350, 120);
  //under line
  strokeWeight(2);
  curve(285, 110,  305, 136,  365, 140,  385, 90);
  //over line
  curve(230, 300,  290, 107,  385, 115,  395, 300);
  //lashes
  strokeWeight(5);
  curve(230, 180,  317, 105,  373, 118,  395, 220);
  fill(0);
  noStroke();
  triangle(370, 123, 382, 117, 370, 117);
  triangle(370, 120, 381, 112, 370, 112);
  triangle(367, 117, 377, 107, 366, 107);
  
  //EYEBALL Left
  //white
  fill(#ffffff);
  noStroke();
  ellipse(145, 120, 67, 40);
  //iris
  fill(#2c4542);
  ellipse(148, 117, 38, 38);
  //pupil
  fill(0);
  ellipse(148, 117, 18, 18); 
  //pupil cover - upper
  noFill();
  strokeWeight(10);
  stroke(#fff6d7);
  curve(95, 315,  106, 118,  187, 116,  235, 225);
  //upper line
  stroke(0);
  strokeWeight(4);
  curve(95, 320,  106, 123,  187, 121,  235, 230);
  //pupil cover - lower
  strokeWeight(10);
  stroke(#fff6d7);
  curve(80, 55,  106, 128,  168, 135,  180, 105);
  //lower line
  stroke(0);
  strokeWeight(1);
  curve(80, 50,  106, 123,  163, 130,  180, 100);
   //corner
  curve(160, 130,  163, 130,  187, 121,  205, 50);
  //under line
  strokeWeight(2);
  curve(80, 120,  115, 142,  160, 140,  192, 123);
  //over line
  curve(90, 360,  90, 122,  185, 110,  200, 300);
  //lashes
  strokeWeight(5);
  curve(95, 240,  103, 121,  157, 105,  232, 180);
  triangle(105, 121, 101,121, 105, 118);
  triangle(105, 119, 101, 117, 105, 116);
  triangle(105, 116, 103, 112, 107, 112);
  
  //NOSE
  noFill();
  strokeWeight(1);
  curve(240, 36,  220, 80, 207, 165,  211, 178);
  //curve(260, 200,  207, 165,  215, 215,  400, 200);
  //lower right
  line(265, 180, 268, 198);
  curve(100, 100,  268, 198,  267, 252,  200, 215);
  curve(293, 253,  267, 252,  256, 245,  237, 226);
  //nostril right
  fill(0);
  noStroke();
  ellipse(257, 228, 16, 20);
  //cover
  stroke(#fff6d7);
  strokeWeight(10);
  curve(235, 290,  234, 244,  262, 220,  302, 245);
  noFill();
  stroke(0);
  strokeWeight(1);
  curve(235, 300,  238, 249,  262, 225,  300, 250);
  curve(230, 200,  262, 225,  262, 240,  270, 204);
  //nostril left
  fill(0);
  noStroke();
  ellipse(200, 232, 19, 15);
  //cover
  stroke(#fff6d7);
  strokeWeight(10);
  curve(140, 205,  198, 220,  215, 245,  240, 255);
  //nostril
  noFill();
  stroke(0);
  strokeWeight(1);
  curve(220, 270,  192, 240,  195, 225,  210, 250);
  curve(140, 210,  195, 225,  215, 250,  240, 260);
  curve(250, 250,  182, 246,  189, 202,  300, 120);
  //round
  curve(200, 300,  189, 202,  207, 165,  230, 150);
  
  //LIPS
  //color 
  //mole!
  noStroke();
  fill(#7d4241);
  ellipse(170, 305, 15, 20);
  
  stroke(#df9688);
  strokeWeight(10);
  curve(123, 360,  175, 332,  205, 310,  208, 345);
  curve(200, 305,  205, 310,  222, 315,  230, 325);
  curve(220, 325,  222, 315,  245, 305,  230, 315);
  curve(235, 325,  245, 305,  278, 329,  270, 365);
  curve(160, 295,  177, 330,  227, 340,  300, 275);
  curve(145, 285,  227, 340,  280, 330,  320, 310);
  noStroke();
  fill(#df9688);
  ellipse(215,328, 60,30);
  ellipse(250,325, 60,30);
  
  //middle line
  noFill();
  stroke(0);
  strokeWeight(3);
  curve(123, 275,  157, 328,  213, 322,  208, 340);
  curve(223, 340,  213, 322,  226, 327,  301, 340);
  curve(201, 330,  226, 327,  240, 319,  253, 300);
  curve(230, 320,  240, 319,  307, 320,  325, 180);
  //top line
  strokeWeight(2);
  curve(123, 300,  165, 330,  205, 305,  208, 340);
  curve(200, 310,  205, 305,  222, 310,  230, 320);
  curve(220, 320,  222, 310,  245, 300,  230, 310);
  curve(235, 320,  245, 300,  285, 330,  270, 360);
  //bottom line
  curve(160, 300,  165, 330,  227, 345,  300, 280);
  curve(145, 290,  227, 345,  290, 330,  320, 315);
  //under lip
  strokeWeight(1);
  curve(165, 560,  190, 390,  270, 385,  300, 505);
  
  //EYEBROWS
  //left
  stroke(#c48b02);
  strokeWeight(10);
   curve(10,300,  70, 70,  150,45,  160,85);
   curve(5,300,  70, 70,  147,54,  160,85);
   //right
   curve(110, 150,  310, 35,  405, 65,  415,300);
   curve(380, 105,  402, 55,  320, 50,  100,295);  
   
   noStroke();
   fill(#c48b02);
   triangle(150,40,  170, 50, 147, 60);
   triangle(305, 33,  320, 55,  293,50);
   triangle(305, 33,  320, 55,  350,30);
   
  
  //FACE OUTLINE
  //Left Half
  //curve(bezierPointX, bezierPointY, startingPointX, startingPointY, endingPointX, endingPointY, bezierPointX2, bezierPointY2
  //beginShape();
  stroke(0);
  strokeWeight(5);
  noFill();
  curve(225, -55,  100, 0,  71, 105,  170, 180);
  curve(0, 0,  71, 105,  55, 195,  75, 286);
  curve(75, 286,  55, 195,  65, 250,  85, 265);
  curve(85, 265,  65, 250,  88, 365,  210, 500);
  curve(210, 430, 88, 365,  182, 434,  250, 430);
  curve(250, 450,  182, 434,  241, 445,  400, 450);
  //Right Half
  curve(82, 450,  241, 445,  300, 434,  232, 450);
  curve(232, 450,  300, 434,  394, 365,  272, 430);
  curve(272,430,  394,365,  417, 250,  397, 265);
  curve(397, 265,  417, 250,  427, 195,  407, 286);
  curve(407, 286,  427, 195,  411, 105,  411, 105);
  curve(411, 105,  411, 105,  382, 0,  257, -55);
 // endShape();
 
  /*
  HOW DO YOU MAKE A CURVED POLYGON?
  
  stroke(#FFCC00);
  beginShape();
  curveVertex(100,  0);
  curveVertex(76,  64);
  curveVertex(74,  115);
  curveVertex(60,  205);
  curveVertex(73, 274);
  curveVertex(86, 359);
  endShape();
  */
  /*
  stroke(#FFCC00);
  beginShape();
  curveVertex(100,0);
  curveVertex(71,105);
  curveVertex(55,195);
  curveVertex(60,250);
  curveVertex(73,274);
  curveVertex(86,359);
  endShape();
  */
}

