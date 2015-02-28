
float x, y;
float a = 0;
float s;
float r = 450;
float diff = 1;
float p, q;

//color col = color(255,0,0);

void setup() {
  size(600, 600);
  background(255);
}

void draw() {

  fill(200, random(100, 250), 0, 7); 
  a = a + 0.0001;
  s = a * 20;

  x = r * cos(a); 
  y = r * sin(s);

  strokeWeight(0.1); 
  // noStroke(); 
  stroke(255);

  translate(width/2, height/2); 
  rotate(r); 
  ellipse(0, 0, x, y);

  //fill(200,100,0,10); 
  rect(x, 0, x, y);
  //line( 0, 0, x, y); 

  fill(0, random(100, 250), 200, 7); 
  p = r * -cos(s);
  q = r * sin(a);
  ellipse(0, 0, p, q);
 // rect(p, 0, p, q);


  r = r - diff;

  if ( r == 0 || r == 450) { 
    diff =  diff * -1;
  }
}
