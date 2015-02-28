
import peasy.*;
PeasyCam cam;

int W = 0;
int H = 0;
int s = 3;

int dens = 16;
float depth = 0.25;

float W2;
float H2;

PImage img;

void setup() {
  size(500,500, P3D);
  
  cam = new PeasyCam(this, 0,0,0, 500);
  
  img = loadImage("graph.jpg");
  
  W = int(img.width /dens);
  H = int(img.height/dens);
  
  println(W+":"+H);
  
  W2 = W*0.5;
  H2 = H*0.5;
}

void draw() {
  background(0);
  
  rotateY( 0.2*sin(millis()*0.002) );
  rotateX( 0.1*sin(millis()*0.0003) );
  
  fill(255);
  noStroke();
  
  img.loadPixels();
  
  for(int x=0; x<W; x++) {
    for(int y=0; y<H; y++) {
      
      int p =   x*dens + img.width*(y*dens);
//      int p =   x + img.width*(y);
      
      fill(img.pixels[ p ]);
      
      pushMatrix();
      translate( (x-W2)*s, (y-H2)*s );
      box( s, s, red(img.pixels[ p ]) * depth );
//        box(s);
      popMatrix();
      
    }
  }
  
  
//  box(30);
}

