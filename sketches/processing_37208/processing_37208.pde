
//quiz 2 do
// 10 points.
// A 10x10 grid of down-pointing isosceles triangles are drawn on the canvas. 
// A single variable controls the size and spacing of the triangles. 
// The triangles are exactly as tall as they are wide. 
// The triangles are spaced at intervals equal to one-and-a-half times their width.
// Each row of triangles is a darker and darker gray;
// The top row is exactly white, and the bottom row is exactly black.


size (400, 400); 
background(255);
fill(255, 0, 0); 
float sx = 50;
int pr=10;// the size and the spacing

 
for (int x=1; x<500; x=x+pr*5) {
    for (int y=1; y<500; y=y+pr*5) {  
      fill (0+y,0+y,0+y);
      triangle(sx+x, sx+y,(sx+pr/2)+x,(sx+pr)+y,(sx+pr)+x,sx+y);
    }
} 
                
