

size ( 500 , 500 ) ;
fill (255, 0, 0);
fill (0, 255, 249); 
fill (250 ,0 ,255);

for ( int i = 10 ; i < 1000 ; i = i+15 )  {
  
  
  for( int x = 46 ; x < 1000 ; x=x+10 ){
      
      if (x<200) {fill(0, 255, 249);}
      else if ( x<300) {fill(250 ,0 ,255);}
      else {fill (255, 0, 0);}
      
      ellipse ( i , x , 10 , 10 ) ;
  }
  
  
  
}

