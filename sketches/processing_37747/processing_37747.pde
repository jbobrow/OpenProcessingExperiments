
void setup() {
  size(300, 300);
  background(255);
  rectMode(CENTER);
  noFill();
}

void draw() {
  translate(height/2, width/2);
  //i sets the ratation of the rect
  for ( int i = 30;i < 360; i = i+5) {
    //randompos sets the position of the rect
    for ( int randompos =5; randompos < 100; randompos+=5) {
      //farg sets the shade of the rect
      for ( int farg = 50; farg < 255; farg +=10) {
        rotate(radians(i));
        stroke(farg, farg, farg);
        rect(randompos, randompos, 50, 50);
      }
    }
  }
}


