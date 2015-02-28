
//Michael H. Mods 16-17 CP1 
//3-D 

void setup()
{
  size(1000,1000,P3D);
  background(0);
}
void draw()
{
  background(0);
  pointLight(229,229,9,mouseX-500,mouseY-300, 200);
  camera(mouseX-500,mouseY-300,200,0,0,0,0,1,0);
  translate(50,30,0);
  box(100);
  translate(-50,-30,0);
  translate(50,-30,0);
  box(80);
  translate(-50,30,0);
  translate(50,-60,0);
  box(60);
  translate(-50,60,0);
  translate(50,-90,0);
  box(40);
  translate(-50,90,0);
  translate(50,-110,0);
  box(20); 
  translate(-50,110,0);
  translate(50,-120,0);
  box(10);
  translate(-50,120,0);
  translate(100,65,0);
  box(30);    
}
