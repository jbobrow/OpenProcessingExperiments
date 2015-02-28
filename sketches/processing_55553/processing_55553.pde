
float speed = 3; 
float gravity = 0.1; 
float y = 0;
float m = 1;

void setup() {
  translate(250,250);
  size(500,500);
  background(#7E00B4);
  smooth();
  strokeWeight(0.1);
}

void draw() {
  ellipse(mouseX,y,m+=0.1,m+=0.1);
  y=y+speed;
  speed=speed+gravity;
  if(mousePressed){
    fill(random(0,255));
  }
  if(y>height){
    speed=speed*-0.90;
  }
  
  
  } 


