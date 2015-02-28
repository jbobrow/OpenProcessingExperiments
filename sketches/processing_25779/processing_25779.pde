
size(400,400);
smooth();
noStroke();

fill(0,0,0);
//body
rect(150,90,100,220);
triangle(150,310,80,320,150,240);
triangle(250,310,320,320,250,240);
//triangle(200,310,120,335,150,310);
//triangle(200,310,280,335,250,310);

fill(205,205,205);
ellipse(80,170,160,300);
ellipse(320,170,160,300);
//shoulders
fill(0,0,0);
rect(160,57,45,33);
fill(205,205,205);
ellipse(160,57,90,70);

fill(0,0,0);
rect(195,57,45,33);
fill(205,205,205);
ellipse(240,57,90,70);

//head
fill(0,0,0);
rect(185,57,30,90);
ellipse(200,72,30,37);
fill(0,0,0);
triangle(185,35,192,57,185,57);
triangle(215,35,208,57,215,57);
fill(230,170,133);
//make smaller - face
triangle(189,70,190,90,200,92);
triangle(211,70,210,90,200,92);
triangle(188,71,200,76,200,93);
triangle(212,71,200,76,200,93);
//eyes
fill(255,255,255);
triangle(189,66,196,70,197,68);
triangle(211,66,204,70,203,68);
//mouth
stroke(0,0,0,180);
strokeWeight(.5);
line(198,80,202,80);

//building
noStroke();
fill(45,45,45);
triangle(200,300,0,330,400,330);
rect(0,330,400,300);
fill(0,0,0);
triangle(80,318,140,308,86,360);
triangle(320,318,260,308,314,360);
triangle(190,300,160,380,140,307);
triangle(210,300,240,380,260,307);
stroke(0,0,0);
strokeWeight(2);
line(200,300,200,400);
//triangle(200,310,120,335,150,310);
//triangle(200,310,280,335,250,310);



