
float margen, lm;  
void setup(){  
 
  lm=40;  
  size(800,500);  
    
}  
  
void draw(){  
  background (#B867BC);  
    smooth();
  for(float y=  margen; y <= height-margen; y += lm){  
    for (float x = margen; x <=width-margen; x += lm*3){  
     
      float d;  
   d= 60 - sqrt((mouseX - x)*(mouseX - x)+(mouseY - y)*(mouseY -y));  
         
      ellipse(x,y,d,d);   
        fill(#0CF5A1,50,50,50);
}  
}  
}  


