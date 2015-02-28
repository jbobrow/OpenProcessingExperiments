
PShape bud;
PShape bloom;
PShape pink;
PShape sun;
PImage grass;


float x, y;


void setup () {
  size (640, 480); 
  smooth();
  noCursor();
  background (137, 232, 244);
  grass = loadImage ("grassyhill.png");
  pink = loadShape ("pinkflower.svg");
  bloom = loadShape ("bloom.svg");
  bud = loadShape ("bud.svg");
  sun = loadShape ("sunandclouds.svg");
  image (grass, 0, 0);
  shape (sun, 380, 50);

}



void draw () {

}



//FLOWERS

void mouseMoved (){

  if (mouseX > 128){
    if (mouseX < 256){
      background (137, 232, 244);
      image (grass, 0, 0);
      shape (sun, 380, 50);
      float v = 0;
      float inc = 10;
      noiseSeed(0);
      for (int i = 2; i < width; i = i+7) {
        float n = noise(v) * 150.0;
        shape (bud, i, 230 + n); 
        v = v + inc;
      }
    }
  }
  if (mouseX > 256) {
    if (mouseX < 384){
      background (137, 232, 244);
      image (grass, 0, 0);
      shape (sun, 380, 50);
      float vv = 0;
      float inc2 = 10;
      noiseSeed(0);
      for (int i = 2; i < width; i = i+7) {
        float n = noise(vv) * 150.0;
        shape (bloom, i, 240 + n); 
        vv = vv + inc2;
      }
    }
  }
  if (mouseX > 384) {
    if (mouseX < 640){
      background (137, 232, 244);
      image (grass, 0, 0);
      shape (sun, 380, 50);
      float vvv = 0;
      float inc3 = 10;
      noiseSeed(0);
      for (int i = 2; i < width; i = i+7) {
        float n = noise(vvv) * 150.0;
        shape (pink, i, 180 + n); 
        vvv = vvv + inc3;
      }
    }
  }
}























