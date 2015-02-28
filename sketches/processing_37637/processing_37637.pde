
size(309,420);
background(249, 250, 237);
smooth();

//pad of paper
fill(234,230,215);
stroke(234,222,215);
rect(10,10, 290, 400);

//big grey quad
noStroke();
fill(160, 200);
quad(139,68, 289,209, 211,209, 104,102);

//black sq
fill(0,200);
rect(150,137, 12,12);

//white quad
fill(234,230,215);
quad(110,97, 122,97, 162,137, 150,137);

//lines
stroke(0);
strokeWeight(1.2);
line(58,147, 215,147);

strokeWeight(1);
line(211,142, 211,255);

strokeWeight(.5);
line(58,147, 200,291);

fill(0);
ellipse(115,215, 142,142);

