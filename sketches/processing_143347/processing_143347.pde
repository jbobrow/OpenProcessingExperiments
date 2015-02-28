
/*
 Konkuk University
 SOS iDesign
 
Name:Lim Hyun Seung
 ID: 201420104 Lim Hyun Seung
 
*/
float cX=250;
float direction=3;
void setup()
{ 
  size(600, 600);
  background(0);
}
void draw()
{
  background(cX);
  
  stroke(0,cX);
  fill(0,150,cX,10);
  
  // basic gird of coordinates
  for(int i=45; i<width; i+=60){
    for(int j=45; j<height; j+=60){
      noStroke();
      rectMode(CENTER);
      rect(i,j,cX,cX);
      ellipse(j,i,cX,cX);
    }
  }
 
}
