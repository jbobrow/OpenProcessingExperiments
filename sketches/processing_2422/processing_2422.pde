
/*Crawlers
ak@angelakwong.com
June 09
code from
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

*/


// An array to keep track of how often random numbers are picked.
float[] randomCounts;

void setup() {
  size(400,400);
  randomCounts = new float[40];
}

void draw() {
  background(255);
  
  // Pick a random number and increase the count
  int index = int(random(randomCounts.length));
  randomCounts[index] ++ ;
  
  // Draw a rectangle to graph results
  stroke(0);
  fill(random(175),random(110),random(0,244));
  for (int x = 0; x < randomCounts.length; x ++ ) {
    rect(x*17,210,15,randomCounts[x]);
  }
}


