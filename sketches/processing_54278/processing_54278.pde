
PImage face;

void setup() {
  size (200, 200);
  face = loadImage("face.jpg");
  //randomPixels();
  //linePixels();
}
void draw(){
  imagePixels();

}

void randomPixels() {
  loadPixels();
  for (int i=0; i<pixels.length;i++) {
    float rand = random(255);
    color c = color (rand);
    pixels[i] = c;
  }
  updatePixels();
}

void linePixels(){
  loadPixels();
  for(int x=0; x<width; x++){
    for (int y=0;y<height;y++){
      int loc = x+y*width;
      if(x%2 == 0){
        pixels[loc]=color(255);
      }else{
        pixels[loc]=color(0);
      }
    }
  }
  updatePixels();
}

void imagePixels(){
  loadPixels();
  face.loadPixels();
  for (int y=0;y<height;y++){
    for(int x=0;x<width;x++){
      int loc = x+y*width;
      float r = red (face.pixels[loc]);
      float g = green (face.pixels [loc]);
      float b = blue (face.pixels[loc]);
      pixels[loc]=color(r,g,b);
    }
  }
  updatePixels();
}               
