


Shoe mine; 
Shoe his; 
void setup(){
size(500,500);
background(255);
his = new Shoe(50,50,100,100,color(10,50,50));
mine = new Shoe(50,50,50,50,color(50,50,50));
} 





int XPos;
int YPos;
int wid;
int hei;
color col;
 
 
class Shoe{
 
Shoe(int x, int y, int w, int h, color c){
 
XPos = x;
YPos = y;
wid = w;
hei = h;
col = c;
}
 
void display(){
fill(col);
rect (XPos, YPos, wid, hei);
}
 Void drive() {
float Y;
float A;

void setup() {  
    size(500,500);
    background(255,255,255);
    }
void draw(){
 background(255,255,255);
  Y= Y+ random(5);
  A=A+ random(5);
rect(100,Y,100,100);
}



