
//Malachite Sketch
//by Nick Wheat
// based on Henon Phase Diagram
// a mathematical strange attractor
// j.tarbell   January, 2004
// Albuquerque, New Mexico
// complexification.net

// based on code from mathworld.wolfram.com/HenonMap.html

// Processing 0085 Beta syntax update
// j.tarbell   April, 2005

// number of points to draw in each 



float dim = 400;
float gs = 2.0;      // scale the visualization to match the applet size  
float ga = 3.0;
int gc = 0;
int cnt;
int fadebg;
int num = 0;
int maxnum = 300;
int numpoints = 3000;

TravelerHenon[] travelers = new TravelerHenon[maxnum];

// frame counter for animation
float time;

color[] goodcolor = {#004026, #00703A, #00AD5A, #003301, #193300, #00EB79, #000000, #1c2520, #000000, #103021, #1b2a23, #096f4a, #00703A, #00AD5A, #003301, #193300, #00EB79, #00EB79, #000000, #1c2520, #000000, #103021, #1b2a23, #096f4a, #00703A, #00AD5A, #003301, #193300, #00EB79};
color somecolor() {
  // pick some random good color
  return goodcolor[int(random(goodcolor.length))];
}


void newHenon() {
  background(#06110c);  
  ga = random(TWO_PI);
  gc = int(random(goodcolor.length));
  for (int i=0;i<num;i++) {
    travelers[i].rebirth();
  }

}

void setup()
{
  
  size(600,600,P3D);
//  size(dim,dim,P3D);
  background(#06110c);
  noStroke();
  
  // make some travelers
  for (int i=0;i<maxnum;i++) {
    float tx = random(0.0,1.0);
    travelers[i] = new TravelerHenon(tx,0.0);
    num++;
  } 
}

void draw(){
  
  if (fadebg>0) {
    cnt++;
    if ((cnt%5)==0) {
      fill(255,255,255,50);
      rectMode(CORNERS);
      rect(0,0,dim-1,dim-1);
      fadebg -= 50;
    }
  }

  for (int i=0;i<num;i++) {
    travelers[i].draw();
  }
}

void mouseClicked()
{
  // reset
  newHenon();
}

class TravelerHenon {
  float ox, oy;
  float x, y;
  
  color myc;
  
  TravelerHenon(float Ox, float Oy) {
    // constructor
    ox = Ox;
    oy = Oy;
    // set travel position
    x = Ox;
    y = Oy;

    // set some good color    
    myc = goodcolor[int(gc+floor(goodcolor.length*ox))%goodcolor.length];
  }
  
  void draw() {
    // move through time
    
    
    float t = x * cos(ga) - (y - x*x) * sin(ga);
    y = x * sin(ga) + (y - x*x) * cos(ga);
    x = t;
    // render
    stroke(red(myc),green(myc),blue(myc),32);
    point((x/gs + .5)*dim,(y/gs + .5)*dim);
    
  }  
      
  void render(int maxpoints) {
    for (int i=0;i<maxpoints;i++) {
      draw();
    }
  }
  
  void rebirth() {
    x = ox;
    y = oy;
    myc = goodcolor[int(gc+floor(goodcolor.length*ox))%goodcolor.length];
        
  }    
   
  
}    
  


