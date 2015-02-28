
size(300,300);
background(#FA3030);
translate(150,150);
 
rectMode(CENTER);
noStroke();

//ears
fill(0);
ellipse(-90,-65,60,60);
ellipse(90,-65,60,60);

//head
fill(255);
ellipse(0,0,220,190);

//eyes
fill(0);
ellipse(-60,0,80,80);
ellipse(60,0,80,80);
ellipse(-60,0,50,40);
ellipse(60,0,50,40);
fill(#0DA026);
ellipse(60,0,25,25);
fill(#0DA026);
ellipse(-60,0,25,25);
fill(0);
ellipse(-60,0,20,20);
fill(0);
ellipse(60,0,20,20);
fill(255);
ellipse(60,-2,5,5);
ellipse(-60,-2,5,5);

//nose
fill(0);
ellipse(1,30,40,20);
fill(255);
ellipse(4,29,4,2);

//mouth
strokeWeight(2);
stroke(0);
line(0,20,0,65);
noFill();
arc(-20,60,40,40,0,PI);
arc(20,60,40,40,0,PI);












