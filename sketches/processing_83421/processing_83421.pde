
float angle = 10;
void setup() {
  size(600, 400);

  int counter = 0;
  while (counter < 10) {                             // Like an 'if' statement
    println(counter);
    counter++;
    background(0);
  }
}


void draw() {
  noFill(); 
  stroke(0);
  rectMode(CENTER);          // centers the rectangle
  colorMode(HSB);
  translate(width/2, height/2);
  int counter =10;
  while (counter<20) {
     if (mousePressed)
      stroke(180, 255, counter*4); 
    ellipse (30, 50, 500, 500);
    rotate(radians(angle));       /// Rotate
    scale(0.90, 0.90);
                 // colour of the type //counter changes the colour


    counter++;
  }

  angle+=0.2;
}









// this is a loop, repeats the image 10 times, seb showed us how to do that
