
PImage paintbrush;
void setup() {
  noCursor ();
  size(800, 800);
  smooth();
  paintbrush = loadImage("brush_paint.png");
}
void draw() {
  if (mousePressed == true) {
    println("mousePressed boolean");
    stroke(mouseX*5, mouseY*5, 150);
    strokeWeight(random(2, 3));
  }
  for (int i = 1; i <=20; i++) {
    fill(random(19), random(30), random(310), random(45));
    ellipse(random(i*300), random(i*300), random(i*10), random(i*15));
    println(i);
  }

  imageMode (CENTER);
  image (paintbrush, mouseX, mouseY);
}
void mousePressed() {
  ellipse(random(800), random(700), 30, 10);
}
void mouseDragged() {
  line(mouseX, mouseY, 400, 400);
}





