
float t1 = 0.0;
float t2 = 10000;
void setup(){
  size(600,300);
    loadPixels();

}

void draw(){
  float xx=t1;
  for(int i = 0; i<width; i++){
    float yy=t2;
    for(int j = 0; j<height; j++){
      float bright = map(noise(xx,yy,t2),0,1,0,255);
      pixels[i + j *width] = color(bright); 
      yy += 0.008;

    }
    xx += 0.008;

  }
  t1 +=0.02;
  t2 +=0.01;
  updatePixels();
}
