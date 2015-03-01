
// Tweak of Tiny_Fibonacci_Sphere.pde 5/2012
// http://www.openprocessing.org/sketch/62322


float rX=0.7, rY, vX, vY, phi=(sqrt(5)+1)/2-1; // golden ratio
int p=2000;

void setup()
{ size(400, 400, P3D);
  strokeWeight(1.8);  stroke(100);
 
}
void draw()
{ background(0);        
  translate(width/2.0, height/2.0, 0);
  vX *= 0.95;
  vX += (mouseY-pmouseY)*1.6/10000;  vX +=0.0003; rX += vX;  rotateX(rX); 
  vY *= 0.95; 
  vY += (mouseX-pmouseX)*1.6/10000;  vY +=0.0003; rY += vY;  rotateY(rY); 
  
  if (frameCount < 200) p = p - floor(1 + (p/50));
  
  else if ( p< 2000) p = p + floor(1 + (p/200));
  for (int i = 1; i <= p; i++){
    pushMatrix();
    rotateY((phi*i -floor(phi*i))*2.0*PI);
    if(sin(2*i/(float)p-1) < 0) stroke(30 + i/8);
    //if(sin(2*i/(float)p-1) > 0) stroke(0,200,0);
    rotateZ(asin(2*i/(float)p-1));
    point(140.0, 0);
    popMatrix(); 
  }
  println(frameCount);
 // if(frameCount < 10  || frameCount %10==0) save("ten/"+frameCount +".tga");
}



