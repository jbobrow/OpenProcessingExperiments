
//homework9  
//Joel McCullough Copyright Pittsburgh PA 15221
float x,y,ydif,xdif;

void setup()
{
  size(400,400,P3D);
  smooth();
//  noStroke();
  lights();
  xdif = 0.0;
  ydif = 0.0;
   
}

void draw()
{
  xdif= xdif+.01;
  ydif=ydif+0.1;
  x = noise(xdif)*200;
  y = noise(ydif)*150;
  background(0);
  stroke(104,3,232);
  translate(width/2,height/2,10);
  fill(17,160,255,30);
  sphere(x);
  stroke(232,109,3);
  fill(255,9,27,20);
  box(y); 
  
  pushMatrix();
  translate(-100,-height/3,0);
  fill(229,230,255,40);
  noStroke();
  rect(0,100,300,300);
  popMatrix();
}

