


  size(500, 500);
  background(255);
  smooth();
  
 for (int i=0; i<width; i+=15){
   for(int x=0; x<width; x+=15){
    fill(i);
    rect(i, x*2 , 20, 20);
  
   }
  }

