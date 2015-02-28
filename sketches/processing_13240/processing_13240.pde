
void setup(){
  size(400,400);
  smooth();  
  background(0);
}
int prevX,prevY=0;
int value = 0;
void draw(){

  line(prevX,prevY,mouseX,mouseY);
  stroke(255);
  prevX = mouseX;
  prevY = mouseY;

  if (mousePressed && mouseButton == RIGHT){
    background(0);
    value = 0;
    strokeWeight(value);

  }


}

void mouseDragged() 
{
  strokeWeight(value);
  value = value + 1;
  if (value > 100) {
    value = 0;
  }
}
                
