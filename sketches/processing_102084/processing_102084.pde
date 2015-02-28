

  ////////////////////////////
  //                        //
  //        doodle 5        //
  //                        //
  ////////////////////////////

  // (c) Martin Schneider 2013


float rotation, velocity, d;
float centerX, centerY;
int border = 30;
int maxiter = 5;
float zoom = 1;


void setup() {
  
  size(500, 500);
  stroke(0, 64); 
  noFill(); 
  smooth();
  centerX = width/2; 
  centerY = border;
  d = min(width, height) - 2 * border;

}


void draw() {
  
  if(!keyPressed) {
    velocity *= 0.99;
    rotation += velocity * 0.05;
  }
  
  background(255);
  translate(centerX, centerY);
  scale(zoom * d);
  swing(maxiter);

}


void swing(int i) {
  
  pushMatrix();
  
  // swing it!
  rotate(rotation);
  
  // adjust stroke weight to scale
  strokeWeight(1.0/zoom/d * (1<<(maxiter-i)));
  
  // draw a big swing using turtle functions
  r(1); ar(); 
  r(1); f(); r(5); f(); r(3); ar(); 
  r(1); f(); r(4); ar(); 
  f(); r(2); ar();
  
  // draw smalls swings recursively
  if(i > 1) {
     f(); r(1); scale(.5); swing(i-1); 
     r(2); f(); r(4); swing(i-1); 
     f(); swing(i-1);
  }
  
  popMatrix();
  
}


// turtle functions
void f() { translate(1, 0); }
void r(int r) { rotate(PI * r/3); }
void ar() { arc(0, 0, 2, 2, 0, PI/3); }


// interaction
void mouseDragged() {
  
  switch(mouseButton) {
    
    case LEFT: // rotate 
      
      float pmouseAngle = atan2(pmouseY-centerY, pmouseX-centerX);
      float mouseAngle = atan2(mouseY-centerY, mouseX-centerX);
      float acc = (mouseAngle - pmouseAngle) / TWO_PI * 6;
      velocity += (acc > PI ? acc - TWO_PI : acc < -PI ? acc + TWO_PI : acc);
      break;
      
    case RIGHT: // move
      
      centerX += mouseX - pmouseX;
      centerY += mouseY - pmouseY;
      break;
      
    case CENTER: // scale
    
      float d1 = dist(mouseX, mouseY, centerX, centerY);
      float d2 = dist(pmouseX, pmouseY, centerX, centerY);
      if(d2 * d1 > 0) {
        zoom = zoom * d1 / d2;
      }
      break;
      
  } 
  
}


