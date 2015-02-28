
// Exercise-Draw Mondrian's Composition
// TePangChiang  N76014087

void setup() {
size(280,275);
background(232,235,228);
}

void draw() {
fill(0,0,0);

noStroke();
rectMode (CORNERS);
fill(231,6,4);
rect(0,0,130,110);
fill(224,201,0);
rect(0,180,30,275);
fill(22,15,93);
rect(130,180,215,255);

noFill();
stroke(0,0,0);
strokeWeight(6);
line(0,110,280,110);
line(0,180,280,180);
strokeWeight(5);
line(131,255,214,255);
line(215,180,215,275);
line(130,0,130,275);
strokeWeight(4);
line(30,180,30,275);
}



