
float angle = 0.0;
   void setup() {
     size(800, 800);
     smooth();
     frameRate(30);
}
   void draw() {
     translate(mouseX, mouseY);
     rotate(angle);
     rect(-250, -50, 500, 10);
     fill(random(0, 255), random(0, 100), random(100, 200));
     angle += 1000;
}


