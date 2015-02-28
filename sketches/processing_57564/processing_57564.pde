



Fader fader1;
void setup(){
  size(600,600);
  fader1 = new Fader(10,10);
}

void draw(){
  background(185,185,185);
  
  fader1.update(mouseX,mouseY);
  fader1.display();
  
 

}

class Fader{
  int x, y;
  int xpos, ypos; //x and y position of fader
  boolean over;
  float counter;
  Fader(int _x, int _y){
    x = _x;
    y = _y;
    xpos = x;
    ypos = y;
    
   
    over = false;
  }
  void update(int mx, int my){
  if(mx< 20+xpos && mx < 510+xpos && my > 0+ypos && my<300+ypos){
  
    over = true;
  } else {
    over = false;
  }
  }
 
void move(){
  //add move code here
  
}

float display(){
  line(0+x,25+y,500+x,25+y);
  for (int i = 0; i < 510; i = i+20) {
    line(i+x, 40+y, i+x, 10+y);
  }

 if(over){
  //fill(60,55,67); 
   
 }else {
   fill(255);
 }
  rect(0+xpos,0+ypos,10+x,40+y);
  return counter;
  
  }
  void drag(){
 if(over){
   xpos = constrain(mouseX,10,490);
   
  
 }
   
}  

}

void mouseDragged(){
    
  fader1.drag();
  
}


