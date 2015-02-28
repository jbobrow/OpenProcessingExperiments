
// SIMONE ROTH, 8 x 8 grid, PS1_4 //

void setup () {
  size (401, 401);
  smooth();
  strokeWeight(3);
}
 
 void draw () {
   for (int y = 0; y < height; y += 50) {
     for (int x = 0; x < width; x +=50) {
       rect (x, y, 50, 50);
       fill(240, 192, 162);
     }
   }
 }
 
 
 
 

