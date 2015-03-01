
/* @pjs preload="PT1.jpg";  */


float [][] kernel= { {0, -1, -0},
                     {-2, 5, 2},
                     {-1, -1, -1}};

void setup (){
size (500, 500);
PImage pt= loadImage ("PT1.jpg");
pt. loadPixels ();
PImage edgeImg= createImage (pt.width, pt.height, RGB);
}

void draw() {
  PImage pt= loadImage ("PT1.jpg");
pt. loadPixels ();
PImage edgeImg= createImage (pt.width, pt.height, RGB);
for (int a=1; a< pt.height-1; a++){
  for (int b=1; b< pt. width-1; b++) {
    float s=0;
    for (int kx =-1; kx<=1; kx++){
      for (int ky=-1; ky<=1; ky++){
        int pos = (b+ky)*height + (a+kx);
        float val = random (blue (pt.pixels [pos]));
        s += kernel[kx+1][ky+1] * val *.3+ random((mouseX+10)*.05, (mouseX+10)*.08);
      }
    }
    color c= color (random (s), random (s,50), random(s,100));
    edgeImg. pixels [b*pt.width+a] =c;
    fill (c);
    float r= s;
    ellipse (250,250, r,r);
  }
}
edgeImg. updatePixels ();
image (edgeImg,0,0);

}

