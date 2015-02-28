

int x  =0;
int x1 =0;
int y = 0;
float rad = 50;
float rad1 = 60;
float rad2 = 70;
int xspeed=5;
int x1speed=3;

float a = 500;
float b = 40;
float theta = 0;

 
void setup()

{
  size (500,500);
  frameRate(30);
}
 
void draw()

{
x=x+xspeed;
  noStroke();
  background(0);
  ellipse(x, y, rad, rad);
  fill(random(255), random(255), random(255));
  ellipse (x, y+rad*2, rad, rad);
   fill(random(255), random(255), random(255));
  ellipse (x, y+rad*4, rad, rad);
   fill(random(255), random(255), random(255));
  ellipse (x, y+rad*6, rad, rad);
   fill(random(255), random(255), random(255));
  ellipse (x, y+rad*8, rad, rad);
  fill(random(255), random(255), random(255));
    ellipse (x, y+rad*10, rad, rad);
  fill(random(255), random(255), random(255)); 


 a = a - 5;
    
fill(250);
rect(a, b, 50, 50);
rect(a, b+b*2, 50, 50);
rect(a,b+b*4, 50, 50);
rect(a,b+b*6, 50, 50);
rect(a,b+b*8, 50, 50);
rect(a,b+b*10, 50, 50);

   }   



