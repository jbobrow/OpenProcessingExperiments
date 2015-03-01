
//Super simple cube that rotates randomly
//was going to turn into a Rubix cube eventually
import processing.opengl.*;
float y = 0.1;
float x = 0.1;
float z = 0.1;
void setup()
  {
    size(800,600,P3D);
    smooth();
  }
void draw()
  {
    noStroke();
    sphere(60);
    rotateX(x/2);
    rotateY(y/2);
    rotateZ(.01);
    background(255);
    fill(255,228,225);
    translate(500,400,0);
    sphere(60);
    x +=.1;
    //y += .1;
    //z += .01;
  }
void rotate(){
    
}
  
void build(){
    
}
