
// START OF CONSTANTS TO PLAY WITH
// background colour
color bgcolor=color(#05073B);
// margin factor
float marginfactor=1.1;
// minimal diameter of bokeh piece
int mindiam=40;
// maximal diameter of bokeh piece
int maxdiam=55;
// END OF CONSTANTS TO PLAY WITH

// internal variables
float margin;

// function generating random dimension for bokeh piece
int rdiam() {
  return mindiam + int(random(maxdiam-mindiam));
}

// function generating random coordinate for bokeh piece
int rcoord(int diam) {
  margin=0.5*diam*marginfactor;
  return int( margin + random(width-(2*margin)) );
}

// function generating random bokeh effect
void bokeh() {
  // stores diameter
  int diam;
  // removing borders from the pieces
  noStroke();
  // setting colour mode to HSB
  colorMode(HSB, 255);
  for (int i=0; i < 100 + random(30); i++)
  {
    diam=rdiam(); // saving random diameter into variable 'diam'
    // setting fill colour using HSBA colour mode with some randomisation
    fill(random(255), 150+int(random(105)), 150+int(random(105)), int(100+random(75)));
    ellipse(rcoord(diam), rcoord(diam), diam, diam);
  }
}

void ribbon()
{
  colorMode(RGB);
  strokeWeight(4);
  stroke(0);
  //draw ribbon
  fill (80, 80, 200);
  rect(273, 0, 55, 600);
  rect(0, 273, 600, 55);
  
  
  // tie for ribbon
  fill (100, 100, 200);
  quad(300,300, 500,400, 500,350, 500,200 );
  quad(300,300, 100,200, 100,250, 100,400 );
  ellipse(300,300, 100,100);
}

void setup()
{
  size(600, 600);
  background(bgcolor);
  
}

void draw()
{
  noLoop(); // we are drawing once
  bokeh(); // draws bokeh as background
  ribbon(); // draws a ribbon
}
