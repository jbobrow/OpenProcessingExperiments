
float[] py = new float[8000];
float[] px = new float[8000];
void setup() {
  size(500,500);
  for (int p = 0; p<8000 ; p++) {
    px[p] = random(500);
      py[p] = random(500);
      
  }
}
 void draw(){
   background(255);
     for (int p = 0; p<8000 ; p++) {
     point(px[p],py[p]);
      px[p]++;
      if(px[p]>width){
      }
  }
}
    
