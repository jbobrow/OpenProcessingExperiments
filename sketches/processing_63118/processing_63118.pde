

background(20);
size(600, 600);
  
 translate(width/2,height/2);
   
  for ( int i= 0; i < width/2; i += 2) {
    for ( int j = 0; j < height/2; j += 2) {     
        stroke(0,255,255);     
        point( i/2, j*10);   
        point( -i*3,j*5);   
        point( -i, j/4);   
        point( i*3, -j-100); 
        point( -i*10, -j);    
    }
    
  }

