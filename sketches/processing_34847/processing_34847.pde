
size(300,300);
background(214,204,168);
smooth();




//diagonals line from right
line(125,0,300,270);

strokeWeight(1);
line(170,0,180,20);

line(200,0,205,10);




//yellow triangle
fill(236,208,83);
noStroke();
triangle(25,0,38,0,38,13);



//ARC
fill(237,234,219);
stroke(0,0,0);
arc(0,55,80,80, TWO_PI-PI/2, TWO_PI);




//small triangle
fill(158,140,102);
triangle(145,0,185,60,145,0);




//green circle
fill(148,156,115);
stroke(141,146,106);
ellipse(150,180,100,100);




//yellowtriangle
fill(227,179,77);
stroke(190,164,105);
triangle(75,135,145,55,170,165);




//OVERLAP
fill(149,87,36);
noStroke();
triangle(170,165,110,145,160,128);




//purple circle
fill(127,108,153);
noStroke();
ellipse(25,125,58,58);




//red square
stroke(0,0,0);
fill(128,39,31);
quad(195,205,235,205,235,245,195,245);




//lines on top of red square
line(220,222,250,222);
strokeWeight(3);
line(220,228,250,228);




//lines on left
stroke(0,0,0);
strokeWeight(3);
line(0,15,150,170);

strokeWeight(1);
line(0,35,65,250);

line(0,55,145,55);

line(0,125,125,125);

line(0,210,135,205);





