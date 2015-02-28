
void setup(){
size(1000,1000);
background(255,255,255);
smooth();
stroke(0,0,250,150);
noFill();
}
void draw(){
fill(0,9);
rect(0,0, width, height);
noFill();

ellipse(mouseX, mouseY, 90, 90);
ellipse(mouseX, mouseY, 80, 80);
ellipse(mouseX, mouseY, 70, 70);
ellipse(mouseX, mouseY, 60, 60);
ellipse(mouseX, mouseY, 50, 50);
}
