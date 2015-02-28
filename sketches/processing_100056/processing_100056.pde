
//Global angle for rotation
float theta=0;

void setup(){
  size(960,540);
  smooth();
}
void draw(){
  background(100);
  stroke(255);
  
  //Translate to center of windows
  translate(width/2,height/2);
  
  //Loop from 0 to 360 degrees (2*PI radians)
  for(float i=0; i<TWO_PI; i+=0.2) {
  //Push, rotate and draw a line!
  pushMatrix();
  rotate(theta+i);
  line(0,0,100,0);
  //Loop from o to 260 (2*PI radians)
  for (float j=0; j<TWO_PI; j+=0.5) {
    //Push, translate, rotate and draw a line!
    pushMatrix();
    translate(100,0);
    rotate(-theta-j);
    line(0,0,50,0);
    //We´re done with the outsie loop, pop!
    popMatrix();
  }
  //We´re done with the outside loop, pop!
  popMatrix();
  }
  endShape();
  
  //Increment theta
  theta+=0.01;
}
    
//Made by Arturo Ramos Sanchez
//You can edit this file without any problem
    
    
  


