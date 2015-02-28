
void setup(){
  size(200,200);
}
void draw(){
  fill(random(256),random(256),random(256));
  ellipse(mouseX,mouseY,random(100),random(100));
}
void mousePressed(){
  loop();
}
void mouseReleased(){
  noLoop();
  redraw();
  triangle(mouseX,mouseY,random(100),random(100),random(100),random(100));
  rect(mouseX,mouseY,random(100),random(100));
}
  


