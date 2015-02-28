
class Foot{ 
int y;
int z=485;
int xPos;
int yPos;
int wid;
int hei;
color col;
int sp; 
int spd;
 
Foot(int x, int y, int w, int h,int speed, int speed2, color c){
 spd=speed2;
  sp=speed;
xPos = x;
yPos = y;
wid = w;
hei = h;
col = c;
}
void display(){
fill(col);
ellipse (xPos, yPos, wid, hei);
}
void drive(){
  
if(xPos>z){
  spd=-spd;
}
if(xPos>z){
  z=15;
}
if(xPos<0){
  spd=-spd;
}
z=485;
xPos=xPos+sp;

if(yPos>z){
  sp=-sp;
}
if(yPos>z){
  z=15;
}
if(yPos<0){
  sp=-sp;
}
z=485;
yPos=yPos+sp;
}
}
Shoe urs;
Shoe mine;
Sock stripe;
Sock dotted;
Foot starred;
void setup(){
stripe = new Sock(0,425,50,50,2,color(60,200,200));
dotted = new Sock(50,75,70,70,3,color(150,200,60));
mine = new Shoe(275,0,60,60,2,color(100,30,100));
urs = new Shoe(200,50,40,40,4,color(5,50,200));
starred = new Foot(0,0,30,30,2,3,color(5,10,200));
size(500,500);
}
 
void draw(){
  background(200);
    stripe.drive();
  stripe.display();

dotted.drive();
dotted.display();
urs.drive();
  urs.display();

mine.drive();
mine.display();
}
   class Shoe{ 
int y;
int z=485;
int xPos;
int yPos;
int wid;
int hei;
color col;
int sp; 

 
Shoe(int x, int y, int w, int h,int speed, color c){
 sp=speed;
xPos = x;
yPos = y;
wid = w;
hei = h;
col = c;
}
void display(){
fill(col);
ellipse (xPos, yPos, wid, hei);
}
void drive(){
  
if(yPos>z){
  sp=-sp;
}
if(yPos>z){
  z=15;
}
if(yPos<0){
  sp=-sp;
}
z=485;
yPos=yPos+sp;
}
}
             class Sock{ 
int y;
int z=485;
int xPos;
int yPos;
int wid;
int hei;
color col;
int sp; 

 
Sock(int x, int y, int w, int h,int speed, color c){
 sp=speed;
xPos = x;
yPos = y;
wid = w;
hei = h;
col = c;
}
void display(){
fill(col);
ellipse (xPos, yPos, wid, hei);
}
void drive(){
  
if(xPos>z){
  sp=-sp;
}
if(xPos>z){
  z=15;
}
if(xPos<0){
  sp=-sp;
}
z=485;
xPos=xPos+sp;
}
}
                                
