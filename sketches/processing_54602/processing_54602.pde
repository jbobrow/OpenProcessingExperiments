
size (250,250);
// size of image
background (255);
 // colour of background 
smooth ();
 // smooth out lines
for (int j=10; j<120; j+=20){
  //loop for processing to draw the 4 quadrants
  line (125, j, j+130, 125);
  // top left quadrant
  line (125, j+130, j, 125);
  //top right quadrant
  line (125, -j+120, j, 125);
  //bottom left quadrant
  line (125, 250-j, j+130, 125);
  //bottom right quadrant
}  
