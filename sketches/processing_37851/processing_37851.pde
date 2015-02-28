
boolean falling;
int x;
float y;
int fallcount;
int risecount;

void setup() {
  size(400,400);
  smooth();
  x=25;
  randomSeed(0);
  falling=true;
  fallcount=0;
  risecount=0;
}

void draw() {
 background(0);
  fill(255);
  if(x==25) {
    falling=true;
    fallcount=fallcount+1;
  y=random(0,width);
//    println(fallcount);
  }
  if(x==400-25) {
    falling=false;
    risecount=risecount+1;
   y=random(0,width);
//    println(risecount);
  }
  
if(falling)
{
  x=x+1; 
  fill(255,204,0);
} else 
{
  x=x-1;
  fill(120,90,0);
}
ellipse(100,x,50,50);
if (fallcount % 2 ==0){
fill(180,90,90);
ellipse(y,x,50,50);
fill(0,255,204);
ellipse(x,y,25,25);
ellipse(x+50,y,25,25);
ellipse(x+100,y,15,15);
ellipse(x+150,y,10,10);
fill(200,200,0);
ellipse(x+200,y,30,30);
ellipse(x+250,y,35,35);
ellipse(x+300,y,25,25);
ellipse(x+350,y,20,20);

//for y axis
fill(0,255,204);
ellipse(y,x,25,25);
ellipse(y,x+50,25,25);
ellipse(y,x+100,15,15);
ellipse(x+150,y,10,10);
fill(200,200,0);
ellipse(x+200,y,30,30);
ellipse(x+250,y,35,35);
ellipse(x+300,y,25,25);
ellipse(x+350,y,20,20);
}
if (falling==false); {
fill(50,200,0);
ellipse(0,x,20,20);
fill(100,140,220);
ellipse(10,x+50,40,40); }
}




