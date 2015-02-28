
void setup() {
background(0,137,0);
size(400,400);
smooth();
frameRate(70) ;
}
void draw() {

background(255);
ellipseMode(CENTER);
rectMode(CENTER);
stroke(0);
fill(137,23,47);
ellipse(mouseX,mouseY,60,100);
stroke(0);
fill(20,209,56);
ellipse(mouseX ,mouseY -30,60,60);

fill(mouseX,0,mouseY);
ellipse(mouseX-19,mouseY-30,16,32);
ellipse(mouseX + 19,mouseY-30,16,32);

stroke(0);
line(mouseX-10,mouseY + 50,pmouseX-10,pmouseY + 60);
line(mouseX + 10,mouseY + 50,pmouseX + 10,pmouseY + 60);
}
void mousePressed() {
println( "Jana! ");
}

