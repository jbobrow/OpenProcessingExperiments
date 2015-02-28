

void setup() {
  size(512, 160); 
  frameRate(8);
  noStroke();
  
  background(0);
}
 
void draw() {
  fill(0,50);
  rect(0,0,width,height);
  
  fill(255,0,0);
   
  for(int x=0; x < width; x += 3) {
    for(int y=0; y < height; y += 3) {
      int n = noise(x/50f + frameCount/25f,y/50f,frameCount/100f)*255;
      if(n > 128) {
        rect(x,y,10,10);
      }
    }
  }
}
