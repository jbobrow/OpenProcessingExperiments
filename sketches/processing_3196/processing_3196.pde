
 
PImage perro_ritoque;  
  
int col;  
float r,g,b,bright;  
  
void setup() {  
  size(604,348);  
    
 perro_ritoque=loadImage("perro_ritoque.jpeg");  
    
  noLoop();  
  smooth();  
 
  background(9);  
}  
  
void draw() {  
    
  stroke(255);  
  for(int i=0; i<60; i++) {  
    for(int j=0; j<60; j++) {  
      col=perro_ritoque.get(i*10,j*10);  
      r=red(col);  
      g=green(col);  
      b=blue(col);  
      bright=(brightness(col)/255)*2;  
        
      fill(r,g,b);  
      strokeWeight(bright/1);  
      quad(i*10, j*10+10, i*10+10, j*10, i*10, j*60, i*10, j*10);  
    }  
  }  
  saveFrame();  
  
  
} 


