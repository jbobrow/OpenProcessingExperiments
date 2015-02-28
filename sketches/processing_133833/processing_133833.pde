
int a = 400;
float xpos, ypos; 

float xspeed= 4.6; 
float yspeed= 5.3; 
float xdirection=1; 
float ydirection=1;

void setup(){
  size(400,400);
  smooth();
  background(0);
}

void draw(){
  noFill();
  frameRate(24);
  
  stroke(255,10);
  
  float mx= constrain(xpos, 0,400);
  float my= constrain(ypos, 0,400); 

  
  xpos= xpos+(xspeed*xdirection);
  ypos= ypos+(yspeed*ydirection); 
  
  beginShape();
  vertex(200, my);
  vertex(400- mx, 200);
  vertex(200, 400-my); 
  vertex(mx, 200);
  endShape(CLOSE);
  

 
  if (xpos>width){
  xdirection=xdirection*-1;
  } 
  
   if (xpos<0){
  xdirection=xdirection*-1;
  } 
  
  if(ypos>height){
  ydirection=ydirection*-1;
  }
  
  if(ypos<0){
  ydirection=ydirection*-1;
  }
}





