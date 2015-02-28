
//Kelvin Pan
//Computer Programming 1
//10.22.12
//100 Random Shapes: Random Ellipses
//website: awxrus.webs.com OR OpenProcessing

//variables

//setup
void setup() {
  size(1000, 500, P3D);
  noStroke();
  frameRate(1);
}

//draw
void draw() {
  background(0);
  lights();
  int circ = 1;
  while (circ <= 100) {
    int x = int(random(0, 1000));
    int y = int(random(0, 500));
    int z = int(random(0, 1));
    translate(x, y, z);
    fill(random(1, 255), random(1, 255), random(1, 255), 100);
    sphere(random(25, 50));
    translate(-x, -y, -z);
    circ++;
  }
}
