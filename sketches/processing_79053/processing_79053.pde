
PImage bild;

void setup() {
  size(800,584);
  smooth();
  frameRate(1000000);
  bild = loadImage("angry-tiger.jpg");
  //image(bild,0,0);
  background(0);
}

void draw() {
  noStroke();
  background(0);
  float cs = 5+mouseX;
  
  for (int j = 0; j<height/cs+1;j++) { 
  for (int i = 0; i<width/cs+1 ; i++) {
   color c = bild.get(int(i*cs),int(j*cs));
    fill( brightness(c));
    fill(#0e1c87);
    float  cs2 = brightness(c)/20.0;
    ellipse(i*cs, j*cs, cs2, cs2);
}
}
}



