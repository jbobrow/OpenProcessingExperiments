
void setup() {
  size (200,200);
  smooth();
  frameRate(30);
  noCursor();
}
void draw() {
  background(10,232,255);

ellipseMode(CENTER);
rectMode(CENTER);

//body
noStroke();
fill(252,197,216);
ellipse(mouseX,mouseY+70,170,185);

//ears
noStroke();
fill(252,227,245);
ellipse(mouseX-25,mouseY-70,20,20);
ellipse(mouseX+25,mouseY-70,20,20);

//back head
stroke(224,197,216);
fill(252,197,216);
ellipse(mouseX,mouseY-10,130,130);

//inner head circle
noStroke();
fill(252,227,245);
ellipse(mouseX,mouseY,100,100);

//nose
noStroke();
fill(224,197,216);
ellipse(mouseX,mouseY,30,30);

//nouse holes
fill(0);
ellipse(mouseX-4,mouseY,3,6);
ellipse(mouseX+4,mouseY,3,6);

//eyes
fill(0);
ellipse(mouseX-19,mouseY-50,6,6);
ellipse(mouseX+19,mouseY-50,6,6);

//hands
noStroke();
fill(252,227,245);
ellipse(mouseX-55,mouseY+40,30,55);
ellipse(mouseX+55,mouseY+40,30,55);
//mouth
noStroke();
fill(0);
ellipse(mouseX,mouseY+40,10,10);
//bowtie
noStroke();
fill(0);
triangle(mouseX+20,mouseY+50,mouseX+20,mouseY+70,mouseX-8,mouseY+60);
triangle(mouseX-20,mouseY+50,mouseX-20,mouseY+70,mouseX+8,mouseY+60);
ellipse(mouseX,mouseY+60,10,10);
}
void mousePressed() {
  println("apple martini! ooooh!");
}

