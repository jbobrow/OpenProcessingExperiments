

float r=0;
int growthRate=1;

void setup(){
  size(200, 200);
}

void draw(){
  background(255);
   r = growthRate;
   
  if(r <= height && r <= width){
  stroke(0);
  fill(175);
  rectMode(CENTER);
  rect(width/2, height/2, r, r);
  growthRate++;
  }//if
  
  if(r > height && r > width){
   growthRate = growthRate*-1
  }//if
}
