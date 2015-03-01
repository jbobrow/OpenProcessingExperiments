
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

float cX=10;
float direction=1;
float angle=1;

void setup()
{ 
  size(800,600);
  background(0);
}

void draw()
{
  noStroke();
  fill(200,100,50,100);
  rectMode(LEFT);
  rect(0,0,width,height);
  
  stroke(0);
 
  // basic gird of coordinates
  for(int i=20; i<width; i+=40){
    for(int j=20; j<height; j+=40){
      strokeWeight(2);
      pushMatrix();
      translate(i,j); // changes the coordinate origin to the center of the sketch window
      rotate(angle);      
      line(0,0,i,j);
      popMatrix();

    }
  }  
  // rotation angle
  angle += 0.009; 
}

void mouseOver(){
  noLoop();
}
void mouseOut(){
  loop();
}
