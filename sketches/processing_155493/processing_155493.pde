

void setup() {
  size(400, 400);
  colorMode(HSB,360,255,255);
  smooth(8);
  loadPixels();
  for(int i=0;i<width;i++){
    for(int j=0;j<height;j++){
      int loc=j*width+i;
      float distance=dist(i,j,width/2,height/2);
      //if(distance<width/2){
        float angle=atan2(height/2-j,width/2-i)+sin(distance/150);
        angle*=5;
        float c=320+map(cos(angle),-1,1,-40,70);
        pixels[loc]=color(c%360,255,255);
      //}
    }
  }
  updatePixels();
}
void draw() {
  background(0);
  loadPixels();
  for(int i=0;i<width;i++){
    for(int j=0;j<height;j++){
      int loc=j*width+i;
      float cf=cos(frameCount/15);
      float distance=dist(i,j,width/2,height/2);
        float angle=atan2(height/2-j,width/2-i)+sin(distance/(1+mouseX/10))*cf;
        angle*=5;
        float c=320+map(cos(angle+mouseY/10),-1,1,abs(cf)*360-40,abs(cf)*360+70);
        pixels[loc]=color(c%360,255,255);
    }
  }
  updatePixels();
 
}



