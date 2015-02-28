
float x;
float y;
float x1;
float x2;
float x3;
float x4;
float y1;
float y2;
float y3;
float y4;



void setup(){
  size(500,500);
  background(0);
  x=random(500);
   x1=random(500);
    x2=random(500);
     x3=random(500);
      x4=random(500);
  y=0;
  y1=10;
  y2=20;
  y3=25;
  y4=30;
  strokeWeight(5);
  stroke(#1C42FA);
}
void draw()
{
  
stroke(0);
point(x,y);
point(x1,y1);
point(x2,y2);
point(x3,y3);
point(x4,y4);
y=y+15;
y1=y1+20;
y2=y2+30;
y3=y3+25;
y4=y4+12;

stroke(#1C42FA);
point(x,y);
point(x1,y1);
point(x2,y2);
point(x3,y3);
point(x4,y4);

print(x);
println();





if(y>=490){
  x=random(500);
  y=0;
}
if(y1>=490){
  x1=random(500);
  y1=0;
}
if(y2>=490){
  x2=random(500);
  y2=0;
}
if(y3>=490){
  x3=random(500);
  y3=0;
}
if(y4>=490){
  x4=random(500);
  y4=0;
}
}
