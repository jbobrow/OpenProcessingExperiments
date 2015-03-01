
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
  translate(width/2,height/2,0);
   
  drawSphere(200, mouseX-width/2, mouseY-height/2, 0);
  stroke(random(0,255),random(0,255),random(0,255));
   
  strokeWeight(5);


}

void drawSphere(float r, float X, float Y, float Z)
{
  for(float deg=0; deg<360; deg += delta)
  {
      float theta = radians(deg);
        
      for(float deg2 = 0; deg2 < 360; deg2 += delta){     
       float phi = radians(deg2);
        float x = r * sin(phi) * cos(theta);
        float y = r * sin(phi) * sin(theta);
        float z = r * cos(phi);
        point(x+X,y+Y,z+Z);
      }
    }
}

