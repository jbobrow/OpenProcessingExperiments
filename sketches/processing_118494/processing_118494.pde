


int eSize = 3;
size(510, 510);

background(5);

 
  for(int x = 0; x <= width; x ++ ) {
    

    
    stroke(x, 100, 155, 107);
    line(0, 250, x, height);
   
    stroke(x, 100, 155, 107);
    line(0, 250, x, 0);
    
    
       stroke(x, 0,0,107);
    line(510, 250, x, height);
  
    stroke(x,0,0, 107);
    line(510, 250, x, 0);
    
    
    stroke(x, 100, 255, 107);
    line(120, 250, x, height);
   
    stroke(x, 100, 255, 107);
    line(120, 250, x, 0);
   
   
    stroke(x, 100, 55, 107);
    line(400, 250, x, height);
  
    stroke(x, 100, 55, 107);
    line(400,250,x,0);
   
 
      stroke(2,25,25,55);
    line(255,255,x,510);
    
    stroke(2,25,25,55);
    line(255,255,x,510);
    
         stroke(2,25,25,55);
    line(255,255,x,0);
    
    stroke(2,25,25,55);
    line(255,255,x,0);
    
  }
  for(int i =100; i>=0; i --){
   
  stroke(255,160,255);
 ellipse(width/2,height/2,i,i);
 }
 



