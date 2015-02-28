
int n = 50;      
float y = .05;    
float dy = .02; 



void draw() {

color c1 = color(0, mouseX/3, mouseY/4); 

                  
float noiseY;     
int x;           
 
size(600, 300);
background(256, 256, 256);
 

for(int i = 1; i < n; i++) {
  y += dy;                     
  x = i * (width/n);  
  noiseY = noise(y)*height;
      
 
   color c1 = color(mouseX/3, mouseX/3, mouseY); 
  stroke(c1);
  
  translate(-10, 0); 
  line(x, height, x, noiseY);
  strokeCap(PROJECT);
  strokeWeight(10);
  
  translate(10, 0); 
  line(x, height*-1, x, noiseY);
  strokeCap(SQUARE);
  strokeWeight(3);
  
  
                          
}


}
