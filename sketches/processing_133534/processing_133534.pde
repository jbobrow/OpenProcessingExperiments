
void setup(){
  frameRate(30);
  size(400,400);
  background(0);
}
 
 
void draw(){
  //float r=random (400);
  for(int i=0;i<400;i=i+10)
  {
    noStroke();
    background(0);
    float e=random(150);
    float f=random(150);
    float g=random(150);
    fill(e,f,g);
    float w=random (400);
    float r=random (400);
    ellipse(r,w,100,100);
    ellipse(200,200,w,w);
  }
}
