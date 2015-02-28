
int raton = 10;
void setup() {
background(0);
size(400,400);}
void draw() {  
stroke(255); 
strokeWeight(2);
ellipse(mouseY, mouseX,mouseX,mouseY);
noFill();
stroke(25,55,1);
rect (pmouseX,pmouseY,mouseY, mouseX);
noFill();
stroke(1);}

