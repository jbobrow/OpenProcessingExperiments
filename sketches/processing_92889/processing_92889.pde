

float x;
float y = 2;
float noiseY;
float r = random(400);
  
void setup() {
   
  size(800,800);
  background(0);
   
  frameRate(10);
 
    
   
 
   
}
 
 
 
void draw() {
 
  smooth();
  stroke(random(255));
   
     
   
  
   if (noiseY >= 500) {
   noiseY = noiseY-1;
  }
   for (int i = 0; i < r; i++) {
     y+= mouseX*.0001;
     x = i * (width/r) ;
     noiseY = noise (y) * height; 
     line (x,height,x ,noiseY);
     
      
   }
    
   
    
   fill(0);
   noStroke();
   


   
   
}



