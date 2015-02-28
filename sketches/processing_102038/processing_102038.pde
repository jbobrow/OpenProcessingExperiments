
void setup() {
  size(700, 700);
  colorMode(HSB, 100);
  noSmooth();
  //noiseDetail(6, .6);
  noiseDetail(4, 0.6);
  frameRate(5);
}

float x, noiseval;

void draw(){
  x += .003;
  loadPixels();
  for(int i = 0; i < height; i++)
   for(int j = 0; j < width; j++){
     noiseval = noise(x, float(j)/width, float(i)/height);
     pixels[(width*i)+j]=color(noiseval*100, 100, /*noise(x+2, (float(j*2)/width)*2, (float(i*2)/height)*2) */ 50);
   }
  updatePixels();
}



