
//week2 - assignment by Andrea Pagan
//original code 2/4/15

int x = 0;
int y = 0;
int a = 0;
int s = 0;

void setup(){

 size(200,200);
 frameRate(20);
}

void draw(){
  
  background(0);
  fill(127,0,0);
  rect(x,y,a,s);
 
  x = x+5;
  y = x-1;
  a = a+1;
  s = s+1;
  ellipse(x,10,a,s);
  ellipse(10,y,a,s);
  
}
