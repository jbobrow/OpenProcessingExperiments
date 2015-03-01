

float rho = 400;


void setup()
{
  size(600, 600, P3D);
}

void draw()
{
  background(25,25,112);
  
  translate(width/2, height/2, 0);
  rotateX(radians(mouseX));
  rotateY(radians(mouseY));
  
  // rho = radial distance from origin (fixed)
  
  
    for (float deg1 = 0; deg1 < 360; deg1 += 6.7){
      for (float deg2 =0; deg2 <180; deg2+= 37){
      float phi = radians(deg2);
      float theta = radians(deg1);
      float x = rho * sin(phi) * cos(theta);
      float y = rho * sin(phi) * sin(theta);
      float z = rho * cos(phi);
      stroke(127,255,212);
      point(x,y,z);
      line(0,0,0,x,y,z);
      
      
    }
  }
}

  
