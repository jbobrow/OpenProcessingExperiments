
int x;
int y;

void setup(){
  size(600,600);
}

void draw(){
  background(0);
  
  x = 0;
  y = 0;

 
 while( y < 600 ){
   x = 0;
 while ( x < 600 ){
   fill(100,0,200);
  rect(x,y,25,25);
   fill(200,0,100);
  ellipse(x,y,44,44);
   fill(0,0,150);  
   ellipse(x,y,10,10);
   fill(50,0,50);
  rect(x,y,40,10);
   fill(200,0,200);
  x = x + 50;
  }
  y = y + 30;
}

}

