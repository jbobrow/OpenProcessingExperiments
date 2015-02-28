
float y=250;
float yTwo=250;
float yThree=250;
float yFour=250;
float r=0;
void setup()
{
  size(500,500,P3D);
  frameRate(20);
}
void draw()
{
  background(0);
  pointLight(255,255,255,50,100,200);
  noStroke();
  
  //sphere a
  translate(250,100,0);
  fill(255,0,0);
  sphere(50);
  
  //sphere b
  translate(0,y-240,0);
  fill(255,64,64);
  sphere(50);
 
  //sphere c
  translate(0,yTwo-240,0);
  fill(255,128,128);
  sphere(50);
  
  //sphere d
  translate(0,yThree-240,0);
  fill(255,192,192);
  sphere(50);
  
  //sphere e
  translate(0,yFour-240,0);
  fill(255,255,255);
  sphere(50);
  
  //variable changes
  y=y+20*sin(r);
  yTwo=yTwo+20*sin(r);
  yThree=yThree+20*sin(r);
  yFour=yFour+20*sin(r);
  r=r+PI/6;
  
}
