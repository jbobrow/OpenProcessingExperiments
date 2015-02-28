
void setup(){
  size(400,400);
  noStroke();
  smooth();
  background(204,220,255);
}

void draw(){
  float x=random(400);
  float y=random(400);
  float z=random(400);
  stroke(x/2,y/2,120);
  strokeWeight(.5);
  for (int i=0; i<width; i+=1)
  {
    triangle(200,200,x,y,z,i);
    fill(x,y,z);
  } 
  for(int j=0;j<width;j+=1)
  {
    ellipse(x,j,20,20);
  }
}

