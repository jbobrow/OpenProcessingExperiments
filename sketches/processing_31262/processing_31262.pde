
Shoe mine;
Shoe yours;
Shoe ours;
Shoe wow;

Apple omg;
Apple yay;
Apple cool;
void setup(){
size(500,500);
background((color)250,20,250);
mine = new Shoe(1,200,10,30,20,10,color(67,30,100));
yours = new Shoe(2,50,50,40,10,5,color(56,78,90));
ours = new Shoe(1,20,20,20,20,20,color(20,20,20));
wow = new Shoe(2,50,50,50,50,50,color(50,50,50));

omg = new Apple(100,100,100,100,100,color(100,100,100));
yay = new Apple(1,1,1,1,1,color(1,1,1));
cool = new Apple(20,20,20,20,20,color(20,20,20));
}
void draw(){
  background((color)200,200,30);
  mine.drive();
mine.display();
yours.drive();
yours.display();
ours.drive();
ours.display();
wow.drive();
wow.display();
omg.drive();
omg.display();
yay.drive();
yay.display();
cool.drive();
cool.display();
}

class Shoe{
int xPos;
int yPos;
int wid;
int hei;
int speed=5;
color col;
int shap;

Shoe(int shapeee, int x, int y, int w, int h, int spd, color c){
  shap = shapeee;
 xPos = x;
 yPos = y;
wid = w;
hei = h;
col = c;
speed = spd;
}
 
void display(){
fill(col);

if(shap==1){
rect (xPos, yPos, wid, hei);
}
if(shap==2){
ellipse (xPos,yPos,wid,hei);

}
}
void drive(){
  yPos = yPos+speed;
  if(yPos>500){
 speed = -speed;
  }
  if(yPos<0){
   speed = -speed;
}
}
}

class Apple{
int xPos;
int yPos;
int wid;
int hei;
int speed=5;
color col;
Apple(int x, int y, int w, int h, int spd, color c){
 xPos = x;
 yPos = y;
wid = w;
hei = h;
col = c;
speed = spd;
}
void display(){
fill(col);
rect (xPos, yPos, wid, hei);
}

void drive(){
  xPos = xPos+speed;
  if(xPos>500){
 speed = -speed;
  }
  if(xPos<0){
   speed = -speed;
}
}
}


                
                
