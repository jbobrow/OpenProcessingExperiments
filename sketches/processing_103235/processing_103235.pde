
size(200,300);
rectMode(CENTER);
ellipseMode(CENTER);

//arms
strokeWeight(3);
line(50,140,150,140);

//legs
line(90,150,80,230);
line(110,150,120,230);

//body
strokeWeight(1);
fill(250,5,5);
ellipse(100,150,50,100);

//head
fill(250,5,5);
ellipse(100,100,80,70);

//eyes
fill(0);
ellipse(80,90,10,10);
ellipse(120,90,10,10);

//nose
fill(200,15,15);
triangle(100,100,110,120,90,120);

//mouth
strokeWeight(3);
line(90,130,110,130);
