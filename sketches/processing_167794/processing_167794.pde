


float x, y;
float angle = 10; 
float r = 300;
float diff = 1; 
float a = 5;

void setup() {
  size(600, 600);
  background(0);
colorMode(HSB); 
}

void draw() {

  fill(random(255),100,255,100); 


  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(0.1); 
  stroke(random(255),100,255,50); 

  translate(width/2, height/2); 
  rotate(r * -50); 

  //ellipse(0, 0, 100, 150);
  ellipse(x/2, y/2, a, a);
  line( 0, 0, 0, 150); 

  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 300) { 
    diff =  diff * 0.1;
  }
}


void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}

