
void setup () {
    size (400, 400);
    background (random(255), random(255), random(255));
    stroke (0);
}
void draw () {
    if (mousePressed) {
    fill(random(255), random(255), random(255));
    ellipse (mouseX, mouseY, 20, 20); 
    }
}
void keyPressed () {
     background (random(255), random(255), random(255));
}

