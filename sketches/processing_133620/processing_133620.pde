
void setup(){
  size(400,400);
  noStroke();
  smooth();
  background(204,220,255);
}
 
void draw(){
  float x=random(400);
  float y=random(400);
  stroke(255);
  strokeWeight(5);
  for(int i=0;i<100;i+=50)
  {
  triangle(x,y,200,200,50,50);
  fill(230,230,250);
  }
}

