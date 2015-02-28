
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

float cX=100;
float direction=1;;

void setup()
{ 
  size(640,360);
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
  for(int i=30; i<width; i+=60){
    for(int j=30; j<height; j+=60){
      strokeWeight(random(10));
      rectMode(CENTER);
      rect(i,j,cX,cX);
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
