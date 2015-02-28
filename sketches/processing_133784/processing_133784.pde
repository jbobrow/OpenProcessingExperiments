

float xpos, ypos; 

float xspeed= 15.6; 
float yspeed= 16.3; 
float xdirection=1; 
float ydirection=1;

void setup(){
  size(400,400);
  background(0);
  
}

void draw(){
  noFill();
  frameRate(24);
  
  stroke(random(255),random(255),random(255));
  
  float mx= constrain(xpos, 0,width);
  float my= constrain(ypos, 0,height); 

  
  xpos= xpos+(xspeed*xdirection);
  ypos= ypos+(yspeed*ydirection); 
  
  beginShape();
  vertex(width/2, my);
  vertex(width - mx, height/2);
  vertex(width/2, height-my); 
  vertex(mx, height/2);
  endShape(CLOSE);
  
  beginShape();
  vertex(width/2, my - height/6);
  vertex(width- mx + width/6, height/2);
  vertex(width/2, height-my + height/6); 
  vertex(mx - width/6, height/2);
  endShape(CLOSE);
  
    beginShape();
  vertex(width/2, my - height/3);
  vertex(width- mx + width/3, height/2);
  vertex(width/2, height-my + height/3); 
  vertex(mx - width/3, height/2);
  endShape(CLOSE);
  
    beginShape();
  vertex(width/2, my - height/2);
  vertex(width- mx + width/2, height/2);
  vertex(width/2, height-my + height/2); 
  vertex(mx - width/2, height/2);
  endShape(CLOSE);
  
    beginShape();
  vertex(width/2, my - 4*height/6);
  vertex(width- mx + 4*width/6, height/2);
  vertex(width/2, height-my + 4*height/6); 
  vertex(mx - 4*width/6, height/2);
  endShape(CLOSE);
  
    beginShape();
  vertex(width/2, my - 5*height/6);
  vertex(width- mx + 5*width/6, height/2);
  vertex(width/2, height-my + 5*height/6); 
  vertex(mx - 5*width/6, height/2);
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





