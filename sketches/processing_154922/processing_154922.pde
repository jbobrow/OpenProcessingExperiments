
int x;
void setup(){
  size(500,500);
 x=100;
}

void draw(){
  stroke(random(255));
  background(random(255),random(255),random(255));
  float r=random(255);
  fill(random(255),random(255),random(255));
  
  rectMode(CENTER);
  rect(mouseX,mouseY,50,50);
  
  ellipse(mouseX,mouseY,r,r);
  ellipse(x,200,50,50);
  ellipse(x,x,50,50);
  ellipse(x,x,x,x);
  if(x<500){
    x=x+1;
  }
  
}
