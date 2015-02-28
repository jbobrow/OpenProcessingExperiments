
int raton = 10;
void setup() {
noCursor();
background(0);
size(1000,1000);}
void draw() { 
stroke(255);
strokeWeight(2);
ellipse(mouseY, mouseX,mouseX,mouseY);
fill(random(255),random(255),random(255),random(255));}
void mousePressed(){ 
background(6);}
