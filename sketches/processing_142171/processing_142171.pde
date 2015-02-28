
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

float cX=10;
float direction=1;
float angle=1;

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
  translate(width/2,height/2); // changes the coordinate origin to the center of the sketch window
  
  // basic gird of coordinates
  for(int i=40; i<width; i+=80){
    for(int j=30; j<height; j+=60){
      strokeWeight(random(10));
      rotate(angle);
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
  
  // rotation angle
  angle += 0.002;
    
}

void mousePressed(){
  noLoop();
}
void mouseReleased(){
  loop();
}
