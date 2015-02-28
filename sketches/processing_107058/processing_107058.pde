
float vx,vy,vz;

void setup() {
  size(300, 300,P2D);
  noiseSeed(0);
}
void draw() {
  background(#098EDE);
  for (int x = 0; x<width;x++) {
    for (int y =0;y<height;y++) {
      float c = lerp(100,255,noise(vx,vy,vz));
      vy+=0.01;
      stroke(c,c-60);
      point(x,y);      
    }
    vy =0;
    vx+=0.005;
    vz+=0.003;
  }
}

