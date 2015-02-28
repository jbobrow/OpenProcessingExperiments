
void setup(){
  size(600,600);
  frameRate(6);
  smooth();
  background(255);
  noStroke();
}


void mouseClicked() { //the below function will stop once the mouse is pressed
  noLoop();
}


void draw(){
  
  float w; //the diameter of ellipse
  float r;
  float g;
  float b;
  float a;
  w=random(50);
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  
  
  ellipse(pmouseX,pmouseY,w,w);
  

  fill(r,g,b,a);
  
}



