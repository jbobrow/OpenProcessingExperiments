
size(500, 280);
background(255);
for (int y = 0; y < height; y += 10){
 for (int x = 0; x < width; x += 10){
  if (random(1) > 0.5) {
   line(x, y, x+10, y+10);
  } else {
   line(x, y+10, x+10, y);
  } 
 } 
} 
