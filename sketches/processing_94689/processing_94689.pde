
import processing.opengl.*;
float[][] x;
float v=0.0;
float h=0.0;
int index=0;

void setup(){
  size(400,150,OPENGL);
  noiseSeed(59);
  smooth();
//  frameRate(5000);
  x=new float[width*2][height];
  for(int i=0;i<width;i++){
    for(int j=0;j<height;j++){
    float c=noise(h,v)*255;
      x[i][j]=c;
      x[2*width-i-1][j]=x[i][j];
      v+=0.01;
    }
    v=0.0;
    h+=0.01;
  }
  
} 

void draw(){
  background(255);
  
// Cycle between 0 and the number of elements
  index = (index + 1) % (2*width);
 
  for(int i=0;i<width;i++){
    for(int j=0;j<height;j++){
      stroke(x[(index+i)%(2*width)][j]);
      point(i,j);
    }
 }
 fill(255,100);
 noStroke();
 ellipse(300,100,80,80);
}
