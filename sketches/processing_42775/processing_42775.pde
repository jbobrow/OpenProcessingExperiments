
//hw10 CMU 48-575 copywrite Zack Jacobson-Weaver 2011

color  col;



void setup()
{
  size(600,600,P3D);
  background(0);
  lights(); 
  col= color(random( 256),random( 256),random( 256));
  
  
}

void draw()
{
  
  drawZ();
  
}


void drawZ()
{
  noStroke();
  fill(col);
  lights();
  translate(width/2,height/2);
  sphere(height/10);
  fill(col*3, 10);
  translate(-width/8,height/8,-height/8);
  sphere(height/8);
  fill(col*2, 10);
  translate(width/8,height/8,height/8);
  sphere(height/8);
  fill(col*4, 10);
  translate(width/8,height/8,height/8);
  sphere(height/8);
  fill(col*5, 10);
  translate(width/200,-height/2.2,height/20);
  sphere(height/10);
  fill(col*6, 10);
  translate(-width/8,-height/8,-height/8);
  sphere(height/11);
  fill(col*7, 10);
  translate(-width/8,-height/8,-height/8);
  sphere(height/12);
  fill(col*8, 10);
  translate(-width/8,-height/8,-height/8);
  sphere(height/13);
  
 
  
}

