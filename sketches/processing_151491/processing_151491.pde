
void setup() {
  randomSeed(hour()+minute()+second()+millis()); 
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(0.75);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(180); // clear the screen to grey
  
  int num = (int) random(3, 11);   // select a random number of squares each frame
  int gap = (int) random(5, 50); // select a random gap between each square
  float pos1x = (int) random(-10,5); // select a random number for shade position x 
  float pos1y = (int) random(-5,10); // select a random number for shade position y 
  float pos2x = (int) random(-15,5); // select a random number for square position x
  float pos2y = (int) random(-10,10); // select a random number for square position y 
  int rs = (int) random(25,100);
  int gs = (int) random(50,255);
  int bs = (int) random(0,180);
  int rc = (int) random(50,255);
  int gc = (int) random(0,50);
  int bc = (int) random(10,50);

  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        fill(random(rs), random(gs), random(bs)); // shadow
        rect(gap * (i+1) + cellsize * i + offsetX + random(pos1x), gap * (j+1) + cellsize * j + offsetY + random(pos1y), cellsize, cellsize);

        fill(random(rc), random(gc), random(bc), 180);  // rectangle
        rect(gap * (i+1) + cellsize * i + random(pos2x), gap * (j+1) + cellsize * j + random(pos2y), cellsize, cellsize);
      }
 }
 
  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("VeraMolnar.jpg");
  }
} //end of draw 
