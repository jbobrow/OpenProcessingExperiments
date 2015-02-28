
float r = 0; //Rotation variable.
float opac = 10; //Opacity variable.
float x = 25; //Set large value for random ellipse size.

void setup() {
  size(800, 800);
  background(10);
  smooth(8);
  noStroke();
  frameRate(600);
}

void draw() {
  colorMode(HSB);
  
  //Set initial value for ellipses.
  
  fill(random(19, 69), 53, random(81, 240), opac/1.2);
  translate(width/2, height/2); //Centre the sketch.
  rotate(r);
  float circ_size = random(0, x); //Ellipse size.
  ellipse(20+r, 0, circ_size, circ_size);
  r += 0.2;
  if (r > 550) {   //Once the ellipses reach edge, change values.
    r = 0;
    opac +=5;
    x -= 2;
    
    //Dim the sketch with a transparent rectangle.
    
    fill(0, opac/1.5);
    rectMode(CENTER);
    rect(0, 0, 900, 900);
    if (opac > 254) {
      opac = 10;
    }
    if (x < 5) {
      x = 25;
    }
  }
}



