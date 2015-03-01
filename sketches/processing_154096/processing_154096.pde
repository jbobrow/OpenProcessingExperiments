
/* Pierre MARZIN 07/2014
 */


float ratio;
int deep=7;
PImage[] imgs=new PImage[deep];
int []div=new int[deep];
float []ratio=new float[deep];
float []diaf=new float[deep];
float basehue;

void setup() {
  size(800, 800);
  imageMode(CENTER);
  smooth(8);
  background(0);
  colorMode(HSB, 360, 255, 255);
  basehue=random(20);
  randomSeed(second());
  for (int i=0; i<deep; i++) {
    imgs[i]=createImage(50, 50, HSB);
  }
}

void draw() {

  if (frameCount%200==0) {    
    basehue=random(20);
    for (int i=0; i<deep; i++) {
      div[i]=3+int(random(6));
      ratio[i]=.2+random(.6);
      diaf[i]=.2+random(.9);
      drawFirefly(color(30, 255, 255), imgs[i], 50);
    }
    background(0);
    drawfloc(new PVector(400, 400), 100, deep-1, 0);
  }
}
void drawFirefly(color col, PImage img, float dia) {
  float distance=0; 

  //img.resize(dia*10,dia*10);
  //int size=int(dia*10);
  int mode=int(random(6));
  int size=int(dia);
  img.loadPixels();
  for (int j=0; j<size; j++) {
    for (int k=0; k<size; k++) {
      distance=dist(j, k, size/2, size/2);
      if (distance<=size/2) {
        switch(mode) {
        case 0:
          img.pixels[j*size+k]=color(map(distance, 0, size/2, 0, 100), map(distance, 0, size/2, 255, 100), 255, map(sin(distance/2+atan2(j-size/2, k-size/2)), -1, 1, 400-distance*15, 0));
          break;
        case 1:
          img.pixels[j*size+k]=color(col, map(distance, 0, size/2, 255, 0));
          break;
        case 2:
          img.pixels[j*size+k]=color(col, map(sin(5*atan2(j-size/2, k-size/2)), -1, 1, 255-distance*15, 0));
          break;
        case 3:
          img.pixels[j*size+k]=color(col, map(sin(distance/2), -1, 1, 255, 0)-map(sin(5*atan2(j-size/2, k-size/2)), -1, 1, 128, 0));
          break;
        case 4:
          img.pixels[j*size+k]=color(col, map(sin(3*atan2(j-size/2, k-size/2)), -1, 1, 255-distance*15, 0));
          break;
        case 5:
          img.pixels[j*size+k]=color(col, map(sin(atan2(j, k)), -1, 1, 400-distance*8, 0));
          break;
        }
      } else img.pixels[j*size+k]=color(0, 0);
    }
  }
  img.updatePixels();
  //img.resize(dia,dia);
}
void drawfloc(PVector loc, float dia, int deepn, float angle) {
  tint(basehue+(7-deepn)*15, 255, 255, 75+deepn*30);//(basehue+deep*32)%360
  //ratio=.5;//.3-.5*randomGaussian()/(20+deep);//noise(5);//

  image(imgs[deepn], loc.x, loc.y, dia, dia);
  deepn--;
  if (deepn>0) {
    for (float i=0; i<6; i+=TWO_PI/div[deepn]) {      
      drawfloc(new PVector(loc.x+(dia*ratio[deepn]*(8-deepn))*sin(angle+i), loc.y+(dia*ratio[deepn]*(8-deepn))*cos(angle+i)), dia*diaf[deepn], deepn, i);
    }
  }
}



