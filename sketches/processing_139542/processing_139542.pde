
//Beatriz Bukvic, March 12th, Creative Computing B, Benjamin Bacon

void setup(){
size (700,700);
background(255);
smooth();
}
void draw() {
  for (int y=100; y < height-90; y += 10){
    for ( int x=100; x < width-90; x += 10){
      fill( int(random(255)), int(255), int(random(255)));
      noStroke();
      smooth();
      ellipse(x, y, 10, 10);
      x+=10;
    }
  y+=10;
  }
}


