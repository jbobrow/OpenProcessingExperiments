
int colors[]; 
 
void setup(){ 
  colors = new int[30]; 
   for (int i = 0; i < 10; i++){ 
     colors[i] = (int)random(30,400); 
   } 
   
  size (300,200); 
} 
 
void draw(){ 
 background(250); 
 noStroke(); 
 for (int i = 0; i < 10; i++){ 
    fill(colors[i]); 
    rect(i*25+50,50,250,450);  
 } 
} 
 
void mousePressed(){ 
   for (int i = 0; i < 10; i++){ 
     colors[i] = (int)random(0,255); 
   } 
} 

