
void setup() {
size(800,600);
}
void draw() {
background(mouseX,100,mouseY);
stroke(1.5);
line(0,0,mouseX,mouseY);
line(800,0,mouseX,mouseY);
line(0,600,mouseX,mouseY);
line(800,600,mouseX,mouseY);
if(mousePressed){
mousePressed()
} else {
fill(255);
textSize(30);
text("Halten Sie die Maus gedrückt um die Position anzeigen",30,40);
text("zu lassen!",320,80);
}
}
void mousePressed() {
fill(0);
textSize(20);
text("X",350,30);
text(mouseX,380,30);
text("Y",350,60);
text(mouseY,380,60);
}
