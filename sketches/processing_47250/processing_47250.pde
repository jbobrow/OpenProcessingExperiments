
PImage cat;
void setup(){
  cat = loadImage("cat2.bmp");
  int imageSize = cat.width*cat.height;
  cat.loadPixels():
  float hueCount = 0;
  for(int i = 0; i< imgSize; i ++){
    color cp = cat. pixels[i];
    float hueNum = hue(cp);
    hueCount += hueNum;
  }
  float avgHue = hueCount/imgSize;
  println(avgHue);
  cat.updatePixels();
  fill(avg....);
  rect(...);
}
              
                                
