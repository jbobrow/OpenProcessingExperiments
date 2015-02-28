
float Theta = -1.0;
PImage img;
PImage img1;
PFont font;

void setup() {
   size(700, 500);
   noStroke();
   img = loadImage("nietzsche2.png");
   img1 = loadImage("supermanLogo1.png");
   smooth();
   font = loadFont("Silom-48.vlw");
}

void draw() {
   image(img1, -50, 0);
   textFont(font, 40);
   fill(255);
   text("It's the Superman!", 150, 50);
   translate(width/2+100, height+100);
   callFigure();
   if (Theta < 2.5) {
     Theta += radians(1);
   }
   else {
     Theta = -1.0;
   }
}

void drawFigure() {
  strokeWeight(0);
  translate(-50, 400);
  fill(0);
  noStroke();
  rect(0, 0, 200, 75);
  stroke(0);
  triangle(0, 0, 0, 75, -50, 30);
  triangle(0, 70, 180, 70, 105, -50);
  triangle(0, 5, 180, 5, 105, 125);
  fill(255);
  noStroke();
  ellipse(0, 75, 70, 70);
  pushMatrix();
  rotate(PI);
  image(img, -50, -130, 100, 100);
  popMatrix();
}

void callFigure() {
  pushMatrix();
  rotate(Theta + radians(120));
  stroke(0);
  strokeWeight(10);
  line(30, 0, 30, 400);
  drawFigure();
  popMatrix();
}

