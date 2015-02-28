
void setup(){
  size(480,320,P3D);
  background(0);
  frameRate(30);
//noLoop();
//smooth();
}
void draw(){
  videoSynthRGB(frameCount,0.1);
  
  //videoSynthYUV(frameCount,0.1);
  //saveFrame("synth.####.jpg");
}
void videoSynthRGB(float offset, float speed){
  for(int i=0; i<2;i++){//campos
    for(int j=0; j<height; j+=2){//alto
      for(int k=0; k<width; k++){//ancho
      float phaseMultiplier=(mouseY*10);
      float phaseOffset=mouseX*360/width;  
      float pixelR=128*sin(radians(((offset)*phaseMultiplier+phaseOffset+0)%360))+128;
      float pixelG=128*cos(radians(((offset)*phaseMultiplier+phaseOffset+1)%360))+128;
      float pixelB=128*tan(radians(((offset)*phaseMultiplier+phaseOffset+2)%360))+128;
      color pixelColor= color(pixelR,pixelG,pixelB);
        set(k,j+i,color(pixelColor));
        offset+=phaseOffset+speed;
      }
    }
  }
}

void videoSynthYUV(float offset, float speed){
  for(int i=0; i<2;i++){//campos
    for(int j=0; j<height; j+=2){//alto
      for(int k=0; k<width; k++){//ancho
      float phaseMultiplier=(mouseY*10);
      float phaseOffset=mouseX*360/width;  
      float pixelY=256*sin(radians(((offset)*phaseMultiplier+phaseOffset+0)%360));
      float pixelU=256*cos(radians(((offset)*phaseMultiplier+phaseOffset+1)%360));
      float pixelV=256*tan(radians(((offset)*phaseMultiplier+phaseOffset+2)%360));
      float pixelR=YUVtoR(pixelY,pixelU,pixelV);
      float pixelG=YUVtoG(pixelY,pixelU,pixelV);
      float pixelB=YUVtoB(pixelY,pixelU,pixelV);
      color pixelColor= color(pixelR,pixelG,pixelB);
        set(k,j+i,color(pixelColor));
        offset+=phaseOffset+speed;
      }
    }
  }
}

float YUVtoR(float Y, float U, float V){
  float R=(V/0.877)+Y;
  return R;
}


float YUVtoG(float Y, float U, float V){
  float G=Y/0.587-0.299/0.587*YUVtoR(Y,U,V)-0.114/0.587*YUVtoB(Y,U,V);
  return G;
}


float YUVtoB(float Y, float U, float b){
  float B=U/0.492+Y;
  return B;
}

