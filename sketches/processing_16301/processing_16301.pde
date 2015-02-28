
PFont t;

void setup(){size(500,500);
t=loadFont("ArialMT-48.vlw");
textFont(t);
frameRate(6);
}

void draw(){
  n(250,250,200);
}

void n(int x,int y,int z){
  fill(random(z),0,0,50);
  textSize(random(z));
  text("X",random(x),random(y));
  
} 
