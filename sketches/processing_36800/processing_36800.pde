
void setup () {
  size (500, 500);
  frameRate (30);
}
void draw () {
  background (255);
  smooth ();
  strokeWeight (1);
  for (int y=0; y< width; y+=10) {
    for (int x=0; x<height; x+=15) {
      float linelengths= random (50, 400);
      line (y, 0, y, width);
    }
  }
  
  float greyVal = map(mouseX, 100, width, 0, 255); 
  float greyStro = map(mouseX, 0, 225, 25, 0);
  stroke (greyVal);
  
  if (mouseX< 225) {
    for (int x=0; x<500; x=x+15){
      strokeWeight( greyStro);
      line (0, x, random(0, 501), x);
      
    }
  }
}



