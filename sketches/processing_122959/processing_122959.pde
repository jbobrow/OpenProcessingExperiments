
void setup() {
size(200,200);
background(255);
smooth();
}
void draw() {
stroke(0);
//el valor absoluto siempre es positivo, la vel del ratón es la dif entre posición
strokeWeight(abs(mouseX-pmouseX));
line(pmouseX ,pmouseY ,mouseX ,mouseY );
}


