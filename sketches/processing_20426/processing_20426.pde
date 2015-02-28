

PImage shinchan;


void setup() {
  size(640, 480);
  background(255);
  shinchan = loadImage("shinchan100.jpg");
}

void draw() {
  background(255); 
  smooth();
  image(shinchan,0,0);
  
  fill(255);
  ellipse(20*cos(hour()/24.0*TWO_PI)+ 230,20*sin(hour()/24.0*TWO_PI)+130,15,15);
  
  ellipse(20*cos(minute()/60.0*TWO_PI)+ 320,20*sin(minute()/60.0*TWO_PI)+160,15,15);
  
  
  //rectanglestart
  noStroke();
  fill(0);
  pushMatrix();
  translate(340,270);
  rotate(second()/60.0*TWO_PI);
  //rect(0,0,40,15);
  ellipse(0,0,40,15);
  popMatrix();
}


