
PImage tri;

void setup(){
  size(490,600);
  colorMode(HSB, 360,100,100);
  tri = loadImage ("tri.jpg");
  photoFilter();
}
void draw(){
  
}

void photoFilter (){
  tri.loadPixels();
  int triSize = tri.width * tri.height;
  for(int i=0; i<triSize; i++){
    color cp = tri.pixels [i];
    float h = hue(cp);
    float s = saturation(cp);
    float b = brightness (cp);
    if (b > 50){
      s = 100;
    }
      tri.pixels[i] = color (h,s,b);
    }
      tri.updatePixels();
      image(tri,0,0);
}
    

