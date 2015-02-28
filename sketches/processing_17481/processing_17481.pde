
size(250, 250);
noStroke();
smooth();
background(0);

//rectangles from least to greatest going towards center from top
rect(0,0,10,10);
fill(245);
rect(10,5,15,15);
fill(240);
rect(25,10,20,20);
fill(230);
rect(42,15,25,25);
fill(220);
rect(62,20,33,33);
fill(200);
rect(82,25,40,40);
fill(250);
rect(240,0,10,10);
fill(245);
rect(225,5,15,15);
fill(240);
rect(207,10,20,20);
fill(230);
rect(187,15,25,25);
fill(220);
rect(165,20,33,33);
fill(200);
rect(135,25,40,40);
//the rectangle on the foreground
fill(170);
rect(102,30,50,50);

//rectangles from least to greatest going towards center from bottom
fill(250);
rect(0,240,10,10);
fill(245);
rect(10,230,15,15);
fill(240);
rect(25,220,20,20);
fill(230);
rect(42,210,25,25);
fill(220);
rect(62,197,33,33);
fill(200);
rect(82,185,40,40);
fill(250);
rect(240,240,10,10);
fill(245);
rect(225,230,15,15);
fill(240);
rect(207,220,20,20);
fill(230);
rect(187,210,25,25);
fill(220);
rect(165,197,33,33);
fill(200);
rect(135,185,40,40);
//the rectangle on the foreground
fill (170);
rect (102,170,50,50);

strokeWeight (.5);
stroke(90);
//diagonal lines for upper section of rectangles
line(0,0,128,80);
line(0,0,128,70);
line(0,0,128,60);
line(0,0,128,50);
line(0,0,128,40);
line(128,80,250,0);
line(128,70,250,0);
line(128,60,250,0);
line(128,50,250,0);
line(128,40,250,0);

//diagonal lines for lower section of rectangles
line(0,250,128,210);
line(0,250,128,200);
line(0,250,128,190);
line(0,250,128,180);
line(0,250,128,170);
line(128,210,250,250);
line(128,200,250,250);
line(128,190,250,250);
line(128,180,250,250);
line(128,170,250,250);

fill(15,100);
//circles in the centre
ellipse(125,125,150,150);
ellipse(125,125,110,110);
ellipse(125,125,55,55);
strokeWeight(1);
ellipse(70,70,60,60);
ellipse(70,180,60,60);
ellipse(180,70,60,60);
ellipse(180,180,60,60);

fill(45,100);
//circles at sides
strokeWeight(.25);
ellipse(25,125,40,40);
ellipse(45,125,30,30);
ellipse(225,125,40,40);
ellipse(205,125,30,30);
//rectangles at sides
strokeWeight(1);
rect(170,120,15,15);
rect(150,122,10,10);
rect(65,120,15,15);
rect(89,122,10,10);


