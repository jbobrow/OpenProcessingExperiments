
float x, y;
float angle = 0; 
float r = 200;
float diff = 1; 

color col = color(252,162,123);

void setup() {
  size(600, 600);
  background(211, 202, 195);
}

void draw() {

  fill(col); 
  
  
  x = r * cos(angle); 
  y = r * sin(angle);


  strokeWeight(0.1); 
  stroke(252, 51, 126); 

  translate(width/2, height/2); 
  rotate(r); 

  fill(0, 255, 135, 10);
  strokeWeight(0.1);
  ellipse(0, 0, x, y);
  rect(x/2, y/2, x*2, y*2);
  rect(x/4, y/2, x*5, y*5);

noStroke();
  fill(random(43, 294), random(100, 346), 60, 60);
  ellipse(y/2, 0, y/2, y);

  
  noStroke();
  translate(300, 400);
  rotate(r*0.1);
  ellipse(width/6, height/7, x, y);
  ellipse(width/8, height/7, x, y);
  ellipse(x, y, 19, 40);

 

  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 200) { 
    diff =  diff * -1;
  }
}


void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
