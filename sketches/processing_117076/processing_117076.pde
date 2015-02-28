
import java.util.Random;

Random generator;

void setup(){
  size(600,600);
  background(0);
  generator=new Random();
  noStroke();
  frameRate(10);
  smooth();
}

void draw(){
 // background(255);
  
  float h=(float) generator.nextGaussian();
  
  fill(random(255), 100, 100, random(100));
  ellipse(width/2, height/2, h*30+150, h*30+150);
  
  
  if (mousePressed){
  fill(random(255), random(255), random(255), random(100,200));
  ellipse(width/2, height/2, h*60+250, h*60+250);
  
}
}
