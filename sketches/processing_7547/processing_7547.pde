
// based on Robert Irwin's "Untitled" (1963-1965)
// http://www.davidzwirner.com/exhibitions/217/work_4361.htm
//
// what this needs: a better kind of randomness:
// some automatic way of picking complementary colors?

int centerX = 400;
int centerY = 400;
int interval = 20;
int radius = 10;
int greenradius = 400;
int orangeradius = 350;
float distance;

float eccentricity = 1.5; // this value should be between 1 and 2
float sparceness = 0.25;   // this value should be between 0 and 1
color color1 = color(255,123,8); // this is orange;
color color2 = color(25,168,0); // this is green


void setup() {
  size(800,800);
  smooth();
  // noLoop(); 
}

void draw() {
//color1=color(255,0, 255);
//color2=color(0, 255,255);
  background(255);
  noStroke();
  circles(color1,orangeradius,0);
  circles(color2,greenradius,(interval/2));
}


void drawcircle(int xx, int yy) {
  ellipse(xx, yy, radius, radius);
}

void circles(color fillcolor, int myradius, int offset) {
  fill(fillcolor);
  for(int i = offset; i<(width+1); i+=interval) {
    for(int j = offset; j<(height+1); j+=interval) {
      distance = sqrt(pow(i-centerY,2)+pow(j-centerX,2));
      if(distance < myradius) {
        drawcircle(i, j); 
      } 
      else {
        if(distance < (myradius*random(1,eccentricity)) && (random(1) > sparceness)) {
          drawcircle(i, j);
        }
      }
    }
  }
}




