
/* @pjs preload="img01.jpg,img02.jpg,img03.jpg"; */
PImage img;
int limit=50;
void setup(){
  size(800,600);
  frameRate(200);
  img=loadImage("img02.jpg");
  
  loadPixels();
  img.loadPixels();
}
void draw(){
  float s=(1-sin((float)frameCount/50))*128;
  for(int i=0;i<width;i++){
    for(int j=0;j<height;j++){
      color col=img.pixels[i+j*width];
      float r=red(col);
      float g=green(col);
      float b=blue(col);
      if(r>g || b>g-limit){
        b=max(b,s);
        r=max(r,s);
      }
      else {
        g=max(g,s);
      }
      pixels[i+j*width]=color(r,g,b);
    }
  }
  updatePixels();
}

