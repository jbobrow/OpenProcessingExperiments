
/**
 * 
 * Project 3 Template
 * UCLA Design Media Arts, Spring 2011 
 * Prof. Casey Reas
 * 
 * Based on code from Lorenzo Bravi:
 * http://www.lorenzobravi.com/projects/workshop-isia/
 */

float v; 
float easing = .08;  // Between 0 and 1
float volumeScalar = 500;
boolean noMic = true;
int counter;
PImage b;


void setup() {
  size(500, 500);
  smooth();
  colorMode(RGB);
  counter = 0;
  setupVolume();

  b = loadImage("marblestatue2.png");
}




void draw() {
  {
    counter++;
    noStroke();
    fill(v*3 % 225, v % 255,  v % 255, v-200);
    //(random(255),100,255,v);
    //v*5 % 225, v % 255, v % 255
    ellipse(width/2-10, height/2-20, 300*cos(counter*5), 300*cos(counter*5));
  }

  {
    pushMatrix();
    translate(width/2-10, height/2-20);
    rotate(radians(v));

    for (int x = 50; x <= width-50; x += 12) {
      for (int y = 50; y <= height-50; y+=12) {
        line(x-width/2, y-height/2, 0, 0);
      }
    }
    popMatrix();
  }

  testFace();    


  image(b, -110, -50);
  getVolume();

  if (noMic == true) {
    v = map(mouseX, 0, width, 0, 1000);
  }



  //saveFrame("mask-####.png");
}


