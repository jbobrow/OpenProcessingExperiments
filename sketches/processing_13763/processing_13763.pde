
void setup() {
size(400, 400);
textSize(64);
textAlign(CENTER);
smooth();
background(0);
}
void draw(){
fill(random(255), random(255), random(255));
if (mousePressed) {
text(key, mouseX, mouseY);
}
}

