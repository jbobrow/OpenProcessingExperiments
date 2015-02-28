
void setup(){
size(640,480);
background(0);
smooth();
frameRate(30);
}

//limbs
void draw () {
stroke(83,234,205);
line(285,237,275,252);
line(285,238,275,253);
line(355,237,365,252);
line(355,238,365,253);

stroke(242,29,129);
line(305,269,305,280);
line(306,269,306,280);
line(307,269,307,280);

line(335,269,335,280);
line(334,269,334,280);
line(333,269,333,280);


//face
fill(83,234,205);
noStroke();
ellipse(width/2,237,70,70);

//eye
fill(255,255,255);
noStroke();
ellipse(320,225,35,35);
fill(mouseX,mouseY,19);
noStroke();
ellipse(320,225,20,20);

//ears
noStroke();
fill(242,29,129);
triangle(291,217,285,207,295,212);

noStroke();
fill(242,29,129);
triangle(349,217,355,207,345,212);

//mouth
stroke(95,57,19);
noFill();
line(305,247,335,247);
noStroke();
fill(255,255,255);
triangle(311,248,315,268,319,248);
triangle(321,248,325,268,329,248);}

//dot 
void mousePressed(){
noStroke();
fill(242,29,129);
ellipse(mouseX,mouseY,10,10);}




