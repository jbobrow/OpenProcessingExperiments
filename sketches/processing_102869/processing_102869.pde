
// My first processing sketch.
//we'll see how this goes

void setup() {
  size(300,200);
  background(0);
}

void draw() {
  stroke(255);
  //Draw the R
  line(50,50,50,150);
  line(50,50,75,50);
  line(50,125,75,125);
  noFill();
  arc(75,87.5,75,75,-1*HALF_PI,HALF_PI);
  line(75,125,112.5,150);
  //draw the o
  arc(137.5,137.5,25,25,0,PI*2);
  //draw the b
  line(162.5,100,162.5,150);
  line(162.5,125,170,125);
  line(162.5,150,170,150);
  arc(170,137.5,25,25,-1*HALF_PI,HALF_PI);
  //draw the J
  arc(225,125,50,50,0,PI);
  line(250,125,250,50);
  line(225,50,250,50);
}
