
float x;
float y;
float z;
int xPos;
int yPos;
int wid;
int hei;
color col;
 
class Shoe {
 Shoe (int x, int y, int w, int h, color c){
 
   
xPos = x;
yPos = y;
wid = w;
hei = h;
col = c;
}
 
void display(){
 fill(col);
 rect (xPos, yPos, wid, hei);
}
}

void drive (){
  x = y+0 ;
  y = x+speed ;
  z = random (255) ;
  if ( y>499) {
  speed = -speed;
  }
  if (y<1){
  speed=-speed;
  }}
                
