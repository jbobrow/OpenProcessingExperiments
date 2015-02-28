
void setup(){
  size (800, 250);
  background (0);
  smooth();
}
 
void draw(){
  for(int y = -30; y <= height; y = y + 30) {
     for(int x = -10; x<= width; x = x + 40){
      
     if (mousePressed==true){ 

      
     noStroke();          
      
          fill(220); 
     rect(x, y, 10, 10);
      
          fill(200); 
     rect(x+5, y+5, 10, 10);
      
          fill(180); 
     rect(x+10, y+10, 10, 10);
      
               fill(160); 
     rect(x+15, y+15, 10, 10);
 
               fill(140); 
     rect(x+20, y+20, 10, 10);    
      
                    fill(120); 
     rect(x+25, y+25, 10, 10);
      
                         fill(100); 
     rect(x+30, y+30, 10, 10);
      
                              fill(80); 
     rect(x+35, y+35, 10, 10);
     
      fill(70); 
     rect(x+40, y+40, 10, 10);
     
       fill(60); 
     rect(x+45, y+45, 10, 10);
   
       fill(50); 
     rect(x+50, y+50, 10, 10);  
     
         fill(40); 
     rect(x+55, y+55, 10, 10);
     
     }else{
       stroke (0);
  fill (0);

              
      
          fill(220); 
     rect(x, y, 10, 10);
      
          fill(200); 
     rect(x-5, y+5, 10, 10);
      
          fill(180); 
     rect(x-10, y+10, 10, 10);
      
               fill(160); 
     rect(x-15, y+15, 10, 10);
 
               fill(140); 
     rect(x-20, y+20, 10, 10);    
      
                    fill(120); 
     rect(x-25, y+25, 10, 10);
      
                         fill(100); 
     rect(x-30, y+30, 10, 10);
      
                              fill(80); 
     rect(x-35, y+35, 10, 10);
     
      fill(70); 
     rect(x-40, y+40, 10, 10);
     
       fill(60); 
     rect(x-45, y+45, 10, 10);
   
       fill(50); 
     rect(x-50, y+50, 10, 10);  
     
         fill(40); 
     rect(x-55, y+55, 10, 10);
       
    
    
 

     
   }
   }
 
    
   
  }
}

