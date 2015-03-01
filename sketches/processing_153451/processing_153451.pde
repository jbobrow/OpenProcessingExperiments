
/* @pjs preload="1.jpg, 2.jpg, 3.jpg, 4.jpg"; */

int selected;
PImage[] imageX;
void setup () {
  selected = 0;
  imageX = new PImage[4];
  imageX[0] = loadImage("1.jpg");
  imageX[1] = loadImage("2.jpg");
  imageX[2] = loadImage("3.jpg");
  imageX[3] = loadImage("4.jpg");
  size(1200, 800);
  colorMode(HSB, 255);
  noLoop();
}

void draw () {
  //"http://lorempixel.com/450/700/";  loading this works offline and will get a random image of size 450x700
  int maxHue = 0;
  background(0, 0, 0);
  int[] hues = new int[256];
  float[] satAtHues = new float[256];
  float[] valAtHues = new float[256];
  
  for(int x = 0; x<imageX[selected].width; x++){
   for(int y = 0; y<imageX[selected].height; y++){
    color c = imageX[selected].pixels[x+y*imageX[selected].width];
    hues[(int)(hue(c))]++;
    satAtHues[(int)(hue(c))]+=saturation(c);
    valAtHues[(int)(hue(c))]+=brightness(c);
   } 
  }

  for(int i = 0; i<255; i++){
    if(hues[i]!=0){
      satAtHues[i]/=hues[i];
      valAtHues[i]/=hues[i];
    }
    if(hues[maxHue]<hues[i]){
      maxHue = i;
    }
  }

  for(int i = 0; i<255; i++){
    float place = 50+600*(i/256.0);
    stroke(i, satAtHues[i], valAtHues[i]);
    line(place, 750, place, 750-700*(hues[i]/((float)hues[maxHue])));
  }
  
  image(imageX[selected], 700, 50);
}

void mousePressed () {
  selected++;
  if(selected>3){
   selected = 0; 
  }
  redraw();
}


