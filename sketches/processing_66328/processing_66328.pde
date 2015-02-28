
float x=random(20,380);
float y=random(20,380);
float xv=random(-5,5);
float yv=random(-5,5);


void setup(){
  size(400,400);
  smooth();
  noStroke();
  frameRate(random(100,400));
}

void draw(){
  background(0);
  x=x+xv;
  y=y+yv;
  if(x>=width-20){
  xv=-xv;  
  }
  if(x<=20){
  xv=-xv;  
  }
  if(y>=width-20){
  yv=-yv;  
  }
  if(y<=20){
  yv=-yv;  
  }
  ellipse(x,y,40,40);
}

