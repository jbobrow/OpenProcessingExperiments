
// a program modified from Nature of Code // 
// a graph that visualizes the random function //


int [] randomCounts; // an arary to keep track of how often random #'s are picked

void setup() {
  size(640, 240);
  randomCounts = new int[20];
}

void draw() {
   background (255);
   
   int index = int(random(randomCounts.length)); // pick a random num and ++ count
   randomCounts[index]++;
   
   // graph the results
   
   stroke(0);
   fill(41, 211, 158);
   int w = width/randomCounts.length;
   for (int x = 0; x < randomCounts.length; x++) {
     rect(x*w, height-randomCounts[x], w-1,randomCounts[x]);
   }
}
     


