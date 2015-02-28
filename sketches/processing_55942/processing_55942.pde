
float i;

void setup() {
  size(400, 400);
  rectMode(CENTER);
  noStroke();
  frameRate(5);
  i=10;
}

void draw() {
  translate(width*.5, height*.5);

  //  for ( = 10; i > 0; i--) {

  fill(255*i/10, 255*i/10, 255);
  rect(0, 0, width*i/10, height*i/10);

  //  }

  i=i-1;
  if (i<0){
    i=10;
  }
}
