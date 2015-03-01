
void setup() {
size(600,600);
background(100);}

void draw() {

stroke(255);
fill(random(255));
rect(mouseX,mouseY,random(-100),random(100));

}

void mousePressed() {
background(random(255));
}
