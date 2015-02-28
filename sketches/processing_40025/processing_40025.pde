
// Jennifer Lau
// Exercise: Lines #1

size (800, 800);
smooth ();
background (0);

//Variables
int e= 25;


for (int y=20; y < width; y = y + e) {
  for (int x=20; x < height; x = x + e) {
    
    stroke (235);
    strokeWeight (1);
    line (0, y, width, height);
    line (x, 0, width, height);
    line (0, x, width/2+height, height);
    line (y, 0, width/2+height, height);
  }
}

