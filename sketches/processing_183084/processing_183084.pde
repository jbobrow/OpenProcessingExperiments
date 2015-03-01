
//Assignment 4a:Create a visually compelling animation by using all of the following items: random function, draw(), for loop. 2pts




void setup()
{
smooth();
size(400,400);

}
  
int x=0;
int y=200;
int xspeed=3;
int yspeed=3;
int q = 0;
int r = 0;
int s = 0;

void draw() {  

background(r,q,s);

 fill(q,r,s);
  noStroke();
    frameRate(30);
   ellipse(200, 200, x, y);
   fill(s,q,r);
    ellipse(x, y, 40, 40);
        x=x+xspeed;
        y=y+yspeed;
  
if ((x<0)||(x>=width)){
    xspeed=xspeed*-1;
   
    q=random(255);
     r=random(255);
     s=random(255);
 
  }
if((y<0)||(y>=height)){
    yspeed=yspeed*-1;
     q=random(255);
     r=random(255);
     s=random(255);
}
  }
