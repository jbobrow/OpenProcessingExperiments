
import netscape.javascript.*;
PImage[] pix;
int frames = 3;
int totalFrames = 60;
int totalPix = floor(totalFrames/frames);
float factor;


void setup() {
  size(640, 480); // Change size to 320 x 240 if too slow at 640 x 480

  noStroke();
  smooth();
  factor = 0.05;
  
String iniName = "video_";
    pix = new PImage[totalPix];
    for(int i=0;i<totalPix;i++){
    String name;
    if(i<10){
      name = iniName + "0" + i+".jpg";
    }else if(i<100){
      name = iniName + i+".jpg";
    }else{
      name = iniName + i+".jpg";
    }
      pix[i] = loadImage(name);
    }
    
    
    
  
}

void draw() {

  int cuadro;

  for(int i=0;i<width;i++){
    for(int j=0;j<height;j++){
      if(mouseY>0){
        cuadro=int(linea(j,0,mouseY,mouseY * factor,0));
        if (cuadro < 0) {
          cuadro = 0;
        }else {
          cuadro = cuadro;
        }
        cuadro = (cuadro < 0 ? 0 : cuadro);
        
        if (cuadro >= totalPix) {
          cuadro = totalPix-1;
        }else {
          cuadro = cuadro;
        }
        
      }else{
        cuadro = 0;
      }
      set(i,j,pix[cuadro].pixels[i+j*width]);
      //set(x, y, color)

    }
  }
    

}


float linea(float x, float x1, float x2, float y1, float y2){
  return (x-x1)/(x2-x1)*(y2-y1) + y1;
}

