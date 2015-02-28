
void setup(){
size (700,700);
background(255);
smooth();
frameRate(5);
}
void draw() {
  for (int y=100; y < height-90; y += 10){
    for ( int x=100; x < width-90; x += 10){
      fill( int(random(100)), random(100), int(random(255)));
      noStroke();
      smooth();
      ellipse(x, y, 15, 15);
      x+=10;
    }
  y+=10;
  }
}

