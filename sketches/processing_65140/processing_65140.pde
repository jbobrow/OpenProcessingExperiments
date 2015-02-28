
// MODIFICATION + ADAPTATION TO
// http://www.openprocessing.org/sketch/4879  BY  KYLE MCDONALD
// WITH HELP FROM MICHAEL KONTOPOULOS
// v7 radiating line
float ss;
PImage m;
int[] values;
//int levels =5;
float noiseScale = .01;
float t;
float TV; //threshold variable;


void setup() {
  
  size(1000, 350, P2D);
  values = new int[width * height];
  background(0);
  noiseDetail(8,0.3); //line fluidity 6, .3
  imageMode(CENTER);
  smooth();
}

void draw() {
  fill(0);
  rect(0, 0, width, height);
  float offset = frameCount * .008; //speed of lines generating
  // first pass: compute values
  for (int y = 0; y < height; y++)  {
    for (int x = 0; x < width; x++) {
      int i = y * width + x; //location of pixels
      float d = dist(x, y, mouseX, mouseY);
      float levels = map(d, 0, 160, 0, 20); //lines
      float t1=x*noiseScale;
      float t2=y*noiseScale;
      values[i] = (int) (levels * noise(t1,t2, offset));  //line distances between each other
       }
      }
      //tint (100,50);

      //create png with circle in the middle. 1 click generates new, hold mouse expand the "mask"
      //      if (mousePressed == true) {
      //        
      //      values[i] = (int) (levels * noise(x*noiseScale/-1.1,y*noiseScale/1.1)); //offset value creates motion, no offset=static
      //    }
      //            stroke(values[i]*25.5); //scale from 0-10 to 0-255
      //            point(x,y); 
     

  // second pass: check neighborhood

  //Try commenting out this whole chunk (before load() and after update() and uncommenting
  //the two lines above (stroke,point) to see what you're actually "tracing"
  loadPixels();
  
      if (mousePressed == true) {
        for (int y = 1; y < height; y++)  {
        for (int x = 1; x < width; x++) {
          int i = y * width + x;
          TV+=.000005; //.0000041
        if (values[i-1] < TV) {
          pixels[i] = color(0);
          int center = values[i];
        if ( center != values[i - 1] || center != values[i - width]) {  // i-(value) - > thickness of lines
          pixels[i] = color(255);
          }
          }
        }
        }
      }
  updatePixels();
  
}

void mouseReleased () {
  TV=0;
}




