
float a, b;  
  
void setup(){  
  a= 10  ;  
  b = 100;  
  size(500, 500); 

  smooth();  
}  
  
void draw(){   
    background(0);  
  
  for(float y =b; y <= height/2; y += b){  
    for(float x = a; x <= width/2; x += b){  
      float d;  
      d = dist(mouseX, mouseY, x, y);  
     float diam;  
    diam = map(d,0, 10*height, 10, 10);   
    stroke(255); 
    fill(#DBAD16);
  
   ellipse(x,y,d,d);  
   
    }  
  }  
}  
 


