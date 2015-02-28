
// PLASMA - Will Birtchnel 2010

int[][] waves = new int[2000][3]; // sine waves
int[] luma = new int[1024]; // brightness curve
int[][][] pos = new int[3][2][3]; // positions RGB,XY,123
float[][][] velocity = new float[3][2][3]; // velocity RGB,XY,123
int[][][] cWaves = new int[1300][3][2]; // pos,RGB,XY

int ix;int iy;int iz;

void setup() { 
  size(640,400,P2D);
  
  // randomize positions
  for (ix=0;ix<3;ix++){
    for (iy=0;iy<2;iy++){
      for(iz=0;iz<3;iz++){
        pos[iz][iy][ix]=int(random(512));
        velocity[iz][iy][ix]=random(-3,3); 
      }
    }
  }
  
  // make sine waves
  for (ix=0;ix<2000;ix++){
    waves[ix][0]= (int)(100+ (sin(ix*TWO_PI/width)*100));
    waves[ix][1]= (int)(50+  (sin(ix*2*TWO_PI/width)*50));
    waves[ix][2]= (int)(25+  (sin(ix*3*TWO_PI/width)*25));
  }
  
  // make luma wave
  for (ix=0;ix<1024;ix++){
   iy=ix;
   while((iy>255)||(iy<0)){
     if (iy>255) iy=511-iy;
     if (iy<0) iy=abs(iy); 
   }
   if (iy>201) iy=((iy*4)-(201*3));
   iy=(int)((iy*255)/((255*4)-(201*3)));
   luma[ix]=iy;
  }
}


void draw() {
  
  // update velocity
  for (ix=0;ix<3;ix++){
    for (iy=0;iy<2;iy++){
      for(iz=0;iz<3;iz++){
          velocity[iz][iy][ix]+=random(-0.2,0.2); 
          if (velocity[iz][iy][ix]>(6-ix)) velocity[iz][iy][ix]=(6-ix);
          if (velocity[iz][iy][ix]<(-6+ix)) velocity[iz][iy][ix]=(-6+ix);
      }
    }
  } 
  
  // update positions
  for (ix=0;ix<3;ix++){
    for (iy=0;iy<2;iy++){
      for(iz=0;iz<3;iz++){
        pos[iz][iy][ix]+=int(velocity[iz][iy][ix]); 
        if (pos[iz][iy][ix]>=width) pos[iz][iy][ix]-=width;
        if (pos[iz][iy][ix]<0) pos[iz][iy][ix]+=width;
      }
    }
  }   
 
  // make composite waves
  for(ix=0;ix<width;ix++){  
    for (iy=0;iy<3;iy++){
      for(iz=0;iz<2;iz++){
        cWaves[ix][iy][iz]= waves[ix+pos[iy][iz][0]][0]  + waves[ix+pos[iy][iz][1]][1] + waves[ix+pos[iy][iz][2]][2];
      }
    }
  }
  
  //draw pixels
  loadPixels();
  for(iy = 0; iy < height; iy++) {
    int xOff=iy*width;
    for(ix = 0; ix < width; ix++) {       
      pixels[xOff+ix]=(luma[cWaves[ix][0][0]+cWaves[iy][0][1]]<<16)+(luma[cWaves[ix][1][0]+cWaves[iy][1][1]]<<8)+luma[cWaves[ix][2][0]+cWaves[iy][2][1]];
    }
  }
}




