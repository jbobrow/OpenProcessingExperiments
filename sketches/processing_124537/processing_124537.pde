
//erinknowles@student.nscad.ca

void setup() 
{ size(400, 400);
}
void draw() {
background(mouseX, mouseY, mouseX+mouseY);
fill(0);
noStroke();
ellipse(100,100,20,20);
ellipse(100,300,20,20);
ellipse(300,100,20,20);
ellipse(300,300,20,20);
stroke(255);
strokeWeight(4);
line(100, 100, mouseX, mouseY);
line(100, 300, mouseX, mouseY);
line(300, 100, mouseX, mouseY);
line(300, 300, mouseX, mouseY);

}


