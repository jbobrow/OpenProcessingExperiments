
  size(500, 1800);
  
 for (int i = 0; i < 5000; i = i + 10) 
  {
   for (int x = 0; x < 5000; x = x + 10) 

    {
if (x<200) { fill(13,13 ,12 );}
else if (x>400) {fill(254, 255 ,0 );}
else {fill(255,0 , 21);} 
      
      
      ellipse(i, x, 10 , 10);
    }

  }




