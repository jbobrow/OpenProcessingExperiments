
//rotating points around a central axis
int numb = 35;
//declaring and creating the array
float [] x = new float [numb];
float [] y = new float [numb];

void setup() {
  size(300, 300);
  colorMode(RGB);

  for (int a=0; a < numb ; a++) {
    //seeding an array
    x[a] = random(200);
    y[a] = y[a]+10;
  }
}
//defining the function for array
void draw () {
  background (255, 255, 255);
  for ( int a=0; a < numb; a++) {
    translate (150, 150);
    stroke(random(30), 30, random(200));
    smooth();
    strokeWeight(7);
    rotate(frameCount*.05*radians(10));
    point (x[a], y[a]);
    point (x[a]+10, y[a]+10);
  }
}


