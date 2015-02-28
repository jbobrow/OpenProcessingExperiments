
float a, b;  
  
void setup(){  
  a= 6;  
  b = 100;  
  size(500, 500); 

  smooth();  
}  
  
void draw(){   
    background(0);  
  
  for(float y =b; y <= height-a; y += b){  
    for(float x = a; x <= width-a; x += b){  
      float d;  
      d = dist(mouseX, mouseY, x, y);  
     float diam;  
    diam = map(d,0, 7*height, 9, 10);   
    stroke(255); 
    fill(#98115B);
  
   ellipse(x,y,d,d);  
   
    }  
  }  
}  
 


