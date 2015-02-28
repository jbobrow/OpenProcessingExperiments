

int y;
int x=2;
int z=485;
int xPos;
int yPos;
int wid;
int hei;
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
ellipse (xPos, y, wid, hei);
}
void drive(){
  
if(y>z){
  x=-x;
}
if(y>z){
  z=15;
}
if(y<0){
  x=-x;
}
z=485;
y=y+x;
}
}
Shoe urs;
Shoe mine;
void setup(){
mine = new Shoe(20,y,40,40,color(100,30,100));
urs = new Shoe(200,y,40,40,color(10,30,100));
size(500,500);
}
 
void draw(){
  background(200);
    urs.drive();
  urs.display();

mine.drive();
mine.display();
}

