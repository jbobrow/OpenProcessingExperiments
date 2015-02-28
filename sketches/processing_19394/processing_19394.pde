
size(250,250);
smooth();
background(255);

ellipseMode(CENTER);
noFill();

//bottom circles
ellipse(220,220,-40,-40);
ellipse(215,215,-30,-30);
ellipse(210,210,-20,-20);
ellipse(205,205,-10,-10);
ellipse(200,200,0,0);
ellipse(195,195,10,10);
ellipse(190,190,20,20);
ellipse(185,185,30,30);
ellipse(180,180,40,40);
//lines
stroke(200);
line(0,250,250,0);
line(1,240,240,1);
line(-1,260,260,-1);

//circles in the middle
noStroke();
fill(40,40,104,200);
ellipse(125,125,90,90);
fill(30,40,150,200);
ellipse(125,125,80,80);
fill(130,30,50,200);
ellipse(125,125,60,60);
//top circles
stroke(0);
noFill();
ellipse(25,25,-40,-40);
ellipse(30,30,-30,-30);
ellipse(35,35,-20,-20);
ellipse(40,40,-10,-10);
ellipse(45,45,0,0);
ellipse(50,50,10,10);
ellipse(55,55,20,20);
ellipse(60,60,30,30);
ellipse(65,65,40,40);
