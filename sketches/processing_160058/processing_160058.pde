
float[] px =new float[8000];
float[] py =new float[8000];

void setup() {
  size(500, 500);
  for (int L = 0; L<8000 ; L++) {
    px[L] =random(500);
    py[L] =random(500);
  }
} void draw(){
  background(255);
  for (int L =0; L<8000 ; L++) {
    point(px[L], py[L]);
    px[L]++;
    if(px[L]>width){
      px[L]=0;
    }
  }
}
