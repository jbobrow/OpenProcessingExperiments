
/*
Jacqueline Christine
HW #3
ART 3001
What's Behind Door Number 1
*/

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
  if (mousePressed==false){
if (state==0){
float x=sin(a)*radius;
float y=cos(a)*radius;

float x1 = 100 + 20 * cos(angle);
float y1 = 100 + 10 * sin(angle);
float width = 100 + 20 * sin(angle);
float height = 120 + 20 * cos(angle);

fill (150, 0, random(50,200));
rect(x+x1, y+y1, width, height);
a+=2;
radius+=0.2;
radius=constrain (radius,0,3);

fill (40);
ellipse (120,160,10,10);
fill (60);
ellipse (120,160,7,7);
fill (80);
ellipse (120,160,3,3);
}
 
 
  }else if (mousePressed==true){
  frameRate(250);
  if (state==0){
    float x=10;
float y=10;

float x1 = 10;
float y1 = 10;
float width = 10;
float height = 12;
float w=90;
while (w>20){
fill(w-20);
rectMode (CENTER);
rect (146,153,w,w+42);
w=w-15;
fill(240,0,59);
rect (190,153,6,153);
fill(150);
ellipse (198,160,10,10);
state=1;
  }
  }
  else if (state ==1){
    
    float x=sin(a)*radius;
float y=cos(a)*radius;

float x1 = 150 + 20 * cos(angle);
float y1 = 150 + 10 * sin(angle);
float width = 50 + 20 * sin(angle);
float height = 50 + 20 * cos(angle);

fill (150, 0, random(50,200));
ellipse (x+x1, y+y1, width, height);
a+=2;
radius+=0.2;
    
println(state);
  }

  }
}
