
float x=0;
float y=0;
float col;
float siz=0;
float d=1;
void setup() {
  size(500, 500);
  background(100);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
  
 triangle(250,400,150,500,350,500);
   triangle(350,0,250,100,150,0);
   triangle(250,250,500,150,500,350);
  triangle(250,250,0,150,0,350);
}

void draw() {
 

  
  
  
  fill(col);
//NW,NE,SW,SE
  rect(width/2+x, height/2+y, 5+siz, 5+siz);
  rect(width/2-x, height/2+y, 5+siz, 5+siz);
  rect(width/2+x, height/2-y, 5+siz, 5+siz);
  rect(width/2-x, height/2-y,5+siz, 5+siz);
  

  
  //NESW
  rect(width/2, height/2-y, 5+siz, 5+siz);
  rect(width/2-x, height/2, 5+siz, 5+siz);
  rect(width/2, height/2+y, 5+siz, 5+siz);
  rect(width/2+x,height/2,5+siz,5+siz);
    fill(col+20);
    while(d<50){
  ellipse(width/2,height/2,d,d);
  d=d+1;
    }
  col=x;
 


 
  siz=siz+0.5;
  
  x=x+2;
  y=y+2;
}


