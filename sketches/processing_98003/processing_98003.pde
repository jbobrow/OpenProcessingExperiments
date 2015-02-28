
void setup(){
  size(500,500);
}

void draw(){
  background(200,40,40);
  for(int i=0;i<500;i=i+10)
{
  float r=random(500);
  float j=random(500);
  float color1=random(255);
  float color2=random(255);
  float color3=random(255);
  float opacity=random(255);
  noStroke();
  frameRate(10);
  fill(color1,color2,color3,opacity);
  rect(i,r,j,25);
  
  float a=random(500);
  float b=random(500);
  float color4=random(255);
  float color5=random(255);
  float color6=random(255);
  float opacity2=random(255);
  noStroke();
  frameRate(10);
  fill(color3,color4,color5,opacity2);
  ellipse(i,r,j,25);
  

}
}
