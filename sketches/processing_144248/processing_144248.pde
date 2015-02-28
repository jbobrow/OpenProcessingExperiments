
/////////////////////////// //<>//
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Don't use without permission
//
// Based on:
// #411 Monument scribble
// http://geometrydaily.tumblr.com/post/47107135240/411-monument-scribble-a-new-minimal-geometric

// Controls:
// MouseClick  - redraw 
//
// Keys:
// Q    - remove
// W    - add
// A    - on/off stroke
//
/////////////////////////////////////////////////

int sz = 700;
int brdr = 200;
float [] Xcoord = new float [2];
float [] Ycoord = new float [2];
boolean strk = true;
int amountL = 14;
float hgt;

void setup() {
  size(sz, sz);
  noLoop();
}

void draw() {
  background(235);
  paper(35);
  if(strk){ noStroke(); } else { stroke(0,100); }
  Scrib(170);
  paper(15);
}

void mousePressed() {
  redraw();
}

void keyPressed() {
  if (key == 'q') {
    amountL-=2;
  }
  if (key == 'w') {
    amountL+=2;
  }
  if (key == 'a') {
    strk = !strk;
  }
  
  amountL = constrain(amountL, 6, 30);
  redraw();
}

void paper(int in_val) {
  noStroke();
  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(235-40, 235+30), in_val);
      rect(i, j, 2, 2);
    }
  }

  for (int i = 0; i<30; i++) {
    fill(random(60, 170), random(in_val*2.5, in_val*3));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}

void Scrib(int in_val) {
  Xcoord[0] = in_val;
  Xcoord[1] = sz-Xcoord[0];
  hgt = ((sz-brdr)/(amountL-1));
  hgt = constrain(hgt, 18, sz/10);

  float YY=0, YY2=0;
  fill(#2f301e);

  Ycoord[0] =Xcoord[0]/2;
  Ycoord[1]= Ycoord[0]+hgt;

  for (int i =0; i<= amountL; ++i) {
    if (i==0) {
      rect(Xcoord[0], Ycoord[0], Xcoord[1] - Xcoord[0], hgt);
      Ycoord[(i+1)%2] += hgt*.5;
      YY = random(-hgt/4, +hgt/3);
    } else {
      Ycoord[(i+1)%2] += hgt*1.5;
      YY = random(-hgt/4, +hgt/3);
    }

    if (i != amountL) {
      quad(Xcoord[i%2], Ycoord[i%2] +YY2, Xcoord[i%2], Ycoord[i%2]+hgt +YY2, Xcoord[(i+1)%2], Ycoord[(i+1)%2] + hgt +YY, Xcoord[(i+1)%2], Ycoord[(i+1)%2] + YY);
    }

    YY2 = YY;

    if (i == amountL-1) {
      Ycoord[(i+1)%2] += hgt*1.5;
      YY = random(-hgt/4, +hgt/3);
      quad(Xcoord[(i+1)%2], Ycoord[i%2] +YY2, Xcoord[(i+1)%2], Ycoord[i%2]+hgt +YY2, Xcoord[(i)%2], sz-brdr + hgt*2, Xcoord[(i)%2], sz-brdr + hgt );
      quad(Xcoord[(i)%2], sz-brdr + hgt*2, Xcoord[(i)%2], sz-brdr + hgt, Xcoord[(i+1)%2], sz-brdr + hgt, Xcoord[(i+1)%2], sz-brdr + hgt*2);
    }
  }
}
