
PImage q;
color value;
void setup(){
  size (600,600);
  smooth();
  colorMode (HSB);
  background(0);
  q = loadImage ("face.jpeg");
  int imageSize = q.width*q.height;
  q. loadPixels ();
  float hueCount = 0;
  float SatCount = 0;
  float BriteCount = 0;
  for (int i = 0; i < imageSize; i ++){
    color cp = q.pixels[i];
    float hueNum = hue (cp);
    float SatNum = saturation (cp);
    float BriteNum = brightness (cp);
    hueCount += hueNum;
    SatCount += SatNum;
    BriteCount += BriteNum;
  }
  float avgHue = hueCount/imageSize;
  float avgSat = SatCount/imageSize;
  float avgBrite = BriteCount/imageSize;
  println(avgHue);
  println (avgSat);
  println (avgBrite);
  q.updatePixels ();
  fill(avgHue,avgSat,avgBrite);
  color(avgHue,avgSat,avgBrite);
  rect(0,0,width,height);
}
    
// Click within the image to change 
// the value of the rectangle after
// after the mouse has been clicked
int val = 0;
void draw() {
  fill(val);
  rect(0, 0, width, height);
}

void mousePressed() {
  if(val == color(127,100,134)) {
    val = color(17,136,161);
  } else {
    val = color(127,100,134);
  }
}
  
  

                
                                                
