
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  noStroke();
  fill((255),100,255,50); // Baby Pink
  rect(100,100,100,100);
  noStroke ();
  fill((255),500,500,500); // Bright Red
  ellipse(100,300,100,100);
  noStroke ();
  fill ((6),6,100,100); // Grey
   triangle(30, 75, 58, 20, 86,75);
   noStroke ();
   fill ((80),255,255,100); // Lime Green
   rect (100,400,100,100);
}
