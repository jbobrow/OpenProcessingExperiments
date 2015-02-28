
int NX = 600;
int NY = 600;
int N = 100000;
int SCALE = (NY / 10);

void setup(){
  float n, ix, iy;
  float x = 0;
  float y = 0;
  float x1 = 0;
  float y1 = 0;
  float denom;
  
  size(NX, NY);
  background(256, 256, 256);
  
  for(n = 0; n < N; n++){
    if(random(1, 100) > 50){
      x1 = y / sqrt(2) + 1.5;
      y1 = -x / sqrt(2) + 1.5;
    } else {
      x1 = -y / sqrt(2) + 0.5;
      y1 = -x / sqrt(2) + 0.5;
    }
    
    if(random(1, 100) > 50){
      x = x1 - 2;
      y = y1;
    } else {
      denom = (x1 - 2) * (x1 - 2) + y1 * y1;
      x = (x1 - 2)/ denom;
    }
    if(n < 100){
      continue;
    }
    ix = (x + 1.0) * SCALE + NX / 2;
    iy = (y - 0.75) * SCALE + NY / 2;
    
    point(ix, iy);
    
  }
}
