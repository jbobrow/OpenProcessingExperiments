
float delta = 8;
float r1 = random(100,100);
float  X1, Y1 =0;
void setup()
{
  size(600,600, P3D);
}
 
void draw()
{
  background(0);
  translate(width/2, height/2, 0);
  
  rotateX(mouseX);

  if(mouseY>255){
    stroke(255,255,0);
  }
  else{
     stroke(mouseY,mouseY,0); 
  }
  strokeWeight(4);
  drawSphere(mouseY,0,0,0);
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

