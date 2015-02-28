
size(300,300);

noStroke();
for (int a = 0; a < 300; a += 10) {
   for (int b = 0; b < 300; b += 10) {
                fill((b+a) * 0.4, 255, 10, 100);
                rect(b, a, 10, 10);
               
} 
}

stroke(255, 153, 51);
for (int x= 5; x < 300; x += 25) {
  for (int y = 5; y < x; y += 25){
      line(y, x, y+10, x+50);
    line(y+10, x, y, x+50);
  
  }
} 

stroke(255, 103, 51);
for (int x= 5; x < 300; x += 25) {
  for (int y = 5; y < x; y += 25){
      line(y, -x, y+10, x-50);
    line(y+10, -x, y, x-50);
  
  }
} 





