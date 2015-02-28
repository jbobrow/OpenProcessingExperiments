

background(0);
size(600, 600);
  
 translate(width/2,height/2);
   
  for ( int i= 0; i < width/2; i += 2) {
    for ( int j = 10; j < height/2; j += 2) {     
        stroke(225,218,3);     
        point( -i/3, j/4);    
        point( -i*10, -j); 
        rotate(PI/3);   
    }
    
    
  }

