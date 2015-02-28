
//Author: Weiyuh Li
//dreaming on the sofa
//concept:hypnotized by TV
//mouse left click to change color
//reference:http:class exercise by Sheng-Fen Nik Chi
//          http://www.aac.bartlett.ucl.ac.uk/processing/samples/bzr.pdf
int c[][][] ;
int ins[] ;
int nbSTATE =12;  
int range=4;      
int th=4;        
int sw=0;
int t=0;
int wt=0;
//float r=random(30);

void setup() {
  size(500, 300);
  colorMode(HSB, 1.2);
  frameRate(16);           
  c = new int [width][height][4]; 
  ins = new int [nbSTATE+1] ;   
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      c[x][y][sw]  = int(random(0, nbSTATE)  ) ;
      c[x][y][1-sw]  =  5  ;
    }
  }
}


void draw() {
  CA();  
  wiggly();
  wiggly2();
  wiggly3();
  fill(0.2);
  noStroke();
  rect(0, 0, 40, height);
  rect(width-40, 0, 40, height);
  rect(0, 0, width, 15);
  rect(0, height-15, width, 15);

  // t++;
}


void CA() {
  float amt, u;
  int dins, ix, iy, i, j ;
  for (int x = 0; x <  width ; x++) {
    for (int y = 0; y < height ; y++) {
      for (int ii=0; ii< nbSTATE ; ii++) {
        ins[ii] = 0 ;
      }

      for ( int rn= y-range ; rn<=y+range; rn++) {  
        dins = range -abs(rn-y);       
        for (int sn= x-dins;  sn<= x+dins; sn++) {
          ix=  (sn + width) % width ;
          iy=  ( rn + height) % height ;
          i=c[ix][iy][sw] ;
          ins[i]++  ;
        }
      } 


      i= c[x][y][sw];
      j= (1 + i) % nbSTATE  ;

      if (ins[j] >= th ) {   
        c[x][y][1-sw] = j;
      }
      else {
        c[x][y][1-sw] = i ;
      }

      amt = map(c[x][y][1-sw], 0, nbSTATE, 0, 1);

      set(x, y, color(amt, 1, 1));
    }
  }

  sw=1 - sw ;
}

void wiggly () {
  strokeWeight(2);
  stroke(0.4, 50-wt*0.015);
  int step = 10;
  float nlevel = 0.1;
  float lastx = -999;
  float lasty = -999;
  float ynoise = random(10);
  float y;
  for (int x=40; x<=width-40; x+=step) {
    y = 220 + noise(ynoise) * random(50);
    if (lastx > -999) {
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
    ynoise += nlevel;
    wt++;
  }
}

void wiggly2 () {
  strokeWeight(2);
  stroke(0.4, 60-wt*0.015);
  int step = 10;
  float nlevel = 0.1;
  float lastx = -999;
  float lasty = -999;
  float ynoise = random(10);
  float y;
  for (int x=40; x<=width-40; x+=step) {
    y = 60 + noise(ynoise) * random(50);
    if (lastx > -999) {
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
    ynoise += nlevel;
  }
}

void wiggly3 () {
  strokeWeight(2);
  stroke(0.4, 55-wt*0.015);
  int step = 10;
  float nlevel = 0.1;
  float lastx = -999;
  float lasty = -999;
  float ynoise = random(10);
  float y;
  for (int x=40; x<=width-40; x+=step) {
    y = 130 + noise(ynoise) * random(50);
    if (lastx > -999) {
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
    ynoise += nlevel;
  }
} 
void mousePressed() {
  if (mousePressed && mouseButton==LEFT) {
    colorMode(HSB, 1.3);
  }
  if (mousePressed && mouseButton==RIGHT) {
    colorMode(RGB, 2.5);
  }
}

void keyPressed() {

  saveFrame("dream.jpg");
}


