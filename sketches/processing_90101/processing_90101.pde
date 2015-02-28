
int x = 300;
int y = 200;
int speed =5;

void setup(){
  size(600,600);
}

void draw(){
  background(0);
  fill(255);
  ellipse(x,y,100,100);
  
  if(x > width){
    speed = speed*-1;
  } 
  
  if (mousePressed){
    ellipse(x,y,300,300);
  }
  
  
x = x+speed-1;
y = y+speed -1;
}
