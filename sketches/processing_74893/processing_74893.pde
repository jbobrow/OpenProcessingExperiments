
float angle = 0.0;
   void setup() {
     size(800, 800);
     smooth();
     frameRate(30);
}
   void draw() {
     translate(mouseX, mouseY);
     rotate(angle);
     ellipse(0, -100, 200, 200);
     fill(random(0, 255), random(0, 255), random(0, 255));
     angle += .5;
}


