
int xPos;
int yPos;
int wid;
int hei;
color col;
 
 
class Shoe{ → classes are usually named with an Uppercase letter.
 
Shoe(int x, int y, int w, int h, color c){
 
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
         
