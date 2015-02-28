
//comment bu resim kandisky e aittir.
int colors[];  
  
void setup(){  
  colors = new int[35];  
   for (int i = 0; i < 10; i++){  
     colors[i] = (int)random(30,300);  
   }  
    
  size (400,200);  
}  
  
void draw(){  
 background(250);  
 noStroke();  
 for (int i = 0; i < 10; i++){  
    fill(colors[i]);  
    rect(i*35+50,50,250,550);   
 }  
}  
  
void mousePressed(){  
   for (int i = 0; i < 10; i++){  
     colors[i] = (int)random(0,250);  
   }  
}  
 


