
int xPos;
int yPos;
int wid;
int hei;
int speed=9;

color col;
 
 
class Shoe{
  Shoe(int x, int y, int w, int h, color c){
 
xPos = x;
yPos = y;
wid = w;
hei = h;
col = c;
}

void display(){
fill(col);
rect (100, 100, 200, 125);
}
void drive(){
   x=y+0;
  y=x+speed;
  z=random(255);
  ellipse(250,y,z,z);
  frameRate(500);
   if(y>490)
 
  speed=-speed;
 
if(y<1)
{
 
  speed=-speed;
} 
Shoe mine;
void setup ()={
size(500,500);
background(0);
mine = new Shoe(5,10,30,20,color(67,30,100));
}
 
void draw(){
mine.display();
}

    
                
                
