
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/9085*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
ArrayList points;
PImage img;
float x = 0;

void setup() {

  size(583,389,P3D);
  img = loadImage("sketch2.jpg");
   image(img,0,0);
  smooth();
  points = new ArrayList();
  stroke(255);
  strokeWeight(1);
}

void draw() {
  translate(width/2, 0);
  lights();
  if(keyPressed && key == ' ') {
    x = x + 0.5;
  

  }

  rotateY(x);

  for(int i = points.size() - 1; i >= 0; i--) {
    Point dots = (Point) points.get(i);
    dots.display();
  }
}

void mouseDragged() {
  points.add(new Point());
  Point pointz = (Point) points.get(points.size() - 1);
  pointz.setValues(pmouseX - width/2, pmouseY, mouseX - width/2, mouseY);
}

void keyPressed() {
  if(key == 'a') {
    setup();
  }
}

void keyReleased() {
  x = 0;
}






