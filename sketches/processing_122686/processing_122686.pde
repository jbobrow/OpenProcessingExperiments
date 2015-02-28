
void setup() { 
  size(600, 600); 
  noStroke(); 
  background(225); 
  fill(225); 
} 

void draw() { 
  fill(255); //siroenn
  
 if (mousePressed) {
  fill(0);
 } ellipse(mouseX,mouseY,25,25);//kuroenn
} 


void keyPressed(){ 
  switch(key) {
    case 'z':  //zennkesi
    background(225);        
    break;
    
    case 'r': //aka   
    stroke(255,0,0);  
    break;    
    
    case 'b': //ao
    stroke(0,0,255);  
    break;  
    
    case 'g': //midori   
    stroke(0,255,0);  
    break; 
  } 
} 



