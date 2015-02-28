
size(200,200);
background(255);

//ear
fill(0);
noStroke();
triangle(75,50,75,10,90,65);
triangle(125,50,110,65,125,10);

//body
fill(255,0,0);
stroke(0);
rectMode(CENTER);
rect(100,100,20,80);
fill(255,255,0);
noStroke();
rectMode(CENTER);
rect(100,100,15,40);

//head
fill(255,0,0);
stroke(0);
ellipseMode(CENTER);
ellipse(100,50,80,50);

//eye
fill(255,255,0);
stroke(255);
triangle(75,35,78,65,90,65);
triangle(125,35,110,65,123,65);

//mouth
stroke(255);
line(95,70,105,70);

//foot
stroke(0);
line(90,140,80,170);
stroke(0);
line(110,140,120,170);

//king mark
stroke(255);
line(95,40,105,40);
line(95,42,105,42);
line(95,44,105,44);
line(100,40,100,44);



