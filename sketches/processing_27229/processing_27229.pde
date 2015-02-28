
// Orbitals, variation B
// j.tarbell August, 2004
// Albuquerque, New Mexico
// complexification.net
// adapted from http://www.complexification.net/gallery/machines/orbitals/indexB.php
// adapted by Rupert Russell

// Processing 0085 Beta syntax update
// j.tarbell   April, 2005

int dim=250;
int num=73;

Orbital[] orbitals;

int maxpal = 512;
int numpal = 0;
color[] goodcolor = new color[maxpal];

void setup() {
  size(250,250,P3D);
//  size(dim,dim,P3D);
  takecolor("pallet4.gif");
  background(255);
  noFill();
  frameRate(30);
  orbitals = new Orbital[num];

  resetAll();
}
 
void draw() {
  // k loop is accelerator
  for (int k=0;k<20;k++) {
    // orbit all orbitals
    for (int n=0;n<num;n++) {
      orbitals[n].orbit();
    }
    // draw all orbitals
    for (int n=0;n<num;n++) {
      orbitals[n].draw();
    }
  }
}
 
void mousePressed() {
  resetAll();
  background(255);
}
 
void resetAll() {
  // make orbitals
  for (int n=0;n<num;n++) {
    // pick orbit origin node
    int npid = n;
    if (n>num*0.1) {
      npid = int(random(n));
    }
    orbitals[n] = new Orbital(n,npid);
    if (n==npid) {
      orbitals[n].setPosition(dim/2,dim/2);
    }
  }
}


// OBJECTS ---------------------------------------------------------------------
   
class Orbital 
{
  int id;
  int pid;
  float r;
  float t;  
  float tv, tvd;
  float x,y;
  int d;
  color myc;
 
  Orbital(int Id, int Pid) {
    id=Id;
    pid=Pid;
    if (id!=pid) {
      // calculate depth
      d=orbitals[pid].d+1;
      // radius inversely proportional to depth
      r=random(1,1+0.4*dim/d);
      // angle theta
      t=-HALF_PI;
      // theta velocity
      tv=random(0.0001,0.02/(d+1));
      if (random(100)<50) tv*=-1;
      // theta differential
      tvd=random(1.001,1.010);
    } else {
      // is central node
      r = 0; 
    }
    // choose arbitrary color
    myc = somecolor();
  }

  void setPosition(float X, float Y) {
    x = X;
    y = Y;
  }
 
  void orbit() {
    t+=tv;
    x = orbitals[pid].x+r*cos(t);
    y = orbitals[pid].y+r*sin(t);
    
    // heehehe
    tv*=0.99942;    // slow down time
//    r*=1.00022;    // decrease orbits
  }
  
  void draw() {
    // fuzz
    float fzx = random(-0.22,0.22);
    float fzy = random(-0.22,0.22);
    
    // draw translucent pixel
    stroke(red(myc),green(myc),blue(myc),42);
    point(x+fzx,y+fzy);
    
    if (sumtv()<1.00001) {
      // draw orbit path
      float o = random(TWO_PI);
      fzx = orbitals[pid].x+r*cos(o);
      fzy = orbitals[pid].y+r*sin(o);
      stroke(red(myc),green(myc),blue(myc),18);
      point(fzx,fzy);
    
      // draw parent line
      o = random(1.0);
      fzx = x+o*(orbitals[pid].x-x);
      fzy = y+o*(orbitals[pid].y-y);
      stroke(0,18);
      point(fzx,fzy);
    }
  }
  
  float sumtv() {
    if (pid!=id) {
      return (orbitals[pid].sumtv() + tv);
    } else {
      return tv+1;
    }
  }
}


// COLOR ROUTINES -----------------------------------------------------------

color somecolor() {
  // pick some random good color
  return goodcolor[int(random(numpal))];
}

void takecolor(String fn) {
  PImage b;
  b = loadImage(fn);
  image(b,0,0);

  for (int x=0;x<b.width;x++){
    for (int y=0;y<b.height;y++) {
      color c = get(x,y);
      boolean exists = false;
      for (int n=0;n<numpal;n++) {
        if (c==goodcolor[n]) {
          exists = true;
          break;
        }
      }
      if (!exists) {
        // add color to pal
        if (numpal<maxpal) {
          goodcolor[numpal] = c;
          numpal++;
        } else {
          break;
        }
      }
      if (random(10000)<100) {
        if (numpal<maxpal) {
          // pump black or white into palette
          if (random(100)<50) {
            goodcolor[numpal] = #FFFFFF;
            print("w");
          } else {
            goodcolor[numpal] = #000000;
            print("b");
          }
          numpal++;
        }
      }
    }
  }
  

}

// j.tarbell August, 2004
// Albuquerque, New Mexico
// complexification.net


