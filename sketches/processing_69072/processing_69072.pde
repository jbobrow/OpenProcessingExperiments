
size (400, 400);

fill (255, 0, 0);

for (int i = 10; i <= width ; i = i +20) {
  
  for (int j = 10 ; j <= height; j = j +20){
    
   for (int k = 10 ; k  <= width ; k = k + 20){
     
   triangle (i, j, k, i + 10, j +10, k +10);
  }
   }
  }
