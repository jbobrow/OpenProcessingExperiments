
/*
Jacqueline Christine
HW #3
ART 3001
What's Behind Door Number 2
*/

int i,m;
int state=0;
float radius=5;
int a=26;
int s=5;
int angle = 5;

void setup(){
  size (300,300);
  background (0);
}

void draw(){

if (mousePressed==false){//true or false state to activate door
if (state==0){

background(i=0);stroke(40);m=millis();while(i<300){strokeWeight(((i/23.1+m/717.1)%30));point((i*i*m)%300,i++);}// vibrating background

float x=sin(a)*radius;//vibrating door variables
float y=cos(a)*radius;
float x1 = 100 + 20 * cos(angle);
float y1 = 100 + 10 * sin(angle);
float width = 100 + 20 * sin(angle);
float height = 120 + 20 * cos(angle);

fill (150, 0, random(50,200));//vibrating door
strokeWeight(1);
rect(x+x1, y+y1, width, height);
a+=2;
radius+=0.2;
radius=constrain (radius,0,3);//keeps door from spiraling

fill (40);//door handle
ellipse (120,160,10,10);
fill (60);
ellipse (120,160,7,7);
fill (80);
ellipse (120,160,3,3);
}
 }else if (mousePressed==true){//to open door

frameRate(350);
if (state==0){

float x=10;//deactivates initial variables
float y=10;
float x1 = 10;
float y1 = 10;
float width = 10;
float height = 12;
float w=90;

while (w>20){//creates inner depth to make door look open
fill(w-20);
rectMode (CENTER);
rect (146,153,w,w+42);
w=w-15;

fill(240,0,59);//open door in perspective
rect (190,153,6,153);
fill(150);
ellipse (198,160,10,10);//door handle in perspective
state=1;
}
 }else if (state ==1){
strokeWeight(((i/23.1+m/717.1)%10));//creates variable weight around inner circles 
float x=sin(a)*radius;//calls new variables
float y=cos(a)*radius;
float x1 = 150 + 20 * cos(angle);
float y1 = 150 + 10 * sin(angle);
float width = 50 + 20 * sin(angle);
float height = 50 + 20 * cos(angle);

fill (150, 0, random(50,200));//what is behind door number 2
ellipse (x+x1, y+y1, width, height);
a+=2;
radius+=0.2;
  }
 }
}
