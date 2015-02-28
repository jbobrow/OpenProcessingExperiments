
class Catcher{
  color c;
  float xpos;
  float ypos;
  float w;
  float h;

Catcher(color tempC, float tempXpos, float tempYpos, float rectwidth, float rectheight){
  c = tempC;
  xpos = tempXpos;
  ypos = tempYpos;
  w = rectwidth;
  h = rectheight;
}  
void display(){
  
  stroke(0);
  fill(c);
  rectMode(CENTER);
  rect(xpos, ypos,w,h);
  }


void drive(){
 
  if(xpos > width){
    xpos = width;
  }
  if(xpos < 0){
    xpos = 0;
  }
   if(ypos > height){
    ypos = height;
  }
  if(ypos < 0){
    ypos = 0;
  }
  ypos = mouseY;
   xpos = mouseX;
}
}

