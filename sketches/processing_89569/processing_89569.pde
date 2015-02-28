
/*
Christal Rhea
January 30, 2013
PANDA CHAN

A simple panda face made out of shapes and lines, 
on an orange background.
*/

size(480,480);
noStroke(); //no outlines around shapes
smooth();
background(255,87,0); //background color: orange
fill(0);
ellipse(100,100,100,100); //left ear
fill(0);
ellipse(375,100,100,100); //right ear
fill(255);
ellipse(240,240,350,300); //Panda Head
fill(0);
ellipse(150,240,130,130); //left eye black
fill(0);
ellipse(330,240,130,130); //right eye black
fill(255);
ellipse(175,220,50,50); //left eye white
fill(255);
ellipse(305,220,50,50); //right eye white
fill(0);
ellipse(240,270,30,25); //nose
stroke(255,0,0); //mouth color: red
strokeWeight(7);
line(210,300,240,320); //mouth
line(270,300,240,320);
