
int c;
int x, y;  
int eSize; 


void setup() { 
  size(500, 500); 
  colorMode(RGB,360);
  smooth(); 
  background(0); 
} 

void draw(){
} 

void mouseDragged(){ 
    noStroke(); 
    ellipse(mouseX, mouseY,30,30); 
} 

void keyPressed() { 
  switch(key) { 
  //reset  
    case '0':  
    background(0);
    break; 
  //gradatrion
    case'a': 
    noStroke(); 
    fill(mouseX,mouseY,255); 
    triangle(mouseX,mouseY, 250, 250, 251, 251); 
    break; 
  //white   
    case'w':
    fill(360);
    break;
  } 
}  



