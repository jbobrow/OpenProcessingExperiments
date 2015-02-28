
/*
 *  Title: P10_01_EmbeddedData
 *  By:    Barton Poulson (artbybart.org & dataliteracy.com)
 *  Date:  05 March 2013
 *
 *  Assignment: 
 *    Create a sketch that uses data embedded in one or more arrays in
 *    the sketch file itself (the .PDE file, not the drawing). You can
 *    use real data or you can create artificial data for this exercise.
 */
 
color[] palette = {#EEEEEE, #999999, #333333};
float x;     // For x positions of circles in first example
int d = 30;  // Diameter of said circles

size(600, 200);
background(palette[0], 120);
smooth();

// This first example draws dots for values in a single array
stroke(#FF0000);
line(0, height/2, width, height/2);
// http://en.wikipedia.org/wiki/Fibonacci_number
int[] fibonacci = {0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377};
for(int i = 0; i < fibonacci.length; i++) {
  noStroke();
  fill(palette[1], 60);
  strokeWeight(2);
  x = fibonacci[i] + width/2 - 377/2;
  ellipse(x, height/2, d, d);
//  line(x, 45, x, 55);  // Or you can draw lines instead
}
                         
// The second example prints out a list of words in the console at the
// bottom of this window.
// The complete set of 9-letter words that have a Q that is NOT
// immediately followed by a U. From the Austalian Scrabble Players
// Association: http://www.scrabble.org.au/words/ulessq.htm
//String[] ulessq= {"Mbaqangas", "Muqaddams", "Qaimaqams", "Qalamdans", 
//                  "Qinghaosu", "Tsaddiqim", "Tzaddiqim"};
//println("There are seven nine-letter words in which Q is not followed by U: ");
//println(ulessq);

// Finally, two ways to show two dimensional data. For this example, I'm 
// just using x and y coordinates for circles

// A 2D array is essentially an array of arrays.
int[][] xy = {{0, 600,   0, 600},   // This first sub-array is xy[0][i]
              {0,   0, 200, 200}};  // This second sub-array is xy[1][i]
for(int i = 0; i < xy[0].length; i++) {
  fill(palette[1]);
  ellipse(xy[0][i], xy[1][i], 40, 40);
}                   
// But easier to do parallel arrays.
// This places smaller black circles on top of the last ones.
int[] ax = {0, 600,   0, 600};  // "ax" = "array x"
int[] ay = {0,   0, 200, 200};  // "ay" = "array y"
for(int i = 0; i < ax.length; i++) {
  fill(palette[2]);
  ellipse(ax[i], ay[i], 20, 20);
}
