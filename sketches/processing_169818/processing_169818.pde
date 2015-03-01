
void setup () {
 
  size (1000,600);
  background (255);
  ellipseMode(CENTER);
  stroke (0);
  noStroke ();
 
for (int i=0; i<width; i++) {
  for (int j=0; j<height; j++) {
    //random number for red
    float red = random (0,255);
    float green = random (0,255);
    float blue = random (0,245);
    fill (red, green, blue);
    
    int radius = int(random(1,18)) * 5 ;
    
  ellipse( i * 2, j * 20,36,20);
  }
}
}

