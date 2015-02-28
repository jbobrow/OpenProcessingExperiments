
size (500, 500);
background (#D1C6CC);
smooth();

//BACKGROUND PATTERN
noStroke();
fill(#D8BECD);
rect (0, 0, 500, 10);
rect (0, 80, 500, 15);
rect (0, 160, 500, 20);
rect (0, 240, 500, 10);
rect (0, 320, 500, 15);
rect (0, 400, 500, 20);
rect (0, 480, 500, 10);

 
//FACE
fill (#3E6C93);
noStroke();
ellipse (250, 250, 350, 250);
//main face shape

//EARS
ellipse (70, 240, 60, 60);
ellipse (430, 240, 60, 60);


//EYES

fill(255, 255, 255);
ellipse (155, 209, 35, 45);
//left eye
ellipse (247, 212, 70, 45);
//middle eye
ellipse (338, 209, 32, 50);
//right eye

stroke(0);
strokeWeight(2);
fill (#E0D60E);
ellipse (157, 212, 20, 25);
//left eye color
ellipse (253, 217, 33, 27);
//middle eye color
ellipse (337, 214, 22, 28);
//right eye color

noStroke ();
fill(0, 0, 0);
ellipse (158, 214, 10, 10);
//left pupil highlight
ellipse (256, 220, 10, 10);
//middle pupil highlight
ellipse (337, 218, 10, 10);
//right pupil highlight

//NOSE
stroke (0,0,0);
strokeCap(BEVEL);
rect (235, 260, 35, 30);
noStroke();
ellipse (232, 285, 20, 15);
ellipse (268, 285, 20, 15);
//nose construction

fill(#3E6C93);
ellipse (231, 288, 5, 5);
ellipse (269, 288, 5, 5);
//nostrils


//EYEBROWS
  //noFill();
  stroke(0);
  strokeWeight(2);
  beginShape();
  curveVertex(135, 170);
  curveVertex(135, 170); 
  curveVertex(155, 180); 
  curveVertex(175, 170);
  curveVertex(195, 180);
  curveVertex(215, 170);
  curveVertex(235, 180); 
  curveVertex(255, 170); 
  curveVertex(275, 180);
  curveVertex(295, 170);
  curveVertex(315, 180);
  curveVertex(335, 170);
  curveVertex(355, 180);
  curveVertex(375, 170);
  curveVertex(375, 170);
  endShape();

    
  

//MOUTH
fill(0,0,0);
arc (250, 310, 250, 75, 0, PI);
//mouth
noStroke();

//TEETH
fill(255, 255, 255);
//upper teeth
triangle (360, 327, 345, 310, 375, 310);
//rght4
triangle (330, 327, 315, 310, 345, 310);
//rght3
triangle (300, 327, 285, 310, 315, 310);
//rght2
triangle (266, 327, 250, 310, 285, 310);
//rhgt1
triangle (232, 327, 215, 310, 250, 310);
//mid.
triangle (200, 327, 185, 310, 215, 310);
//left1
triangle (170, 327, 155, 310, 185, 310);
//left2
triangle (140, 327, 125, 310, 155, 310);
//left3


//lower teeth
triangle (340, 325, 325, 341, 355, 331);
//rght3
triangle (310, 330, 295, 345, 325, 340);
//rght2
triangle (280, 330, 265, 347, 295, 345);
//rhgt1
triangle (250, 330, 235, 347, 265, 347);
//mid
triangle (220, 330, 205, 345, 235, 347);
//left1
triangle (190, 330, 175, 341, 205, 345);
//left2
triangle (160, 325, 145, 331, 175, 340);
//left3





