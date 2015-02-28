
/*Massive Scale
 *
 *Created by Roger Liao
 */

Droplet d;
int blocksize;
Stars s;
PImage rock;

void setup()
{
  rock = loadImage("rocks.jpg");
  
  size(400,200);
  smooth();
  noStroke();
  d = new Droplet();
  d.w = 10;
  d.h = 10;
  s = new Stars();
  blocksize = 1;
  frameRate(5);
}
void draw()
{
  rock();
  d.show();
  s.show();
  s.move();

  
 /*    for(int y=0; y<height; y+=blocksize) {
     for(int x=0; x<width; x+=blocksize) {
     fill(random(0),random(0),random(250), 30);
     rect(x,y,blocksize,blocksize);
     }
   }*/

}
class Droplet
{
  float x, y;
  int w, h;
     void show()
     {
       fill(30,50,160);
       ellipse(x, y, w, h);
       for (int c=0; c < 1; c++)
        {
         d.x = random(width);
         d.y = random(height);
        }
     }
}
void rock()
{
  tint(0, 153, 204, 126);
  image(rock,0,0,width,height);
}
class Stars
{
  float x;
  float y;
 
  void show()
  {
    
  fill (113, 130, 224);
  for (int i = 0; i <width; i+=4) 
  {
  ellipse(i,y,1,1);
  ellipse(i+random(2),y+random(-5,5),1,1);
  ellipse(i+random(2),y+random(-5,5),1,1);
  }}
 
   void move() {
     y += 5;
   if (x<2){
   x = width-30;
  } else if (x>width-20) {
    x = 3;
  }
 
    if (y<-10){
   y = height - 30;
  } else if (y>height+30) {
    y = 3;
  }}}

