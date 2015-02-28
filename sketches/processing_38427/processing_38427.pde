
//Bryan Williams
//Computational Methods
//September 20, 2011
//Drawing Machine Project

//* please read my project inspiration at the bottom of this!!

void setup() {
  size(480, 540);
  background(220);
  smooth();
}
void draw() {
  int BRYAN = 10;
  int WILLIAMS = 10;
}
void mousePressed() {

  for (int BRYAN = 0; BRYAN < width; BRYAN+=20) { //sets x grid
    for (int WILLIAMS = 0; WILLIAMS < height; WILLIAMS+=20) {  //sets y grid
      rect(BRYAN, WILLIAMS, 20, 0);
    }  // sets up the square actions which change when clicked by the mouse
    if (mousePressed==true) {
      for (int c = 0; c <= 500; c = c+40) {
        for (int d = 0; d <= 500; d = d+60) {
          stroke(10);  // The line weights which I find a vital part of the composition are set up here
          strokeWeight(random(1.4));  //stroke weights here as well
          rect(c, d, random(100), random(100)); //this sets up the random rectangular fields
        }
      }
    }
  }
}

// My inspiration for this drawing machine project came from the index card project 
//completed during my first year of architecture school. I wanted to stress the 
//importance of line weight to portrey the hierarchy among the composition. Each time 
//the composition is changed there is a completely new set of conditions created.

