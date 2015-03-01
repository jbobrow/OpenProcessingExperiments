
float x = 400;
float y = 50;
float d=20;
float speed = 4;
float fontV;



void setup(){
  size(800,800);
  noStroke();
  smooth();
  
}

void draw(){
  background(255,255,255);
  
  //Ball
  fill(0,0,0);
  ellipse(x,y,d,d);
  
  
   //Speed
  speed=speed+0.3;
  y=y+speed;
  
  //Bounce
  if (y>height-d){
    y=height-d;
    speed=speed* -0.6;}
  
}




