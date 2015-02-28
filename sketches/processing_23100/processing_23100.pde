
size (300,300);
background (154, 250, 241); //make the background turquoise
smooth(); 
fill(100,198,92, 100);

/*
//draw the grid lines to draw squares 100x100
for (int i = 100 ; i < width ; i += 100) {
  for (int j = 100 ; j < height ; j += 100) {
   line (i, 0, i, width); 
   line (0, j, 300, j);
  }
}
*/

//draw a triangle in all the squares
for (int x1 = -50; x1 <= width; x1 += 100) {
 for (int y1 = 100; y1 <= height ; y1 += 100) {
   noStroke(); 
   triangle (x1 , y1,  (x1 + 50), ( y1-100),  (x1 +100) , y1);   
 }
}

//Overlay with blue layer
fill(40,99,160, 20);
for (int x1 = 0; x1 <= width; x1 += 100) {
 for (int y1 = 0; y1 <= height ; y1 += 100) {
   triangle (x1 , y1,  (x1 + 50), ( y1-100),  (x1 +100) , y1);   
 }
}
				
