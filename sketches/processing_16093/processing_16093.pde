
size(500,500);

background(255);


//pot

smooth();
noStroke();
fill(223,148,41);
rect(130,250,240,45);

quad(160,290,340,290,330,400,170,400);
smooth();



//line

strokeWeight(10);
stroke(180,221,34);
strokeCap(SQUARE);
line(250,150,250,250);

//leaf
translate(250,150);
fill(180,221,34);
rotate(PI/12);
ellipse(-75,0,150,50);
rotate(-PI/6);
ellipse(75,0,150,50);

