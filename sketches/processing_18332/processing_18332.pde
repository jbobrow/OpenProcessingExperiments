
size(250,250);
background(18,49,51);

smooth();
strokeWeight(2);
stroke(240,96,25,70);
line(125,125,0,250);
line(125,125,0,0);
line(125,125,250,0);
line(125,125,250,250);

//central circle back grey
smooth();
strokeWeight(5);
stroke(188,245,249,100);
fill(188,245,249,100);
ellipse(125,125,125,125);

//background circle semi opaque
smooth();
strokeWeight(25);
stroke(83,228,237,51);
noFill();
ellipse(125,125,175,175);

//biggest semi opaque background circle
smooth();
strokeWeight(25);
stroke(12,86,6,51);
noFill();
ellipse(125,125,205,205);


//TL first circle
smooth();
strokeWeight(8);
stroke(28,108,113);
noFill();
ellipse(45,45,200,200);

//TL 2nd circle
smooth();
strokeWeight(8);
stroke(28,108,113);
noFill();
ellipse(35,35,150,150);

//TL 3rd circle
smooth();
strokeWeight(8);
stroke(28,108,113);
noFill();
ellipse(25,25,100,100);

//TL 4th circle
smooth();
strokeWeight(8);
stroke(28,108,113);
noFill();
ellipse(15,15,50,50);

//TL 5th and smallest circle
smooth();
strokeWeight(4);
stroke(28,108,113);
noFill();
ellipse(0,0,25,25);

//BR first circle
smooth();
strokeWeight(8);
stroke(28,108,113);
noFill();
ellipse(205,205,200,200);

//BR first circle
smooth();
strokeWeight(8);
stroke(28,108,113);
noFill();
ellipse(215,215,150,150);

//BR second circle
smooth();
strokeWeight(8);
stroke(28,108,113);
noFill();
ellipse(225,225,100,100);

//BR third circle
smooth();
strokeWeight(8);
stroke(28,108,113);
noFill();
ellipse(235,235,50,50);

//BR fourth and smallest circle
smooth();
strokeWeight(4);
stroke(28,108,113);
noFill();
ellipse(250,250,25,25);

//TL triangle
smooth();
strokeWeight(6);
stroke(7,238,252);
fill(7,238,252);
triangle(85,45,45,115,125,115);

//BR triangle
smooth();
strokeWeight(6);
stroke(7,238,252);
fill(7,238,252);
triangle(125,135,205,135,165,205);

//central circle front darker orange
smooth();
strokeWeight(5);
stroke(240,96,25);
noFill();
ellipse(125,125,70,70);

//central circle front red
smooth();
strokeWeight(5);
stroke(255,0,0,150);
noFill();
ellipse(125,125,40,40);

saveFrame("balsym2.png"); 
