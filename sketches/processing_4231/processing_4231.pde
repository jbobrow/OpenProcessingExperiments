
int number = 25;
int a = 0, b = 255, c = 0;
 
void setup() { 
   
  size(400, 600); 
  background(0); 
  fill(255, 0, 0); 
  frameRate(10); 
 
 
} 
 
void draw() { 
   
 for(int i = 0;i<number;i++) {     
   for (int j = 0;j<number;j++) { 
     fill(random(a), random(b), random(c)); 
     noStroke(); 
     ellipse(i*(width/number), j*(width/number), (width/number)-2, (width/number)-2); 
   } 
 } 
} 
   
   
void mousePressed() { 
   
  a = (int)random(255);  
  b = (int)random(255); 
  c = (int)random(255); 
} 


