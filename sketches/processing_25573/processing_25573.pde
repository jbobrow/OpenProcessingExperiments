
float a = 10;
float b = 10;
float c = 10;
float d = 10;
float e = 10;
float f = 10;
float g = 10;
float h = 10;

void setup()
{
  size(1000,1000,P3D);
  smooth();
  background(0);
  frameRate(30);
  
}

void draw()
{
 
  if(d < 32){
  translate(500,500,c);
  rotateZ(a*0.7);
  translate(5*a,b*2,c);
  rotateZ(a*0.2);
  noFill();
    if(mousePressed){
  stroke(0,mouseX/10,255,random(0,100));
  }
  else{
    stroke(100,0,mouseX/5,random(0,100));
  }
  
  sphere(d*3); 
  a+=0.1;
  b+=0.2;
  c+=0.5;
  d+=0.05;

  } 
 if(d > 32)
  {
  translate(500,500,g);
  rotateZ(e*0.7);
  translate(5*e,f*2,g);
  rotateZ(e*0.2);
  noFill();
  if(mousePressed){
  stroke(255,random(0,50));
  }
  else{
    stroke(0,random(0,255));
  }
  sphere(h*3);
  e+=0.1;
  f+=0.2;
  g+=0.5;
  h+=0.06;
  }
  
}
  

