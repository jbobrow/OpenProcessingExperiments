
/*
INSANE ROBOT!
*/

void setup(){
size(1000, 1000);
frameRate(20);
}

void draw() {
float r = random(255);
float g = random(255);
float b = random(255);

background(r, g, b);

fill(180);
ellipse(500, 300, 200, 200);

fill(r, 0, 0);
rectMode(CENTER);
rect(500, 300, 120, 120);

fill(180);
beginShape();
vertex(440, 400);
vertex(400, 700);
vertex(600, 700);
vertex(560, 400);
endShape();

triangle(400, 400, 600, 400, 500, 500);
triangle(400, 700, 450, 700, 425, 740);
triangle(550, 700, 600, 700, 575, 740);
}



