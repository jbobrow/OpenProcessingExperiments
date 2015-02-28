
void setup(){
  size(500,500);
  smooth();
  
}

void draw(){
  background(0);
  fill(255);
  ellipse(width/2,height/2,width/4,height/6);
  fill(0);
  ellipse(mouseX,height/2,width/10,height/10);
  rect(0,map(mouseY,0,height,125,175),width,height/6);

}

