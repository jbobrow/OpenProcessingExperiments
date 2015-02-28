
//Eric T Computer Progamming 1 Mods 4-5
void setup()
{
  size(300,300,P3D); 
}
float col1 = 0;
float col2 = 0;
float col3 = 0;
float x = 0;
float y = 0;
void draw()
{
  background(50);
  camera(mouseX-300,mouseY-300,50,0,0,0,1,0,0);
  fill(col1,col2,col3,150);
  col1 = col1 + .5;
  if(col1 > 255)
  {
    col1 = 0;
  }
  col2 = col2 + 1;
  if(col2 > 255)
  {
    col2 = 0;
  }
  col3 = col3 + .75;
  if(col3 > 255)
  {
    col3 = 0;
  }
  rotateX(x);
  x = x + .01;
  rotateY(y);
  y = y + .016;
  stroke(50);
  strokeWeight(2);
  smooth();
  lights();
  sphere(70);
  translate(50,100,0);
  fill(col1,col2,col3);
  col1 = col1 + .5;
  if(col1 > 255)
  {
    col1 = 0;
  }
  col2 = col2 + 1;
  if(col2 > 255)
  {
    col2 = 0;
  }
  col3 = col3 + .75;
  if(col3 > 255)
  {
    col3 = 0;
  }
  box(30,20,40);
}
