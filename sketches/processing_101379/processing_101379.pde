
void setup(){
  
  size(400,400);
  background(255);
  //noLoop();
  frameRate(5);
}


void draw(){
  //background(255);
  fill(200,80);
  rect(0,0,width,height);
  noStroke();
  fill(180);
  drawCircle(width/2,height/2,width/2,height/2,10);
  
  
}


void drawCircle(float x, float y, float w, float h, int recursion){
  
  ellipse(x,y,w,h);
  
  recursion-=1;
  if(recursion>1){
    fill(random(255),random(255),random(255),80);
  drawCircle(random(width), random(height), w-=20, h-=20, recursion);
  }
}
