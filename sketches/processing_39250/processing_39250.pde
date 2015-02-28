
size(200,200);
background(127);
smooth();

//set modes to center
ellipseMode(CENTER);

//draw arms
ellipse(90,100,35,40);
ellipse(110,100,35,40);

//draw feet
ellipse(90,130,20,10);
ellipse(110,130,20,10);

//draw body
ellipse(100,100,35,70);

//draw ears
ellipse(67,50,12,12);
ellipse(133,50,12,12);

//draw antenna
line(100,43,110,22);
line(110,22,125,27);
ellipse(125,27,9,9);

//draw head
ellipse(100,60,75,45);

//draw mouth
curve(80,58,90,73,110,73,120,58);

//draw eyes
noStroke();
fill(255,0,0);
ellipse(88,57,10,10);
ellipse(112,57,10,10);



