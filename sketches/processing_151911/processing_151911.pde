
void setup() {
  size(400, 400);
  rectMode(CORNER);
  noStroke();
  colorMode(HSB);
  frameRate(3);
}

void draw() {

  background(120); 




  int num = (int) 20;   // select a random number of squares each frame
  int gap = (int) 10; // select a random gap between each square

  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;

  // print out the size of each square
  println("cellsize = " + cellsize);



  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {

      if (random(10) > 8) {
      noFill();
      } else {
        fill(random(0, 255), random(0,255), 255);


        rect(gap * (i+1) + cellsize * i, gap * (j+1) + cellsize * j, cellsize, cellsize);
      }
    }
  }
}




