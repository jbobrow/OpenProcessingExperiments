
// MODIFICATION + ADAPTATION TO
// http://www.openprocessing.org/sketch/4879  BY  KYLE MCDONALD
// WITH HELP FROM MICHAEL KONTOPOULOS
// v2 click -> expand
float ss;
int[] values;
float noiseScale = .01;
float t;
float s1, s2;
float thresh = 0;
boolean go = false;
float levels;


void setup() {

  size(1000, 350, P2D);
  values = new int[width * height];
  background(0);
  noiseDetail(6, 0.3); //line fluidity 6, .3
  imageMode(CENTER);
}

void draw() {
  fill(0);
  rect(0, 0, width, height);
  // first pass: compute values

  if(go == true && thresh<=levels)
    thresh += 0.15;


  // second pass: check neighborhood

  //Try commenting out this whole chunk (before load() and after update() and uncommenting
  //the two lines above (stroke,point) to see what you're actually "tracing"
  loadPixels();
  for (int y = 1; y < height; y++) {
    for (int x = 1; x < width; x++) {
      int i = y * width + x;
      int center = values[i];
      if ( center != values[i - 1] || center != values[i - width]) {  // i-(value) - > thickness of lines
        if (center < thresh) {
          pixels[i] = color(255);
        }
      }
    }
  }

  updatePixels();
}

float z;

void mousePressed() {
  go = true;
  thresh = 0;
  

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int i = y * width + x; //location of pixels
      float d = dist(x, y, mouseX, mouseY);
      levels = map(d, 0, 200, 10, 20); //lines
      // float levels = 60;
          float offset = frameCount * .01; //speed of lines generating

      float t1=x*noiseScale;
      float t2=y*noiseScale;
      values[i] = (int) (levels * noise(t1, t2,offset));  //line distances between each other

    }

  }

}

