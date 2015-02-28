
int grow = 10;

float r;
float g;
float b;


void setup () { 
  size(500,500);
  smooth ();
  
}

void draw () {
  background (0);
  noStroke ();
  fill (r,g,b);
 //grow = grow + 1; anwachsen ohne maus
  ellipse (width/2, height/2, grow, grow);
  
}

void mousePressed () {
  grow = grow + 10;
  
  r= random(255);
  g= random(0);
  b= random(0);

  
}

