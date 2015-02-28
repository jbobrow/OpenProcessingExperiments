
//HW - 5 
// Sarah Lesnikoski
/*    Some colors are able to play complimentary roles between two grounds. 
      When apart from each other, the active color appears to be opposing the
      ground it surfaces while the far ground mimicks it. 
      The true color can only be seen as it is, met in the middle. */

float r = 0;
float theta = 0;

void setup() {
  size(600,600);
  background(65,230,150);
  noStroke();
  fill(165,58,240);
  rect(0,300,600,600);
  smooth();
}
void draw() {
  float x = r * cos(theta);
  float y = r * sin(theta);
  noStroke();
  fill(130,188,221);
  rect(x + width/2, y + height/2,3,20);

 theta += 0.02;
 r += 0.2;
} 

/* I used excercises from Learning Processing, by Daniel Shiffman.
   Example 13-5: Polar to Cartesian, helped me to write this code.
   3 colors appears as 2 methods- Albers. */


