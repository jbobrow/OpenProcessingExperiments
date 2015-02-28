
PImage fish1; 
PImage fish2; 
PImage fish3; 
PImage fish4; 
PImage fish5; 
float a = 10;
float b = 0;

void setup () {
  size (600, 600);
  background (255);

  imageMode (CENTER);
  fish1 = loadImage ("fish1.png");
  fish2 = loadImage ("fish2.png");
  fish3 = loadImage ("fish3.png");
  fish4 = loadImage ("fish4.png");
  fish5 = loadImage ("fish5.png");
  a= height/2;
}

void draw () {
  background (255);

  //motion
  float  breath = map (sin (frameCount/15.0 ), -1, 1, 320, 250);
  float  breath2 = map (sin (frameCount/50.0 ), -1, 1, 147, 127);

  float swim = map (sin (frameCount/15.0 ), -1, 1, 350, 250);
  float swim2 = map (sin (frameCount/50.0 ), -1, 1, 500, 350);
  float swim3 = map (sin (frameCount/50.0 ), -1, 1, 500, 200);
  float swim4 = map (sin (frameCount/50.0 ), -1, 1, 200, 300);
  float x= sin (b) *10;
  float y= cos (b) *20;
  image (fish4, swim4+x, swim4+y, 320, 247);

  image (fish2, swim, 50, breath, 146);
  image (fish1, swim*1.5, 200, breath, 100);

  //---------------- dead fish

  a= a-1;
  if (a<0) {
    a= height;
  }
  image (fish5, width/2, a, 250, 89); 
  //---------------- dead fish

  image (fish3, swim3, swim2, 270, breath);  
  b= b+0.1;
  
  
}




