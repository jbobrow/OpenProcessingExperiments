
/* Eulani Labay. Bootcamp 2011.
*/

int line_distance = 0;
int line_space = 1;

void setup () {
  frameRate(10);
  size (256, 256);
  background (255);
}

void draw () {
   
// Fill the screen with horizontal lines 1 pixel apart: 
    for (line_distance = 0; line_distance < height; line_distance += line_space) {
      // Gradually change color of each line:
      stroke (125, (256 - line_distance), 255);
      line (0, line_distance, width, line_distance);
    }

}
  
  

