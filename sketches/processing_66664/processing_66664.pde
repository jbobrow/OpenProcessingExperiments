

void setup() {
  size(600, 310); 
  background(0);
}

void draw() {
    for( int i = 1; i < 10; i++ )
    {
        drawCircle( 60*i, 100, 32+(i*2), color( 130+(i*5) , 172+i,255 ) );
    }
}

void drawCircle( int x, int y, int d, color c ) {
    noStroke();
    fill(c);
    ellipse(x, y, d, d);
      }

