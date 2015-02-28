

size (600,600);
background(255);
  for (int i= 0; i<255; i++){//color
  
   for (int y = 0; y < 600; y ++) {//position
 
    noStroke();
fill ( i*2.5, random (255), random (255));
    ellipse (i*4, y+10, 50, 50);
      
   }
  }




