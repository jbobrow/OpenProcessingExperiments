

PImage img1;
PImage img2;

void setup() {
  size(512,512);
  img1 = loadImage("lena.bmp");
  img2 = loadImage("lena2.jpg");
}

void draw() {
  
  img1.loadPixels();
  
  loadPixels();
  for(int x=0; x<width; x++) {
    for(int y=0; y<height; y++) {
      int nX1 = x+int(random(-(width-mouseX), (width-mouseX)));
      int nY1 = y+int(random(-(width-mouseX), (width-mouseX)));
      int nX2 = x+int(random(-mouseX, mouseX));
      int nY2 = y+int(random(-mouseX, mouseX));
      if(nX1>=width) nX1-=width;
      if(nY1>=width) nY1-=height;
      if(nX1<0) nX1+=width;
      if(nY1<0) nY1+=height;
      if(nX2>=width) nX2-=width;
      if(nY2>=width) nY2-=height;
      if(nX2<0) nX2+=width;
      if(nY2<0) nY2+=height;
//      pixels[x+y*width]=img1.pixels[nX1+nY1*width];
//      pixels[x+y*width]=img1.pixels[nX1+nY1*width];
//      pixels[x+y*width]=color(    (red(img1.pixels[nX1+nY1*width])+red(img2.pixels[nX2+nY2*width]))/2,
//                                  (green(img1.pixels[nX1+nY1*width])+green(img2.pixels[nX2+nY2*width]))/2,
//                                  (blue(img1.pixels[nX1+nY1*width])+blue(img2.pixels[nX2+nY2*width]))/2
      
//                              );
      pixels[x+y*width]=color(    (red(img1.pixels[nX1+nY1*width])*mouseX/width+red(img2.pixels[nX2+nY2*width])*(width-mouseX)/width),
                                  (green(img1.pixels[nX1+nY1*width])*mouseX/width+green(img2.pixels[nX2+nY2*width])*(width-mouseX)/width),
                                  (blue(img1.pixels[nX1+nY1*width])*mouseX/width+blue(img2.pixels[nX2+nY2*width])*(width-mouseX)/width)
      
                              );
      
    }
  }
  updatePixels();
  
}

