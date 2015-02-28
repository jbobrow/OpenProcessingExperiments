
int r = 0;
int g = 0;
int b = 0;

void setup(){
  size(1000,500);
  smooth();
  noFill();
}

void draw(){
  background(0);
 
  
  for(int x=0; x <= width; x += 10){
    r+=100;
    g+=20;
    for(int y=0; y <= height; y+= 10){
      b+=10;
     stroke(r,g,b); 
  rect(x,y,100,100);
}
r = 0;
b = 0;
g = 0;
}
}
