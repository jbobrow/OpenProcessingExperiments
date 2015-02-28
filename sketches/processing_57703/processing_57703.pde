
void setup(){
  size(500,500);
  stroke(255);
  strokeWeight(2);
}
float x=0;

void draw(){
  point(0,0);
   translate(width/2,height/2);
 background(0,10);
  rotate(x);
  stroke(255);
  line(mouseX/2,0,-mouseY/2,0);
  x+=.05;
  stroke(255,255,255,20);
  line(0,0,250,0);
  
}

