
int x=300;
int speed=1;
int y=300;
void setup(){
  size(600,600);
  background(0);
}
void draw(){
  
  
  fill(155);
  ellipse(x,200,100,y);
  ellipse(200,y,100,x);
  
  x=speed-x;
  y=speed-y;
  
  if(x<width){
    speed=speed*-1;
  }
  else if(x<0){
    speed=speed*-1;
  }
  if(y<height){
    speed=speed*+1;
  }
  else if(y<0){
  speed=speed*-1;
}
  
}
void keyPressed(){
  if(key=='a'){
    background(155,0,154);
    
    
    
  }
}


