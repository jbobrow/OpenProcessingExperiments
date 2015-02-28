
int maxImg = 20;

PImage[] imgEyes= new PImage[maxImg];
PImage[] imgLights = new PImage[maxImg];

int imgE = 0;
int imgL = 0;


void setup() {
  size(250,250);
  
  for (int i=0; i < imgEyes.length; i++) {
    imgEyes[i] = loadImage( "eye" + i + ".jpg");
  }
  for (int i=0; i < imgLights.length; i++) {
 imgLights[i] = loadImage("light" + i + ".jpg");
  }
 
}

void draw() {
  
  image(imgEyes[imgE], 0, 0, width/2, height);
  image(imgLights[imgL], 125, 0, width/2, height);
  
}

void mousePressed() {
  imgE = int(random(imgEyes.length));
  imgL = int(random(imgLights.length));
}



