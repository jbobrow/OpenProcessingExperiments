
int xPos;
int yPos;
int wid;
int hei;
color col;
int speed = 10;
float y;
 
 void setup(){
   size(500,500);
   background(0);
 }
class Shoe{
Shoe(int x, int y, int w, int h, color c){
 
xPos = x;
yPos = y;
wid = w;
hei = h;
col = c;
}
}
 
void display(){
fill(255);
rect (10, y, 20,9);
}

void drive(){
  if(y > 500) {
  speed=-speed;
}
  if(y < 1) {
    speed=-speed;
  }
}

