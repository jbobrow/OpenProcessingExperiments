
size (500, 500);
background (211, 238, 101);
smooth();
noStroke();

// ears
fill(70, 70, 70);
ellipse(160, 170, 100, 100);
ellipse(340, 170, 100, 100);

fill(255,255,255);
beginShape();
curveVertex(250, 160);
curveVertex(250, 150);
curveVertex(310, 155); // blah can't get the top of the head to curve right
curveVertex(350, 200);
curveVertex(350, 350);
curveVertex(250, 400);
curveVertex(150, 350);
curveVertex(150, 200);
curveVertex(190, 155); //
curveVertex(250, 150);
curveVertex(250, 150);
endShape();

//eyes, nose
fill(70, 70, 70);
ellipse(197, 280, 50, 60);
ellipse(303, 280, 50, 60);
ellipse(250, 320, 40, 20);

fill(248, 245, 186);
ellipse(197, 293, 15, 15);
ellipse(303, 293, 15, 15);
