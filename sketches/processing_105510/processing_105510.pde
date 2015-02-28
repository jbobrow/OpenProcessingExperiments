
import processing.pdf.*;
float theta;
int iterations;
int startlength;
float degs;
float ratio;
float angleDelta;
int iter = 0;
int iters;

void setup(){
size(1000,700);

angleDelta = 1;
ratio = 0.7;

startlength = 200;

}
void draw(){
 
  background(0);
 

  float a = ((mouseX+mouseY)/(float) width)*180f;

  theta = radians(a);

  translate(width/2, height-30);
  line(0,0,0,-startlength);
  translate(0,-startlength);

  branch(startlength);
 
}

void branch(float h)
{
  h= h*ratio;
 
  if(h>4.13){
    stroke(color(theta%5*200, theta *15,theta%2*200, 127));
   stroke(255);
    pushMatrix();
    rotate(theta);
    line(0,0,0,-h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    stroke(color(theta%5*200, theta%2*15,theta%2*200, 127));
    pushMatrix();
    rotate(-theta);
    line(0,0,0,-h);
    translate(0,-h);
    branch(h);
    popMatrix();
  }

}
