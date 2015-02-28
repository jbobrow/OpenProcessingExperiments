

void setup () {
  background(255);
  size (400, 400);
  smooth();
  strokeWeight(10);

  float man = 40;
  float space= 40;


  for ( float y = 10; y < height; y = y + space) {
    for ( float x = 55; x < width; x = x + space ) {
      if (random(120) >= 90) {
        fill ( 244,0,0,100);
        ellipse( x,y,50,50);
      }
      else {
        fill ( random ( 255,100));
        rect(x+ random(50), y+ random(50,300), 10, 10 );
      }
    }
  }
}

void keyPressed() {
  saveFrame ("wahrscheinlih.png");
}



