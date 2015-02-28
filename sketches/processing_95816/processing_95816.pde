
void setup() {
    size(600, 600); 
    noStroke();
    background(255, 100);
    smooth();
    frameRate(27);
}

void draw() {
    // draw brush from perspective of mouse:
    translate(mouseX, mouseY); 

    fill(#47433b);

    // draw individual blobs of paint:
    if (mousePressed) {
       footprints();
    }
    fill(255, 15);
    rect(-mouseX, -mouseY, width, height);
}

void footprints() {
    pushMatrix();
  //  translate(random(-5, 5), random(-5, 5));
    fill(random(0, 255), random(0, 255), random(0, 255), random(80, 100));
    ellipse(0, 0, 20, 16);
    ellipse(-13, -10, 8, 13);
    ellipse(-3.5, -17, 8, 13);
    ellipse(7, -15, 8, 13);
    ellipse(15, -8, 8, 13);
    popMatrix();
}
