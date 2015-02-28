
boolean button = false;

int circleX=100;
int circleY=100;

void setup(){
  size(200,200);
  smooth();
 
}
void draw(){
   background(100);
   if(button){
  circleX=circleX+1;
   }
   stroke(255);
  fill(0);
  ellipse(circleX,100,50,50);
    if (circleX > 250){
    
  circleX=-50;
  }

}
void mousePressed(){
  button = !button;
}

