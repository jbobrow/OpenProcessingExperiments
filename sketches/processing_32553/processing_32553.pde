

size(81,122);
background(0,0,0);
smooth();

//the black one
beginShape();
stroke(0);
fill(0,0,0);
curveVertex(0,0);
curveVertex(0,0);
curveVertex(5,21);
curveVertex(0,35);
curveVertex(0,35);
endShape();

// the yellow one
beginShape();
stroke(2);
fill(234,222,161);
curveVertex(0,0);
curveVertex(0,0);
curveVertex(5,21);
curveVertex(0,35);
curveVertex(0,39);
curveVertex(17,20);
curveVertex(17,0);
curveVertex(19,0);
endShape();

//the small white one
beginShape();
fill(255,255,255);
curveVertex(17,0);
curveVertex(17,0);
curveVertex(17,20);
curveVertex(15,18);
curveVertex(25,17);
curveVertex(35,12);
curveVertex(33,0);
curveVertex(33,0);
endShape();

/*stroke(255,255,255);
line(17,20,51,20);
strokeWeight(0);
*/
/*stroke(0,0,0);
line(51,20,81,20);
strokeWeight(50);
*/

//the big white one
beginShape();
fill(255,255,255);
curveVertex(0,0);
curveVertex(0,45);
curveVertex(0,17);
curveVertex(0,100);
curveVertex(50,122);
curveVertex(30,80);
curveVertex(15,25);
curveVertex(0,0);
endShape();

//the light green one
beginShape();
fill(33,173,128);
curveVertex(0,0);
curveVertex(0,100);
curveVertex(35,122);
curveVertex(0,122);
curveVertex(0,0);
endShape();

//the drak green one
beginShape();
fill(40,54,31);
curveVertex(0,0);
curveVertex(68,0);
curveVertex(30,60);
curveVertex(81,35);
curveVertex(81,0);
curveVertex(81,0);
curveVertex(68,0);
endShape();

//the blue one
beginShape();
fill(1,110,177);
curveVertex(0,0);
curveVertex(81,35);
curveVertex(40,65);
curveVertex(81,65);
curveVertex(81,65);
endShape();

fill(112,118,116);
ellipse(40,80,10,10);
fill(112,118,116);
ellipse(60,82,10,10);

