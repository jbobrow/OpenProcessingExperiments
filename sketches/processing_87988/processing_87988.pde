
//Color spacing
int d;

void setup(){
size(600,200);
smooth();
background(#FFFFFF);
colorMode(HSB,360,100,100);
rectMode(CENTER);

}

void draw(){
  
d = 150;

fill(360*1/5,100,100,100);
rect(width*1/6,height/2,d,d);

fill(360*2/5,100,100,100);
rect(width*2/6,height/2,d,d);

fill(360*3/5,100,100,100);
rect(width*3/6,height/2,d,d);

fill(360*4/5,100,100,100);
rect(width*4/6,height/2,d,d);

fill(360*5/5,100,100,100);
rect(width*5/6,height/2,d,d);

}
