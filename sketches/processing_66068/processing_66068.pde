
size(400,400);
smooth();
background(219,227,220);

//no-border rectangles
noStroke();
fill(250,218,125); //yellow
rect(240,0,135,148);
fill(229,72,41); //bottom red
rect(370,305,25,95);
fill(250,218,125); //bottom yellow
rect(0,305,45,99);


stroke(0);
strokeCap(SQUARE);

//top horizontal line
strokeWeight(10);
line(0,4,400,4);

//red rectangle
strokeWeight(7);
fill(229,72,41);
rect(40,50,200,205);
//blue rectangle
fill(56,37,173);
rect(240,305,130,70);
//black rectangle 1
fill(30,6,9);
rect(40,255,105,95);
//black rectangle 2
fill(30,6,9);
rect(145,350,95,25);

//vertical lines
line(90,15,90,50);
line(240,12,240,50);
line(370,15,370,390);
line(396,0,396,400);

line(305,150,305,255);

line(240,255,240,305);
line(145,375,145,390);
line(40,350,40,385);

//horizontal lines
line(5,50,370,50);
line(240,150,370,150);
line(5,150,40,150);
line(240,255,370,255);
line(3,305,40,305);
line(145,305,240,305);
line(370,305,400,305);


