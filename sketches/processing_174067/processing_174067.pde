
float xB,yB,vBx,vBy, V;  
void setup() {   
  
  size(500, 500);   
  noCursor();   
  V = 0.5;
  xB = width/2;
  yB = height/2;   
  vBx = V;      
  frameRate(5000);   
  
}   
void draw(){ 
background(5000);  
  xB = xB + vBx;   
  yB = yB + vBy;    
  if(xB>width) {   
     vBx = -V;   
}    
  if(yB>height) {   
     vBy = -V;   
}      
  if(yB<0) {   
     vBy = V;   
}     
  if(xB>10 && xB<20 && yB>mouseY && yB<mouseY+40) {   
     vBx = V;   
}     
  if(xB<0) {   
     xB = width/2;   
     yB = height/2;   
}   
  
  rect(10, mouseY, 10, 40);   
  ellipse(xB,yB,10,10);   
}


