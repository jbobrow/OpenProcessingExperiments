

int r, g, b;
PImage img;
int[] colors;
int count;
color pix;

void setup(){
  size(400, 400);
  noStroke();
  background(0);
  img = loadImage("eye.jpg");
  colors = new int[img.width * img.height];
  makeTartan();

}

void resetColour(){
  int x = int(random(img.width * img.height));
  pix = color(red(img.pixels[x]), green(img.pixels[x]), blue(img.pixels[x]), 50);
  
}

void makeTartan(){
  for(int i = 1; i < 20; i++ ){
    resetColour();
    genStripes(5, 10);
  }
}

void genStripes(int maxW, int f){
  
  for(int i = 1; i < f; i++){
  fill(pix);
  rect(int(random(width)), 0, int(maxW), height);
  }
  for(int i = 1; i < f; i++){
  fill(pix);
  rect(0, int(random(height)), width, int(maxW));
  }
}

void draw(){
}

void mouseClicked(){
   background(0);
   makeTartan();
}



