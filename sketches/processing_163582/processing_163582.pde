
float delta=3, delta2 = 6;
float r=200;
float h=0, dh=0;
void setup()
{
  size(1500,1500,P3D);
   background(255);
   frameRate(1000);

}

void draw()
{
  translate(width/2+h,height/2,0);
  
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));
  
  
  stroke(random(0,255),random(0,255),random(0,255));
  
  strokeWeight(5);
  
 
  for(float deg2=0;deg2<90;deg2+=delta2){
      float phi = radians(deg2);
    for(float deg=0;deg<1;deg+=delta){
      float theta=radians(deg);
      float x=r*sin(phi)*cos(theta);
      float y=r*sin(phi)*sin(theta);
      float z = r* cos(phi);
      point(y,x,z);
    
    }
    if (mousePressed)
    {
      r += 0.01;
    }
  }
    
}
  
