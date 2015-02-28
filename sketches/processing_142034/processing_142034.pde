
//ART 3001,OSU. Florence Gouvrit
//REMINDER - CONSTANT MOUSE FOLLOW: DOT & LINE
//Follow Mouse & Draw with Mouse
//Getting Started with Processing: Casey Reas, Ben Fry


/*
//CONSTANT DOT
void setup() {
size(480, 120);
fill(0, 102);
smooth();
noStroke();
}
void draw() {
background(204);
ellipse(mouseX, mouseY, 9, 9);
}

*/

///*
//CONSTANT LINE
void setup() {
size(480, 120);
strokeWeight(4);
smooth();
stroke(0, 102);
}
void draw() {
line(mouseX, mouseY, pmouseX, pmouseY);
}

//*/
