
void setup(){
 size(400,400);

}

void draw(){
  noStroke();
  background(255,255,255);
  fill(180);
  ellipse(200,200,mouseX,mouseY);
  fill(255);
  ellipse(mouseX,mouseY,100,100);
}

void keyPressed(){
  if(key == 'm'){
  fill(100);
  
}else fill(190,150,10);

}

