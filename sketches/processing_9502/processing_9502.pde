

void setup() {
size( 200,200 );
background( 255 );
smooth();
}

void draw(){
  noFill();
  rectMode(CENTER);
  rect(width/2, height/2, 160, 160);
  line(width/2, 20, width/2, 180);
  line(width/2 - 40, 20, width/2 - 40, 180);
  line(width/2 + 40, 20, width/2 + 40, 180);
  
  for ( int c1 = 20; c1 < 180; c1 = c1 + 5) {
    line (180, c1, 140, c1);
  }
  for ( int c1 = 20; c1 < 180; c1 = c1 + 10) {
    line(140, c1, 100, c1);
  }
   for ( int c1 = 20; c1 < 180; c1 = c1 + 20) {
    line(100, c1, 60, c1);
  }
   for ( int c1 = 20; c1 < 180; c1 = c1 + 40) {
    line(60, c1, 20, c1);
  }
}


