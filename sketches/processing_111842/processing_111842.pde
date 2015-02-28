
float x, y;
float angle = 0; 
float r = 200;
float diff = 1; 

color col = color(255,0,0);
color colo = color(0,255,255);

void setup() {
  size(600, 600);
  background(0);
 
}

void draw() {

  fill(col); 
  
  
  x = r * cos(angle); 
  y = r * sin(angle);


  strokeWeight(0.1); 
  stroke(0); 

  translate(width/2, height/2); 
  rotate(r); 

  ellipse(0, 0, x, y);
  
  fill(colo); 
  ellipse(x, 200, x, 20);
  //line( 0, 0, x, y); 

  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}


void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
