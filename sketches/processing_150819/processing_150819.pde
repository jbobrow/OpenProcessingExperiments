

float left; 


float right; 
void setup()  


{ 

  size(1024,720, P3D); 
  smooth(0); 
  background(0); 
} 

void draw()  
{ 
  background(0); 
  translate(width/2,height/2);   
  for(int i = 0; i < 500; i++) { 
    noStroke();
    fill(255,100); 
    rotateX(left-float(i)*2); 
    rotateY(right);
    rotateZ(0);
   translate(i,0,0); 
    box(40);
  } 

  left -= 0.001; 
  right += 0.002; 
} 

void mousePressed(){ 
  noLoop(); 
} 
void mouseReleased(){ 
  loop(); 
} 
