
float cx = 0, cy = 100;

void setup() {
  size(640, 480);
  
}

void draw() {
  colorMode(HSB, 100);
  background(cx, 100, 50);
  noFill();
  strokeWeight(5);

  
  stroke(cy, 100, 50);
  
  beginShape(TRIANGLE_STRIP);
    vertex(random(width/2), random(height/2) );
    vertex(random(width/2), random(height/2) );
    vertex(random(width/2), random(height/2) );
    vertex(random(width/2), random(height/2) );
    vertex(random(width/2), random(height/2) );
    vertex(random(width/2), random(height/2) );
  endShape();
  
  beginShape(TRIANGLE_FAN);
    vertex(random(width/2, width), random(height/2, height) );
    vertex(random(width/2, width), random(height/2, height) );
    vertex(random(width/2, width), random(height/2, height) );
    vertex(random(width/2, width), random(height/2, height) );
    vertex(random(width/2, width), random(height/2, height) );
    vertex(random(width/2, width), random(height/2, height) );
  endShape();

  strokeWeight(20);
  stroke(255, 100, 100);
  rectMode(CENTER);
  rect(width/2, height/2, 200, 200);
}


void mouseMoved( ) {
  cx = 100 * mouseX/width;
  cy = 100 * mouseY/height;
}



