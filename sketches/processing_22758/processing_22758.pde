
//03/6/2011  |  Molly Morin  |  mollymorin.com
 
//created for Emerging Formats for Digital Art, University of Notre Dame
//Examples to support Daniel Shiffman's Learning Processing, www.learningprocessing.com
//A small modification of Shiffman's random counts example

float[] randomCounts;

void setup() {
  size(1000,200);
  randomCounts = new float[20];
}

void draw() {
  background(255);
  
  // Pick a random number and increase the count
  int index = int(random(randomCounts.length));
  randomCounts[index] ++ ;
  
  // I drew a circle if diameter instead of a rectangle
  noStroke();
  fill(100, 200, 0, 100);
  for (int x = 0; x < randomCounts.length; x ++ ) {
    ellipse(x*50+25,100,randomCounts[x],randomCounts[x]);
  }
}

//void mousePressed(){
//  saveFrame("screenshot.jpg");
//}

