
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/51571*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

// thanks to Javier Graciá Carpio - http://www.openprocessing.org/user/16300
// for sharing

// Photo slices" by Javier Graciá Carpio, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
// Work: http://openprocessing.org/visuals/?visualID= 51571  
// License: 
// http://creativecommons.org/licenses/by-sa/3.0/
// http://creativecommons.org/licenses/GPL/2.0/

int maxSlices = 256; 
Slice[] slice = new Slice[maxSlices];
int n = 16;
float step = 2;
PImage img;       

void setup() {
  smooth();  
  background(0);
  // Picture from Luc Dall'Armellina 
  img = loadImage("http://lucdall.free.fr/voeux/danseuse.jpg"); 
  // size(img.width + 2*img.width/3, img.height); 
  // modification of the line above for web browsers :
  size(800,600); 
  for (int i = 0; i < n; i++) {
    slice[i] = new Slice(int(i*img.width/n),int(img.width/n),img);
  }
  // println(width);
  // println(height);
}

void draw() {
  fill(0);
  rect(0,0,width,height);

  for (int i = 0; i < n; i++) {
    slice[i].update();
    slice[i].checkMove();
    slice[i].paint();
  }
}

void mousePressed() {
  //save("pic.jpg");
  n = int(n*step);
  if(n > maxSlices | n < 4){
    step = 1/step;
    n = int(n*step*step);
  } 
  for (int i = 0; i < n; i++) {
    slice[i] = new Slice(int(i*img.width/n),int(img.width/n),img);
  }
}


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


