
float a, b;  
  
void setup(){  
  a = 0;  
  b = 30;  
  size(800, 500); 
  smooth();  
}  
  
void draw(){ 
 background(0);  
   for(float y =a; y <= height-a; y += b){  
    for(float x = a; x <= width-a; x += b){  
      float d;  
      d = dist(x, y, mouseX, mouseY);  
     float c;  
    c = map(x,y,mouseY, mouseX, 100);   
    stroke(255,100); 
    strokeWeight(1);
    
      fill(mouseX,0,90,10);  
  
    ellipse(x,y,c,c);  
    }  
  }  
}  
 


