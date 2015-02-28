
Shoe mine;
void setup(){
size(500,500);
background((color)250,20,250);
mine = new Shoe(5,10,30,20,color(67,30,100));
}
void draw(){
mine.display();
}

int xPos = 0;
int yPos = 0;
int wid = 20;
int hei = 30;
color col;

class Shoe{
 
Shoe(int x, int y, int w, int h, color c){
 
xPos = xPos + 5;
yPos = yPos + 5;
wid = w;
hei = h;
col = c;
}
 
void display(){
fill(col);
rect (xPos, yPos, wid, hei);
}
void drive(){
  if(xPos>500);
  xPos = 0;
}

Shoe hers;
void setup(){
hers = new Shoe (250,200,30,20,color(67,30,100));
}
void draw(){
  hers.display();
}
}


                
                
