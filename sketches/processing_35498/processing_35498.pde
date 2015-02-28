
//background
size(500, 500);
background (60, 60, 60);
smooth();

//outline
stroke (0, 0, 0);
strokeWeight( 17);
ellipse (250, 250, 350, 400);

//neck
fill (197, 234, 159);
stroke (0, 0, 0);
strokeWeight (4);
rect (150, 400, 200, 120);

//ears
fill (197, 234, 159);
ellipse (75, 250, 100, 200);

fill (197, 234, 159);
ellipse (425, 250, 100, 200);

//face
fill (80, 80 ,80);
stroke (197, 234, 159);
strokeWeight( 10);
ellipse (250, 250, 350, 400);

fill (80, 80 , 80);
stroke (250, 143, 3);
strokeWeight( 10);
ellipse (250, 250, 300, 350);

fill (80, 80, 80);
stroke (250, 3, 3);
strokeWeight( 10);
ellipse (250, 250, 250, 300);

//eyebrows
noFill();
  stroke(0);
  strokeWeight (5);
  beginShape();
  curveVertex(160, 200); // the first control point
  curveVertex(160, 200); // is also the start point of curve
  curveVertex(175, 185);
  curveVertex(200, 200);
  curveVertex(225, 185);
  curveVertex(250, 200);
  curveVertex(275, 185);
  curveVertex(300, 200);
  curveVertex(325, 185);
  curveVertex(340, 200);
  curveVertex(340, 200);
  endShape();
  

//eyes
fill (255, 255, 255);
stroke (0, 0, 0);
strokeWeight (5);
ellipse (300, 250, 25, 25);

fill (255, 255, 255);
stroke (0, 0, 0);
strokeWeight (5);
ellipse (200, 250, 25, 25);

//eyeballs
fill (0, 0, 0);
ellipse (200, 250, 10, 10);

fill (0, 0, 0);
ellipse (300, 250, 10, 10);

//eyelid
fill (0, 0, 0);
 stroke(0); 
  arc(200, 250, 50, 50, -PI, 0); 
  
 stroke(0); 
  arc(300, 250, 50, 50, -PI, 0); 
  
//nose
fill (117, 3, 250);
stroke (0, 0, 0);
rect (225, 225, 50, 100);

fill (0, 0, 0);
ellipse (225, 320, 15, 15);

fill (0, 0, 0);
ellipse (275, 320, 15, 15);

//mouth
fill (0, 0, 0);
stroke (250, 0, 0);
ellipse (250, 370, 30 ,30);

//earhole
stroke (0, 0, 0);
strokeWeight (3);
ellipse (70, 338, 10, 10);

//earring
fill (198, 0, 229);
stroke (255, 255, 0, 150);
triangle (70, 345, 60, 395, 80, 395);

//mustache
fill (0, 0, 0);
 stroke(0); 
  arc(250, 365, 200, 75, -PI, 0); 
                                                
