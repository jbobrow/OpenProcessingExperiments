
//by. Michael Yu
 
matrix a, b, c, d, e;
 
void setup()
{
  size(950, 600);
  smooth();
 
  /*a = new matrix();
  a.y = random(0,500);
  a.o = random(50, 100);
  a.r = 1;
  a.g = 131;
  a.b = 37;*/
  frameRate(25);
}
 
void draw()
{
  background(255,0);
  //fill(255, 255);
  //rect(0, 0, 950, 500);
  a = new matrix();
  a.x = mouseX;
  a.y = random(0,500);
  a.o = random(50, 100);
  a.r = 1;
  a.g = 131;
  a.b = 37;
   
  b = new matrix();
  b.x = mouseX+75;
  b.y = random(0,500);
  b.o = random(50, 100);
  b.r = 1;
  b.g = 131;
  b.b = 37;
   
  c = new matrix();
  c.x = mouseX;
  c.y = random(0,500);
  c.o = random(50, 100);
  c.r = 1;
  c.g = 131;
  c.b = 37;
   
  d = new matrix();
  d.x = mouseX;
  d.y = random(0,500);
  d.o = random(50, 100);
  d.r = 1;
  d.g = 131;
  d.b = 37;
   
  a.show();
  b.show();
  c.show();
  d.show();
}
 
class matrix
{
  float x, y, r, g, b, o, text1;
   
  void show()
{
  fill(r, g, b, o);
  text("9",x,y);
  text("3",x+150,y);
  text("#",x-150,y);
  text("M",x+175,y);
  text("I",x+225,y);
  text("K",x+275,y);
  text("E",x+325,y);
  text("7",x+375,y);
  text("Y",x+415,y);
  text("*",x+75,y);
  text("%",x-75,y);
  text("$",x-180,y);
  text("W",x-250,y);
  text("Q",x-300,y);
  text("c",x-350,y);
  text("v",x-420,y);
   
}
 
}
 
 
 
//fill(r,g,b,o);
//stroke(7,80,27);
//text("水",x,y);
 /*text("大");
 text("海");
 text("雨");
 text("冰");*/
