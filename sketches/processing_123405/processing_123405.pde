
/**
// playful color triangles/piramid
*/

///////////////////////////
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////

int devbase = 2;  //baseline deviations (for buttom of triangle)
int devtop = 6;   //deviations for top of triangle 

int width = 500;
int height = 600 + devbase;

int maxdist_hr = 45;  //max width of triagnle
int mindist_hr = 30;
int maxdist_vr = 50;  //max height of triagnle
int mindist_vr = 20;

int vrfloor = maxdist_vr;
int totopline = 5;

color[] col = {#FFD200, #981E32, #62247f, #00A1CB, #F18D05, #0F4155, #288791, #61AE24, #87CD89, #D0D102, #F04132, #FCB123};
color[] colb = {#376160};

void setup() {
  size(width, height);
  background(255);
  playful_trianles();
}

void draw() {}

void mousePressed() {
  playful_trianles();
}

void playful_trianles() {

  //fill(0);
  background(colb[(int)random(colb.length)]);
  
  maxdist_vr = vrfloor;
  
  int  topline = totopline;

  float leftangleX = 0;
  float leftangleY = maxdist_vr + random(-devbase, devbase);
  float rightangleX = random(mindist_hr, maxdist_hr);
  float rightangleY = maxdist_vr + random(-devbase, devbase);

  float taXmin = (rightangleX-leftangleX)/devtop;
  float taXmax = rightangleX - (rightangleX-leftangleX)/devtop;
  float topangleX = random(taXmin, taXmax);
  float topangleY = random(topline, topline+mindist_vr);


  for (;topangleY<height; ) {
    for (;leftangleX<width; ) {
      fill(col[(int)random(col.length)]);
      //stroke(col[(int)random(col.length)]);
      noStroke();
      triangle( leftangleX, leftangleY, 
      rightangleX, rightangleY, 
      topangleX, topangleY);

      leftangleX = rightangleX;
      leftangleY = rightangleY;

      rightangleX += random(mindist_hr, maxdist_hr);
      rightangleY = maxdist_vr + random(-devbase, devbase);

      taXmin = leftangleX + (rightangleX-leftangleX)/devtop;
      taXmax = rightangleX - (rightangleX-leftangleX)/devtop;
      topangleX = random(taXmin, taXmax);
      topangleY = random(topline, topline+mindist_vr);
    }

    topline += vrfloor;
    maxdist_vr += vrfloor;

    leftangleX = 0;
    leftangleY = maxdist_vr + random(-devbase, devbase);
    rightangleX = random(mindist_hr, maxdist_hr);
    rightangleY = maxdist_vr + random(-devbase, devbase);

    taXmin = leftangleX + (rightangleX-leftangleX)/devtop;
    taXmax = rightangleX - (rightangleX-leftangleX)/devtop;
    topangleX = random(taXmin, taXmax);
    topangleY = random(topline, topline+mindist_vr);
  }
}

