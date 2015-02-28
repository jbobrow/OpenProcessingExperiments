
float x, y;
float angle = 0; 
float r = 400;
float diff = 1; 

color col = color(255, 0, 0);

void setup() {
  size(600, 600);
  background(255);
}

void draw() {

  fill(col); 


  x = r * cos(angle); 
  y = r * sin(angle);


  strokeWeight(0.3);
  stroke(0);
  translate(width/2, height/2); 
  rotate(r); 

  noStroke();
  fill(0, 47, 47, 20);
  ellipse(0, 0, x, y);
  //ellipse(x, 0, x, 50);
  //line( 0, 0, x, y); 

  fill(239, 236, 202, 30);
  ellipse(x, y, x, y);
  fill(127, 163, 126, 20);
  ellipse(0, 0, x/2, y/2);


  stroke(4, 99, 128);

  line(x, y, 200, 200);


  angle = angle +0.04;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}
