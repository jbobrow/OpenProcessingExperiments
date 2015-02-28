
float radius = 200.0,  weight = 90.0;
 
void setup()
{
  size(1024,640,P3D);
}
 
void draw()
{
  background(0x22);
  strokeWeight(8);
  stroke(0xFF);
   
  translate(width/2, height/2);
  rotateY((float)mouseX/width*TWO_PI);
  rotateX((float)mouseY/height*TWO_PI);
   
  float fc = frameCount*0.02;
   
  for(float circ=0; circ < TWO_PI; circ += radians(10))
  {
    float cx = sin(circ+fc);
    float cy = 0;
    float cz = cos(circ+fc);
     
    for(float don=0; don < TWO_PI; don += radians(20))
    {
      int r = 150 + int(100*cos(don));
      int b = 150 + int(100*sin(don));
       
      float x = radius*cx + weight*sin(don)*cx;
      float y = radius*cy + weight*cos(don);
      float z = radius*cz + weight*sin(don)*cz;
       
      stroke(color(r,0,b));
      point(x,y,z);
    }
  }
}
