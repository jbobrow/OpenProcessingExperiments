
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

float cX=10;
float direction=1;;

void setup()
{ 
  size(640,360,P3D);
  background(0);
}

void draw()
{
  noStroke();
  fill(255,50);
  rectMode(LEFT);
  rect(0,0,width,height);
  
  stroke(0);
  fill(0,150,cX,10);
  
  // basic gird of coordinates
  for(int i=60; i<width; i+=120){
    for(int j=60; j<height; j+=120){
      strokeWeight(random(10));
      pushMatrix();
      translate(i, j, 0);
      sphere(cX);
      popMatrix();
    }
  }
  // counter for ellipse width & height, and color range
  cX = cX + (1 * direction);
  // change the direction of counting 
  if ((cX<0)||(cX>300)){
    direction*=-1;
  }
}

void mousePressed(){
  noLoop();
}
void mouseReleased(){
  loop();
}
