
//several lines
smooth();
size(500,500);
background(255);
fill(0);
quad(250,0,500,0,500,500,250,500);
strokeWeight(5);
stroke(255);
line(449,-1,501,56);
strokeWeight(4);
stroke(255);
line(424,-1,501,81);
strokeWeight(3);
stroke(255);
line(399,-1,501,106);
strokeWeight(2);
stroke(255);
line(374,-1,501,131);
strokeWeight(1);
stroke(255);
line(349,-1,501,156);
//center white circle
stroke(0);
fill(255);
ellipse(250,250,300,300);
//right dark circle
fill(0);
ellipse(294,250,214,214);
//negatives
fill(0);
bezier(250,101,50,107,50,397,250,400);
line(250,152,250,348);
line(250,101,250,151);
bezier(250,151,157,195,168,317,250,348);
line(250,101,250,151);
line(250,348,250,399);
stroke(0);
fill(255);
line(250,152,250,348);
bezier(250,152,157,195,168,317,250,348);
//triangles
fill(0);
triangle(170,0,224,103,186,115);
triangle(0,0,160,130,131,158);
triangle(0,181,113,190,101,228);
triangle(0,321,101,266,110,307);
triangle(0,500,129,342,159,372);
triangle(170,500,183,386,221,398);

