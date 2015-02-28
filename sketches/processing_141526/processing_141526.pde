
int[][] keren = new int[2000][3];
int[] licht = new int[1024];
int[][][] posities = new int[3][2][3];
float[][][] i = new float[3][2][3];
int[][][] keren1 = new int[1300][3][2];
int ix;
int iy;
int iz;

void setup() {
  size(640, 400, P2D);

  for (ix=0;ix<3;ix++) {
    for (iy=0;iy<2;iy++) {
      for (iz=0;iz<3;iz++) {
        posities[iz][iy][ix]=int(random(512));
        i[iz][iy][ix]=random(-3, 3);
      }
    }
  }

  // make sine keren
  for (ix=0;ix<2000;ix++) {
    keren[ix][0]= (int)(100+ (sin(ix*TWO_PI/width)*100));
    keren[ix][1]= (int)(50+  (sin(ix*2*TWO_PI/width)*50));
    keren[ix][2]= (int)(25+  (sin(ix*3*TWO_PI/width)*25));
  }

  // make licht wave
  for (ix=0;ix<1024;ix++) {
    iy=ix;
    while ( (iy>255)||(iy<0)) {
      if (iy>255) iy=511-iy;
      if (iy<0) iy=abs(iy);
    }
    if (iy>201) iy=((iy*4)-(201*3));
    iy=(int)((iy*255)/((255*4)-(201*3)));
    licht[ix]=iy;
  }
}


void draw() {

  // update i
  for (ix=0;ix<3;ix++) {
    for (iy=0;iy<2;iy++) {
      for (iz=0;iz<3;iz++) {
        i[iz][iy][ix]+=random(-0.2, 0.2);
        if (i[iz][iy][ix]>(6-ix)) i[iz][iy][ix]=(6-ix);
        if (i[iz][iy][ix]<(-6+ix)) i[iz][iy][ix]=(-6+ix);
      }
    }
  }

  // update positiesitions
  for (ix=0;ix<3;ix++) {
    for (iy=0;iy<2;iy++) {
      for (iz=0;iz<3;iz++) {
        posities[iz][iy][ix]+=int(i[iz][iy][ix]);
        if (posities[iz][iy][ix]>=width) posities[iz][iy][ix]-=width;
        if (posities[iz][iy][ix]<0) posities[iz][iy][ix]+=width;
      }
    }
  }  

  // make compositiesite keren
  for (ix=0;ix<width;ix++) { 
    for (iy=0;iy<3;iy++) {
      for (iz=0;iz<2;iz++) {
        keren1[ix][iy][iz]= keren[ix+posities[iy][iz][0]][0]  + keren[ix+posities[iy][iz][1]][1] + keren[ix+posities[iy][iz][2]][2];
      }
    }
  }

  //draw pixels
  loadPixels();
  for (iy = 0; iy < height; iy++) {
    int xOff=iy*width;
    for (ix = 0; ix < width; ix++) {      
      pixels[xOff+ix]=(licht[keren1[ix][0][0]+keren1[iy][0][1]]<<16)+(licht[keren1[ix][1][0]+keren1[iy][1][1]]<<8)+licht[keren1[ix][2][0]+keren1[iy][2][1]];
    }
  }
}


