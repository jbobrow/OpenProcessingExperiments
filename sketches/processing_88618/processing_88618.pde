
int n = 50;      
float y = .05;    
float dy = .02;  
color c1 = color(0, random(255), random(255)); 
                  
float noiseY;     
int x;           
 
size(600, 300);
background(#00ffc3);
stroke(200);
 
 
for(int i = 1; i < n; i++) {
  y += dy;                     
  x = i * (width/n);        
  noiseY = noise(y)*height;
   
  stroke(c1);
  
  triangle(x, height, x, noiseY, x, height);
                          
}
