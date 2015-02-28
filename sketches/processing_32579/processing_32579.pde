

background(241, 208, 63);
size(255,198);

beginShape();//black portions at top right corner
fill(0,0,0);
vertex(210,0);
vertex(210,25);
vertex(255,20);
vertex(255,0);
endShape();


//red part not tail
beginShape();
fill(183, 0, 14);
vertex(150,29);
vertex(110,20);
vertex(115,0);
vertex(145,5);
endShape();


//orange rooster 
noStroke();
beginShape();
fill(235,140,46);
vertex(210,0);
vertex(210,25);
vertex(150,29);
vertex(103,19);
vertex(100,0);
endShape();

noStroke();
beginShape();
fill(235, 140, 46);
vertex(210,25);
vertex(255,140);
vertex(255,20);
endShape();

beginShape();
fill(235, 140, 46);
vertex(255,80);
vertex(195,123);
vertex(195,140);
vertex(220,140);
vertex(255,198);
endShape();

//red part not foot
beginShape();
fill(183, 0, 14);
vertex(160,29);
vertex(120,25);
vertex(105,20);
vertex(120,0);
vertex(160,20);

endShape();


noStroke();//green part of rooster
beginShape();
fill(30, 99, 42);
vertex(220,140);
vertex(210,159);
vertex(210,198);
vertex(255,198);
vertex(255,158);
endShape();


beginShape();//red upper clubfoot
fill(183, 0, 14);
vertex(95,140);
vertex(100,140);
vertex(200,145);
vertex(195,123);
endShape();

beginShape();//black toe
fill(0);
vertex(97,140);
vertex(98,141);
vertex(58,158);
endShape();


beginShape();//black clubfoot
fill(0);
vertex(200,140);
vertex(220,140);
vertex(203,163);
vertex(190,150);
endShape();

beginShape();//red lower claw
fill(183, 0, 14);
vertex(190,150);
vertex(203,163);
vertex(80,170);
endShape();



