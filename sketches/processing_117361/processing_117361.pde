

int eSize = 3;
 
size(510, 510);
background(255);

 
 strokeWeight(1);  
 for(int x = 0; x <=width; x ++) {    
   stroke(x, height, 50, x);   
  line(255, 255, x, 0);
  
     stroke(x, 77, height, 89);  
  line(255, 255, x, height);
  
       stroke(1, 20, height, x);  
  line(255, 255, height, x);
  
    stroke(86, 24, width, x);    
  line(255, 255, 0, x);
  
    stroke(x, 64, width, x);   
  line(255, width, x, 255);
  
   stroke(45, 23, width, x);   
  line(height, 255, 255, x);
  
   stroke(180, 180, x, height);  
  line(x, 255, 255, 0);
  
     stroke(90, x, width, 30);  
  line(0, 255, 255, x);
  }
 



