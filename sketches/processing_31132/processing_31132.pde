
void setup() {
size(500,500);
fill(224,16,16);
smooth();
noStroke();
}

void draw() {
background(mouseX,mouseY,50);

fill(mouseX,mouseY,203);
triangle(mouseX,mouseY,200,300,300,200);

fill(29,203,141);
triangle(mouseX,mouseY,400,300,300,200);

fill(mouseX,mouseY,203);
triangle(mouseX,mouseY,300,100,300,200);

fill(203,29,55);
triangle(mouseX,mouseY,150,200,300,200);

fill(mouseX,mouseY,178);
triangle(mouseX,mouseY,450,200,300,200);

// draw eye ball
fill(0);
ellipse(mouseX,mouseY,100,50);

//draw pupil
fill(224,16,16);
ellipse(mouseX,mouseY,30,30);
}

