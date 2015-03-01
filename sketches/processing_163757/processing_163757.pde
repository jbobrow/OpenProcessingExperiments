
float gravity = 0.98;
float speed =10;
float rX= 0.7, rY, vX, vY, phi=PI;
float y = 0;
float[] x = new float[50];
float p = 1000;

void setup()
{ size(1000, 500, P3D);
strokeWeight(3); stroke(255);
}

void draw()
{
 
float height = 1000;
   background(104,220,240);      
   translate(width/2.5, height/2, 0);

 
vX = (vX+(mouseY-pmouseY)*0.0001)*19/20; rX += vX; rotateX(rX);

  
     for (int i = 1; i <= p; ++i) {
     rotateX((phi*i -floor(phi*i))*2.0*PI);
     rotateX(asin(2*i/p-1));
     point(0-0.01*p, 0);
    }
  
  for(int i=0; i<50;i++)
  {
    x[i] = random(1000);  
    ellipseMode(CENTER);
    ellipse(x[i],y,5,30);
    ellipse(-x[i],y,5,30);
    fill(255,255,255,random(1000));
    line(x[i], y, x[i], y-20);
    stroke(119,222,215,random(100));
    y += speed + gravity;
  
  
    if(y>height)
    {
      y = -60;
      speed = 10;
  }
  }
}
