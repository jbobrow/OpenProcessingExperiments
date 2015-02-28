
void setup(){
  size(200,200); 
}

void draw(){
  strokeWeight(2);
  //top left square
  fill(distance(0,0,mouseX,mouseY),255,0);
  rect(0,0,width/2,height/2);
  //top right square
  fill(0,distance(width/2,0,mouseX,mouseY),0);
  rect(width/2,0,width/2,height/2);
  //down left square
  fill(0,0,distance(0,height/2,mouseX,mouseY));
  rect(0,height/2,width/2,height/2);
  //down right square
  fill(255,0,distance(width/2,height/2,mouseX,mouseY));
  rect(width/2,height/2,width/2,height/2);
}

float distance (float x1, float y1, float x2, float y2 ){
  float dx = x1-x2;
  float dy = y1-y2;
  float total = sqrt(dx*dx + dy*dy);
  return total;  
}
