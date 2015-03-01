
float delta = 30;
float r = 70;

void setup()
{
  size(600,600,P3D);
  background(0);
}

void draw()
{
  translate(width/2, height/2, 0);
  rotateY(radians(mouseX));
  rotateX(radians(mouseY));
  
  for (float z=0; z<225; z+=20){
    for (float deg=0; deg<360; deg+=delta){
      float theta = radians(deg);
      float x =r*cos(theta);
      float y=r*sin(theta);
      point(x,y,z);
      stroke(#FFE064);
      
      sphere(70);
    }
    float x2=random(0,width);
  float y2=random(0,height);
  
  float rx2=random(0,width);
  float ry2=random(0,height);
  
  float sx2=random(0,width);
  float sy2=random(0,height);
  
  float triSz=abs(rx2*sy2-ry2*sx2)/2;
  
  float brightness = map(triSz,0,60000,0,255);
  
  fill(brightness+100,brightness/2+100,0);
  line(x2,y2,x2+rx2,y2+ry2,x2+sx2,y2+sy2);
  }
}

void mousePressed()
{
  background(0);
}


