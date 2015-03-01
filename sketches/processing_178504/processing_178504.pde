
PVector array[][][];
PImage img;
int arrayNum;
int density;

void setup() {
  density=8;
  arrayNum=600/density;

  size(600, 600, P3D);
  img = loadImage("test.jpg");//use 600*600 image
  img.loadPixels();
  smooth();

  array = new PVector[arrayNum][arrayNum][2];

  for (int ix=0; ix<arrayNum; ix=ix+1) {
    for (int iy=0; iy<arrayNum; iy=iy+1) {
      array[ix][iy][0]= new PVector(ix*2, iy*2, blue(img.pixels[(iy*width+ix)*density]));
      array[ix][iy][1]=new PVector(0, 0, 5);
    }
  }
}

void draw() {
  background(0, 0, 15);

  rotateX(radians(map(mouseX,0,600,0,60)));
  translate(width/4, height/4);
  translate(0, mouseY/2);
  scale(2);
  stroke(255, 50);
  strokeWeight(0.2); 
  point(0, 0, 0);
  // beginShape();
  for (int ix=0; ix<arrayNum; ix=ix+1) {
    for (int iy=0; iy<arrayNum; iy=iy+1) {
      pushMatrix();
      translate(array[ix][iy][0].x, array[ix][iy][0].y, array[ix][iy][0].z/10);
      box(array[ix][iy][1].z);
      popMatrix();
      if (array[ix][iy][0].z<5) {
        fill(20, 20, 105, 30);
        array[ix][iy][1].z=array[ix][iy][1].z+random(0, 0.3);

        //        if (mouseX/4-ix<4 && mouseX/4-ix>-4) {
        //          if (mouseY/4-iy<4 && mouseY/4-iy>-4) {
        //            array[ix][iy][1].z=1;
        //          } else {
        //            box(array[ix][iy][1].z);
        //          }
        //        } else {
        //          box(array[ix][iy][1].z);
        //        }
        //        popMatrix();
        //      } else {
        //      }
        //    }
        //  }
      } else {
        fill(255, 30);
      }
    }
  }
}

