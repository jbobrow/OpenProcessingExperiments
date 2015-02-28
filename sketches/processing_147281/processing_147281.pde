

void setup() {
size(300, 300);
background(255);
smooth();
}
 
void draw() {
if(keyPressed){
background(255);
}
if (mousePressed) {

stroke(70);
line(mouseX, mouseY, pmouseX, pmouseY);
float a=dist(mouseX, mouseY, pmouseX, pmouseY);
float x = random(-3,3);
float y = random(-3,3);
ellipse(mouseX+x,mouseY+y,a/2,a/2);

}
}
