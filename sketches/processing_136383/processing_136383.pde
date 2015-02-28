

  size(500, 500);
  background(255,50,100);
  


    
    for (int i=0; i<width; i=i+75) {
    for (int j=0; j<height; j=j+75) {
   
      noStroke();
      fill(200,10,216,155);
      ellipse(i+15, j+20, 50, 50);
   
      
      fill(200,10,216,155);
      ellipse(i+15, j+0, 50, 50);
   
   
      fill(252,120,100,100);
      ellipse(i+10, j+10,50, 50);
    
       
      fill(230,75,175,150);
      ellipse(i+20, j+10, 50, 50);
    
    }
  }
  



