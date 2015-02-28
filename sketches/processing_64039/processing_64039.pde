
int x;

void setup(){
  size(400,400);
  background(0);
  smooth();
}

void draw(){
  noStroke();
  fill(0,10);
  rect(0,0,width,height);
  
  stroke(random(80,180),random(255),255);
  strokeWeight(random(5,20));
  
  line(x,random(height),x,random(height));
  
  x+= 10;
  
  filter(BLUR,1);
  
  if(x > width){
    x = 0;
  }
}

