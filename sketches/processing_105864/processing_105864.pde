
void setup() {
  size(600, 600);
}

int circleSize=20;

void draw() {
  background(0);
  fill(255);
  for (int i=0;i<width/circleSize*2;i++) {
    for (int j=0;j<height/circleSize*2;j++){
      
      float disT=dist(circleSize+circleSize*4*i, circleSize+circleSize*4*j, mouseX, mouseY);
     
      
      ellipse(circleSize+circleSize*4*i, circleSize+circleSize*4*j, circleSize-disT/25, circleSize-disT/25);
  
 
}
  }

//boolean Check(int _buttonNumber){
  //return mouseX>((200+40*_buttonNumber)-10)&& mouseX<((200+40*_buttonNumber)+10)&& mouseY>290 && mouseY<310;
}



