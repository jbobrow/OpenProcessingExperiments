
int prevX = 0;
int prevY = 0;



void setup(){
  size(600,800);
}

void draw(){ 
  ellipse(mouseX,mouseY,prevX,prevY);
  println(dist(mouseX,mouseY,prevX,prevY));
  prevX = mouseX;
  prevY = mouseY; 
}

void mouseReleased(){
  line(mouseX,mouseY,prevX,prevY);
  println(dist(mouseX,mouseY,prevX,prevY));
  prevX = mouseX;
  prevY = mouseY; 
}

