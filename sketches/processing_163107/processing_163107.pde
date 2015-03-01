
float delta = 8;
float r = 200;

void setup()
{
  size(600,600, P3D);
}

void draw()
{
  background(255);
  
  translate(width/2,height/2,0);
  
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));
  fill(0,0.200,100);
  triangle(300,200,400,500,200,300);
  
  for (float z = 0; z < 200; z +=5)
  {
    
    for ( float deg = 0; deg < 360; deg +=delta)
    {
      float theta = radians(deg);
      float x = r * cos(theta);
      float y = r * sin(theta);
      point(x,y,z);
      fill(random(255),random(255),random(255));
      ellipse(x,y,z,100);
       
    }
    
  }
}
