
int x;
int y;

void setup(){
 
 background(0);
 size(500,500);
 smooth();
 
}

void draw(){
  stroke(20,0,162);
  
  line(x,y,0,500);
  x= x +10;
  
  line(500,0,x,y);
  y=y+5;
  
  line(0,x,x,y);
  x=x+100;
  

 

  
}

