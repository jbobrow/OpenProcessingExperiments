
import java.util.Random;
Random generator;
Random generator2;

void setup(){
  size(640,360);
  generator = new Random();
  generator2 = new Random();
  background(0);
}

void draw() {
  noStroke();
  for(int i = 0; i < 10000; i++){
  float num = (float) generator.nextGaussian();
  float num2 = (float) generator2.nextGaussian();
  float sdx = 100;
  float meanX = mouseX;
  float meanY = mouseY;
  float sdy = 100;
  float x = sdx * num + meanX;
  float y = sdy * num2 + meanY;
  float alph = map(dist(meanX,meanY,x,y),0,250,6,0);
  fill(map(num,-1,1,0,255),map(num2,-1,1,0,255),255,alph);
  rect(x,y,2,2);
  }
}

void mousePressed(){
}
