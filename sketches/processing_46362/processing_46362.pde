

float a = 0.0;
float inc = TWO_PI/50.0;

void setup() {
  size (800, 600);
  smooth();
  frameRate(120);
  
}



void draw() {

  noStroke();
  fill(0, 56, 0, 20);
  rect(0, 0, width, height);
  
 fill(random(127),random(5),0, 127);
  ellipse (width/2, height/2, 50,50);
  
  translate (width/2, height/2); 
  
  stroke(0);
  strokeWeight(random(10));
  fill(random(127), 0, random(127), 20);
  for (int i=0; i<600; i=i+2) {
    
    ellipse(i*sin(a), 50, i*cos(a), 50+tan(a)*2.0);
    a = a + inc;
    rotate (PI/180);
  }
}

