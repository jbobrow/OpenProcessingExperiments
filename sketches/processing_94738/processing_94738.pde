
/* @pjs preload="logo.png"; */
PImage img;
float z = 0;
float m = 0;
float maxR = 30;
float t = 0;
int e = 1;

boolean inverted = false;
boolean squares = false;

void setup() {
  size(648, 246);
  smooth();
  img = loadImage("logo.png");
  img.loadPixels();
  background(0);
  stroke(255,100);
  fill(255, 10);
  m = random(3);
}

void draw() {
  z += random(1);
  if (z > 300) {
    z = 0;
    m = random(3);
    maxR = 30;
    float x1 = random(img.width);
    float w = random(img.width / 3, img.width);
    t = random(1);
    e = (int)random(1,3);
    fill(inverted ? 0 : 255);
    rect(x1, 0, w, img.height);
    
    if (!inverted) {
      stroke(0,100);
      fill(0, 10);
    } else {
      stroke(255,100);
      fill(255, 10);
    }
    inverted = !inverted;
  }
  for (int i = 0; i < random(400,900); i++) {
    int x = (int)random(width-1);
    int y = (int)random(height-1);    
    float p = random(256);
    color c = img.get(x,y);
    int grey = (int)(red(c)+green(c)+blue(c))/3;
    if (inverted) {
      grey = 256 - grey;
    }
    if (p <= grey) {
      if (m < 1) {
        float u = random(1);
        float r = 1;
        strokeWeight(1);
        if (u < 0.00005) {
          r = random(200, 500);         
          strokeWeight(random(3,15));
        } else if (u < 0.01) {
          r = 15;
        }        
        ellipse(x, y, r, r);
      } else if (m < 2) {
        float u = random(1);
        float r = 1;
        if (u < 0.0001) {
          r = 1000;
        } else if (u < 0.1) {
          r = random(1,10);
        }
        if (r == 1000) {
          curve(random(img.width), random(img.height), 
                x, y,
                x + random(-img.width,img.width), y + random(-img.height,img.height),
                random(img.width), random(img.height));
        } else {
          line(x, y, x + random(-r,r), y + random(-r,r));
        }
      } else {
        point(x, y);
        
        for (int q = -e; q < e; q++) {
          for (int w = -e; w < e; w++) {
            if (q != 0 && w != 0) {
              if (random(1) < t) 
                point(x + q, y + w);
            }
          }          
        }
        
      }
    } 
  }
}

