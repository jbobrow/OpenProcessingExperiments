

float x, y;
float angle = 0; 
float r = 400;
float diff = 1;
float a, b, c, d;
float q = 100;
float w = 200;


void setup() {
  size(600, 600);
  background(255);
 
}

void draw() {

  noFill(); 


  

  x = r * cos(angle); 
  y = r * sin(angle);
  a = q * cos(angle);
  b = q * tan(angle);
  c = w * tan(angle);
  d = w * sin(angle);

  strokeWeight(0.5); 
  stroke(0, 50); 

  translate(width/2, height/2); 
  pushMatrix();
  rotate(r); 

  ellipse(0, 0, x, y);
  ellipse(0, 0, y, x);
  
  rect(0,0, a, b, x);
  rect(0,0, b, a, y);
  
  stroke(255,255,255);
  line( 300, 300, c, d);
  ellipse(0, 0, c, d);
  ellipse(0, 0, c, d);
  //stroke(0,50);
  ellipse(0,0,c,d);
  popMatrix();
  
  pushMatrix();
  stroke(0,50);
  rotate(r);
  ellipse(0,0,a,a);
  popMatrix();


  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
  
  
}


