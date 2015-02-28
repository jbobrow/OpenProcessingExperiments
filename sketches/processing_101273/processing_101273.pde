
//Bloo

size (700,400);
//body
fill(84,144,245);
noStroke();
rect (150, 200, 150,250);
fill(84,144,245);
arc(225, 200, 150, 170, PI, TWO_PI);

//arm
rect(270,210,60,45);
ellipse(330,233,60,45);
arc(410,210,60,45,PI+HALF_PI,HALF_PI);

//mouth
fill(1,1,1);
beginShape();
curveVertex(220,190);
curveVertex(210,210);
curveVertex(270,210);
curveVertex(250,200);
endShape();


//right eye
strokeWeight(3);
strokeJoin(ROUND);
fill(255,255,255);
stroke(1);
ellipse(250,175,40,40);

fill(1,1,1);
ellipse(260,175,10,13);

//eye left
//fill(1,1,1);
//ellipse(195,175,42,42);
fill(255,255,255);
strokeWeight(3);
ellipse(195,175,40,40);

fill(1,1,1);
ellipse(240,175,10,13);

//old
//left eye old
/*fill(255,255,255);
strokeWeight(3);
arc(195, 175, 42, 42,PI+QUARTER_PI, CHORD);
*/
//arc(195, 175, 40, 40, .47,3.77);
