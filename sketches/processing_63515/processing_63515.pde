
class Slice {
  int xini;
  int xSize;
  PImage img;
  PImage imgSlice;      
  float vel;
  float xVel;
  float xPos;
  float sign;
  float seed;
  float iter = 0;
  float t = 100;
     
  Slice(int xiniTemp, int xSizeTemp, PImage imgTemp) {
    xini = xiniTemp;
    xSize = xSizeTemp;
    img = imgTemp;
    imgSlice = createImage(xSize,img.height,ARGB);
    vel = 0;
    xVel = 0;
 
    sign = random(-1,1);
    sign = sign/abs(sign);
    seed = random(0,100);
    xPos = 0.5*(width-img.width) + xini + xVel + sign*noise(seed)*img.width/3;
 
    int p = 0;
    for (int i = 0; i < img.height; i++) {
      for (int j = 0; j < img.width; j++) {
        if((j >= xini) & (j < xini + xSize)){
          imgSlice.pixels[p] = img.pixels[j + i*img.width];
          p +=1;        
        }
      }
    }
  }
   
  void update() {
    xVel+=vel;
    if(t > 50){
      iter+=0.01;
    }
    xPos = 0.5*(width-img.width) + xini + xVel + sign*noise(seed + iter)*img.width/3;
    vel*=0.95;
    t+=1;
  }
     
  void paint() {
    image(imgSlice,xPos,0);
  }
   
  void checkMove() {
    if(t > 50){
      float diff = (xPos + 0.5*xSize) - mouseX;
      if((diff >= 0) & (diff < 0.5*xSize))
      {
        vel = 5;
        t = 0;
      }
      if((diff < 0) & (-diff < 0.5*xSize))
      {
        vel = -5;
        t = 0;
      }
    }
  }
 
}


