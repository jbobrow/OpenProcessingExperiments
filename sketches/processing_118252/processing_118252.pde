
//20131030 HorusWang
//Noise test 2

void setup() {
  size(300, 300);
  noiseDetail(8, 0.6);
  
}
float akb =0;

void draw() {

  frameRate(30);// refresh times per second
  background(255);
  akb=+0.1;

  for (float x=0;x<=width;x++) {
    for(float y=0;y<=height;y++) {
      stroke(noise(x/300, y/300, akb)*255);
      point(x, y);
    }
  }
}



