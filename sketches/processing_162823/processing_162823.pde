


void setup () {

  smooth();
  size( 600, 600 );
  color(255);
}

void draw() {

  int M = mouseY/20;
  int M1 = mouseX/40;
  background(0);


  fill(0);       

  {
    fill(random(255, 255), 255, 255);
  }

  noStroke();
  ellipse( width/2+random(M), height/2+random(M), 100, 100);

  fill( 255);
  ellipse (300, 400, 69, 15);
  ellipse (300, 400, 17, 19);

  fill (0);
  ellipse (300, 400, 18, 30); 
  ellipse (width/2+19, height/2-19, 17, 20);
}

