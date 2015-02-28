
PImage img;

void setup() {
size(900,450);
img =loadImage ("43605");
smooth();
strokeWeight(30);
}
void draw() {
image(img,0,0);
background(204);
stroke(255,200,222,200);
rect(width/2,height/2,50,90);
stroke(102);
ellipse(mouseX,mouseY,1,1);
if (mousePressed == true) {
stroke(0);
}
ellipse(mouseX,mouseY,1,1)
}
