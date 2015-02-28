
float a, b, p;  

void setup(){  
  a = -10;  
  b = 60; 
  size(700, 500); 
  smooth();  
  
}  

void draw(){  
  background(0, mouseY, mouseX, 100); 
  for(float y =a; y < height; y += b){  
    for(float x =a; x < width; x += b){  
     
      float d;  
      d = dist(mouseX, mouseY,x,y);  
      float c;  
      c = map(d,0, width, 5, 100); 
      stroke(255,100);  
      strokeWeight(1);
      noFill();  
      
      triangle(x, y, mouseX, mouseY, a, b); 
      triangle(x, y, a, b, mouseX, mouseY);
      triangle(a, b, mouseX, mouseY, x, y);
      triangle(x*mouseY, y*mouseY, mouseX, mouseY, a, b); 
      triangle(x, y, a*mouseY, b*mouseX, mouseX, mouseY);
      triangle(a, b, mouseX*2, mouseY*2, x, y);
      
  noCursor();
  noStroke();
  fill(mouseX,mouseY,0,50);
  ellipse(mouseX,mouseY,10,10);
    }  
  }  
}  




