

float vx=2;
float vy=0;
float x=0;
float y=10;
float frictionx = .998;
float frictiony = -.75;
float gravity =.07;

void setup(){
  size(800,600);
  
}

void draw(){
  background(255);
  if(mousePressed){
    background(233,255,0);
  }
  vy+=gravity;
  vx*= frictionx;
  x+=vx;
  y+=vy;
  if(y>height){
    y= height;
    vy*=-1;
  }else if(y<0){
  vy*=-1;
  } 
  fill(5);
  ellipse(x,y,5,5);
  if(x>width){
    vx*=-1;
  }else if(x<0){
   vx*=-1;
  }
  if(dist(x,y,400,300)<30){
    text("YOU WIN!",420,320);
    vx=0;
    vy=0;
  }else if(dist(x,y,800,600)<30){
    text("YOU LOSE!",730,580);
    vx=0;
    vy=0;
  }
  fill(255,0,0);
  ellipse(400,300,30,30);
  fill(255);
  ellipse(400,300,20,20);
  fill(255,0,0);
  ellipse(400,300,10,10);
}

void mouseReleased(){
  vy-=1.5;
}

