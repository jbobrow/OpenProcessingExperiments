
size(400,400);
colorMode(HSB);
int tono = 0;
for(int miY=0; miY < height; miY=miY+1){
  tono = miY%255;
  stroke(tono,255,255);
  line(0,miY,width,miY);
}



