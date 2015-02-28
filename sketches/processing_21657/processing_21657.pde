
Box[] boxs = new Box[6];

color boxColor;


void setup(){
size(300,300);
rectMode(CENTER);
noStroke();

for(int i=0; i < boxs.length;i++){
  boxColor = color(random(255),random(255),random(255),50);
  boxs[i] = new Box(boxColor,random(20,width-20),random(20,height-20), random(100));
}
}

void draw(){
  background(255);
  for(int i=0; i < boxs.length;i++){
  
    boxs[i].display();
    boxs[i].grow();
  }  
}

class Box{
  
  float xpos;
  float ypos;
  float boxSize;
  color c;
  
  Box(color c_,float xpos_,float ypos_,float boxSize_){
    c = c_;
    xpos = xpos_;
    ypos = ypos_;
    boxSize = boxSize_;
  }
  
  void display(){
    fill(c);
    rect(xpos,ypos,boxSize,boxSize);
    
  
  }
  
  void grow(){
    
    if (boxSize > width){
    boxSize = 1;
    }
    
    boxSize++;
    
  }
}
    




