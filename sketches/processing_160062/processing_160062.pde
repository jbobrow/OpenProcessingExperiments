
float[] py = new float[8000];
float[] px = new float[8000];
float[] tm = new float[8000];
float[] vl = new float[8000];
void setup() {
  size(500,500);
  for (int p = 0; p<8000 ; p++) {
    px[p] = random(500);
      py[p] = random(500);
      tm[p] = random(2,10);
       vl[p] = random(0.1,5);
      
  }
}
 void draw(){
   background(255);
     for (int p = 0; p<8000 ; p++) {
     ellipse(px[p],py[p],tm[p],tm[p]);
      px[p] = px[p] + vl[p];
      if(px[p]>width){
      }
  }
}
    
