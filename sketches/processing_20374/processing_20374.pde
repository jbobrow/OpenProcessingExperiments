
float circle;
float strokeH;
float strokeS;
float strokeB;

void setup() {
  size(300, 600);
  colorMode(HSB, 255);
  background(0);
  smooth();
}

void draw() {
  
  circle = random(10);
  strokeH= random(170, 185);
  strokeS= random(140, 180);
  strokeB= random(120, 180);
  
  fill(255);
  stroke(strokeH, strokeS, strokeB, 100);
  ellipse(mouseX, mouseY, circle, circle);
  line(mouseX, mouseY, 300 - pmouseX, 350 - pmouseY);
  }

void mousePressed() {
  background(0);      // clears the background
}

//void keyPressed() {
//  println("Saved!");
//  save("OFFF.jpg");
//}

