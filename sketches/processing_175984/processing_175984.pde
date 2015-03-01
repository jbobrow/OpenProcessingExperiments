
void setup() {
size(1000,1000);
smooth();
}

void draw() {
if(mousePressed){
fill(200,100,200);
} else {
fill(100,200,50);
}
ellipse(mouseX,mouseY,40,60);
}
