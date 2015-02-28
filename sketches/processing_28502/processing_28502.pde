
void setup(){
  size (500, 500);
  background (0);
  smooth();
}

void draw(){
  for(int y = 0; y <= height; y = y +35) {
     for(int x = 0; x<= width; x = x + 35){
     
     noStroke();
          
     fill(220);  
     ellipse(x, y, 10, 10);
     
          fill(200);  
     ellipse(x+5, y, 10, 10);
     
          fill(180);  
     ellipse(x+10, y, 10, 10);
     
               fill(160);  
     ellipse(x+15, y, 10, 10);

               fill(140);  
     ellipse(x+20, y, 10, 10);     
     
                    fill(120);  
     ellipse(x+25, y, 10, 10); 
     
                         fill(100);  
     ellipse(x+30, y, 10, 10); 
     
                              fill(80);  
     ellipse(x+35, y, 10, 10); 
     
     
          fill(220);  
     ellipse(x, y, 10, 10);
     
          fill(200);  
     ellipse(x+5, y+5, 10, 10);
     
          fill(180);  
     ellipse(x+10, y+10, 10, 10);
     
               fill(160);  
     ellipse(x+15, y+15, 10, 10);

               fill(140);  
     ellipse(x+20, y+20, 10, 10);     
     
                    fill(120);  
     ellipse(x+25, y+25, 10, 10); 
     
                         fill(100);  
     ellipse(x+30, y+30, 10, 10); 
     
                              fill(80);  
     ellipse(x+35, y+35, 10, 10); 
     }
   }

   
  
}

