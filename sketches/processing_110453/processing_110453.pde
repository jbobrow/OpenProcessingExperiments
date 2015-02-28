



float x, y;
float angle =200;
float r =600;
float diff = 1;
float a = 200;

void setup() {

  size(600, 600);
  background( 0);
}

void draw() {


  x = r*cos(angle);
  y = r*sin(angle);

  stroke(#9b6415, 70);

  noFill();

  translate(width/2, height/2);

  rotate(r);

  rect(0, 0, x/2, y/2);



  angle = angle + a;

  r = r - diff ;

  if ( r == 0 || r == 600 ) {
    diff = diff * -1;
  }
}



