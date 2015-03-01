
/* Pierre MARZIN 07/2014
 */

PImage img;
float ratio;
int deep=7;
int []div=new int[deep];
float []ratio=new float[deep];
float []diaf=new float[deep];
float basehue;

void setup() {
  size(800, 800);
  imageMode(CENTER);
  smooth(8);
  background(0);
  colorMode(HSB,360,255,255);
  img=createImage(50, 50, HSB);
  drawFirefly(color(30, 255, 255), img, 50);
  basehue=random(360);
  randomSeed(second());
  for (int i=0; i<deep; i++) {
      div[i]=2+int(random(8));
      ratio[i]=.2+random(.6);
      diaf[i]=.2+random(.9);
    }
    drawfloc(new PVector(400, 400), img, 100, deep-1,0);
}

void draw() {

  if (frameCount%200==0) {
    //ratio=.5;//1+randomGaussian()/10;
    basehue=random(360);
    for (int i=0; i<deep; i++) {
      div[i]=3+int(random(6));
      ratio[i]=.2+random(.6);
      diaf[i]=.2+random(.9);
    }
    background(0);
    drawfloc(new PVector(400, 400), img, 100, deep-1,0);
  }
}
void drawFirefly(color col, PImage img, float dia) {
  float distance=0; 
  int size=int(dia);
  img.loadPixels();
  for (int j=0; j<size; j++) {
    for (int k=0; k<size; k++) {
      distance=dist(j, k, size/2, size/2);
      if (distance<=size/4) {
        img.pixels[j*size+k]=color(col, map(distance, 0, size/4, 255, 100));
      } else if (distance<=size/2) {
        img.pixels[j*size+k]=color(col, map(distance, size/4, size/2, 100, 0));
      } else img.pixels[j*size+k]=color(0, 0);
    }
  }
  img.updatePixels();
}
void drawfloc(PVector loc, PImage img, float dia, int deep,float angle) {
  tint((7-deep)*15-10, 255, 255, 75+deep*30);//(basehue+deep*32)%360
  //ratio=.5;//.3-.5*randomGaussian()/(20+deep);//noise(5);//

  image(img, loc.x, loc.y, dia, dia);
  deep--;
  if (deep>0) {
    for (float i=0; i<6; i+=TWO_PI/div[deep]) {      
      drawfloc(new PVector(loc.x+(dia*ratio[deep]*(8-deep))*sin(angle+i), loc.y+(dia*ratio[deep]*(8-deep))*cos(angle+i)), img, dia*diaf[deep], deep,i);
    }
  }
}



