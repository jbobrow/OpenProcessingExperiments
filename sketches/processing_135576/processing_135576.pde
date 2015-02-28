
void setup(){
size(400,400);
noStroke();
background(0);
smooth();
}
void draw() {
if(mousePressed==true) {
fill(mouseX,mouseY,125);
}
else {
noFill();
}
if(mouseButton==LEFT) {
quad(mouseX,mouseY,mouseX+20,mouseY,mouseX+30,mouseY+15,mouseX-10,mouseY+15);
}
if(mouseButton==RIGHT) {
quad(mouseX,mouseY,mouseX+20,mouseY,mouseX+30,mouseY-15,mouseX-10,mouseY-15);
}
}
