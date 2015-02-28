
size (400,480);
smooth();
background(239,231,236); 

noStroke();
fill(136,84,34);
ellipse(100,130, 220,220);


stroke(0,0,0);
strokeWeight(10);
line(20,135, 400, 190);

noStroke();
fill(83, 126, 99);
ellipse(30,135, 40, 40);


stroke(0,0,0);
strokeWeight(10);
line(80,80, 50, 400);

noStroke();
fill(243,175,48);
ellipse(80, 80, 40, 40);

fill(180,34,35);
quad(120,80,  170,90,  150,310,  100,300);

stroke(0,0,0);
strokeWeight(7);
line(30,170, 160, 187);

noStroke();
fill(243,175,48);
quad(175,5,  210,10,  190,245,  155,240);


//three lines
stroke(0,0,0);
strokeWeight(4);
line(120,10, 230, 25);

stroke(0,0,0);
strokeWeight(2);
line(150,25, 250, 38);

stroke(0,0,0);
strokeWeight(1);
line(180,43, 270, 55);

//green small
noStroke();
fill(83,126,99);
quad(90,40,  208,50,  205,70,  90,60);

//red ellipse
noStroke();
fill(180,34,35);
ellipse(200, 60, 40, 40);

//green larger
noStroke();
fill(83,126,99);
quad(137,270,  210,285,  205,322,  133,307);

//line under green/red quads 
stroke(0,0,0);
strokeWeight(15);
strokeCap(SQUARE);
line(100,300, 205, 320);

//small brown ellipse
noStroke();
fill(136,84,34);
ellipse(210, 275, 60, 60);

//line thru brown ellipse 
stroke(0,0,0);
strokeWeight(4);
strokeCap(SQUARE);
line(103,260, 300, 302);

//line below yellow quad
stroke(0,0,0);
strokeWeight(7);
strokeCap(SQUARE);
line(155,235, 215, 245);




