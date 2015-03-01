
import java.util.Random;
Random generator;
float noiseFactor=0.2;

void setup(){
  size(640,360);
  generator = new Random();
  background(255);
  colorMode(HSB);
}

void draw() {
  noStroke();
  //stroke(0,0,0);
  //strokeWeight(noise(noiseFactor)*4);
  //line(pmouseX,pmouseY,mouseX,mouseY);
  noiseFactor+=0.1;
  if(mousePressed){
  }
}

void mousePressed(){
  int rad = int(random(10,30));
   fill(random(255),255,255);
  pushMatrix();
  translate(mouseX,mouseY);
  beginShape();
  float sdx = rad/2;
  for(float i = 0; i < 360; i+=0.1){
    float num = (float) generator.nextGaussian();
    float x = abs(sdx * num);
    vertex(-(x+rad)*cos(i),(x+rad)*sin(i));
  }
  endShape(CLOSE);
  popMatrix();
}
