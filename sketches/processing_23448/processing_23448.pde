
size(100,100);

//body
noFill();
smooth();
beginShape();
arc(59,43,15,15, TWO_PI-PI/2, TWO_PI);
arc(41.5,43,15,15, PI, TWO_PI-PI/2);
line(66.5,43,66.5,66);
line(34,43,34,66);
line(40.5,73,60,73);
arc(60,66,13,13, 0, PI/2);
arc(40.5,66,13,13, PI/2, PI);
endShape(CLOSE);

//head
ellipse(50,20,30,35);

//eyes
ellipse(43,17,5,12);
ellipse(57,17,5,12);

//pupils
strokeWeight(2);
ellipse(42.5,20.5,2,2);
ellipse(56.5,20.5,2,2);

//mouth
strokeWeight(1.5);
strokeCap(ROUND);
noFill();
arc(51.5, 27.5, 9, 9, 0, PI/2);

//antennas
strokeWeight(1.5);
line(36,10,23,0);
line(63,10,73,0);
strokeWeight(5);
point(73,0);
point(23,0);

//arms
strokeWeight(1);
ellipse(69,43,5,5);
ellipse(32,43,5,5);
strokeWeight(1.5);
line(69.3,44.5,69.3,63);
line(31.7,44.5,31.7,60);
line(31.7,60,29,64);
ellipse(29,64,2,2);
ellipse(69.3,63,2,2);

//legs
//strokeCap(ROUND);
strokeWeight(5);
line(42,74,58,74);
strokeWeight(3);
line(44,82,56,82);
strokeWeight(1);
line(46,89,54,89);


//buttons
strokeJoin(BEVEL);
strokeWeight(2);
ellipse(40,43,2,6);
ellipse(45,43,2,6);
ellipse(50,43,2,6);
rect(55,40.5,5,5);


