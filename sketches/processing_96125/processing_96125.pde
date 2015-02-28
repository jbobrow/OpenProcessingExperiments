
void generateImage() {
  generateImage(null);
}

void generateImage(PImage theImage) {
  if(theImage == null) {
  img = createGraphics(w,h,P2D);
  }
  img.beginDraw();
  
  float noiseScale=0.1;
  for( int x = 0; x< w; x++) {
    for( int y = 0; y < h; y++) {
       noiseDetail(8,0.25);
      float noiseVal = noise((frameCount*0.1+x)*noiseScale, (frameCount*0.1+y)*noiseScale);
      img.stroke(noiseVal*255);
      img.point(x,y);
    }
  }
  img.endDraw();
  w = img.width;
  h = img.height;
}


