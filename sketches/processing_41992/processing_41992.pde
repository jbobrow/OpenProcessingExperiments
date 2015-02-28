
//homework10  
//Joel McCullough Copyright Pittsburgh PA 15221
float dia,r,g,b;

void setup()
{
  size(400,400,P3D);
  dia= 30;
  r= 100;
  g=50;
  b=100;
  frameRate(5);
}

void draw()
{
 prepscreen();
 makeinitials();
 
}

void makeinitials()
{
  r= r+.01;
  fill(r,g,b);
  initial();
  r = noise(r)*200;
  b=b+.01;
}

void initial()
{
  translate(width/2,height/4,0);
  sphere(dia);
  //j top
  pushMatrix();
    translate(-width/7,0,-50);
    sphere(dia-10);
  popMatrix();
  pushMatrix();
    translate(-width/4,0,-100);
    sphere(dia-10);
  popMatrix();
//  pushMatrix();
//  translate(width,0,50);
//  sphere(20);
//  popMatrix();
  //j middle
  pushMatrix();
    translate(-width/7,height/10,-50);
    sphere(dia-20);
  popMatrix();
  
  pushMatrix();
    translate(-width/7,height/5,-45);
    sphere(dia-20);
  popMatrix();
  
  pushMatrix();
    translate(-width/7,height/3.5,-40);
    sphere(dia-20);
  popMatrix();
  
  pushMatrix();
    translate(-width/7,height/2.8,-35);
    sphere(dia-20);
  popMatrix();
  //j bottom
  pushMatrix();
    translate(-width/5.5,height/2.8,-30);
    sphere(dia-20);
  popMatrix();
  
  pushMatrix();
    translate(-width/4,height/3.0,-25);
    sphere(dia-20);
  popMatrix();

  pushMatrix();
    translate(-width/3.3,height/3.3,-20);
    sphere(dia-20);
  popMatrix();
  
  
}

void prepscreen()
{
  background(120);
}

