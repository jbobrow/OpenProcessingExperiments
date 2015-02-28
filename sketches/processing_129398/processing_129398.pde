
 int x = 0;
 int y = 5;

void setup(){
  size(600,600);
  background(0,10,255);
}

void draw(){
  fill(#ffffff);
  

  
  while (x<600){
    line(x,20,x*2,x*2);
    x= x + 10;
  }

while(y<height){
 line (y,y, width, y);
  y = y+10;
}
rect(0,300, 300,300);
fill(255,0,0);
rect(0,350, 250, 250);
fill(0, 255, 0);
rect(0, 400, 200, 200);
fill(0, 0, 255);
rect(0, 450, 150, 150);
}



