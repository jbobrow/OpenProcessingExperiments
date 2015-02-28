
float margen, sp; 
void setup(){ 
margen = 50; 
sp = 25; 
size(500, 500); 
smooth(); 
stroke(0); 
noCursor();
}
void draw(){ 
background(#FFFCFC); 
fill(252,493); 
for(float y =margen; y <= height-margen; y += sp){ 
for(float x = margen; x <= width-margen; x += sp){ 
float d; 
d= sqrt((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y));  
    
    smooth(); 
stroke(0,20); 
fill(147, 7, 68, 100); 
triangle(y, x , d, d, d, d); 

 d= sqrt((mouseX-x)-(mouseX-x)*(mouseY-y)+(mouseY-y));  
rect(x, y , 800/d, 800/d); 
triangle(x, y, d*d, d*5/3, d*d, d*4/d); 
fill(mouseX, mouseY, 0, 255); 
    
  
 
 
    } 
 
  }
 
}


