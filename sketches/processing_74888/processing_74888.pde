
float angle = 0.0;
 void setup() {
 size(800, 800);
 smooth();
 frameRate(30);
}
 void draw() {
 translate(mouseX, mouseY);
 rotate(angle);
 rect(-200, -200, 400, 400);
 fill(random(0, 100), random(100, 200), random(200, 255));
 angle += 3;
}


