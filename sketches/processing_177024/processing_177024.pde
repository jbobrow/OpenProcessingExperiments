
void setup () { 
size(500, 400);
background(0);
stroke (0);
fill (98, 78, 99);
ellipse(250, 200, 90, 44);
}
void draw () {
if(mousePressed) {
fill(3, 34, 98);
stroke(0);
ellipse(mouseX, mouseY, 100, 60);
}
else{stroke(0);
fill(0, 125, 14);
rect(mouseX, mouseY, 80, 22);} 
}
