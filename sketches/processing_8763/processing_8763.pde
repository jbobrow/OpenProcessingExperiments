
// Created by Alex York using Processing
// Creates a graph in the first octant of a f(x,y) multivariable function.
// In order to change graph, you must change the z in render() and the z in printline()
// You also must change the partial derivatives.

// What buttons do:
// w      = changes from 0 to 4
  // 0       = Large Pixels
  // 1       = Wireframe
  // 2       = Cubes
  // 3       = Spheres
  // 4       = Ellipses
// g      = preset graphes
  // 0       = Paraboloid (cubes and spheres are cool on this one)
  // 1       = Sin and Cos diffusion Wave (I wouldn't recommend under 25 on scaler for this)
              //The println doesn't work well for this graph, check under 25 on scaler and you will see why.
  // 2       = A natural logarithm curve that is gentle sloping, ellipses work well.
// s      = sets scalar
  // 0       = original which is 250
  // 1       = 100
  // 2       = 50
  // 3       = 25
  // 4       = 10 (risky)
  // 5       = 5  (not recommended)
// z      = resets scalar to 250
// b`     = sets scalar to 1 (only use in Large Pixel mode or will be hard to render)
            //must use z to get out of b mode

// Up     = spin negatively around Y pole
// Down   = spin positively around Y pole
// Left   = spin positively around X pole
// Right  = spin negatively around X pole

// These must be hit lowercase, you could simply make it so upper case works, but I'm lazy.
// L      = translate screen left
// R      = translate screen right
// U      = translate screen up
// D      = translate screen down
// F      = moves screen forward towards you
// A      = moves screen away from you

// Just a few nice preset cameras
// o(the letter) = Puts screen in position with x,y plane facing you and z = 0;
// 4 = screen faces right and flips z
// 5 = screen faces left
// 9 = original 

// If you click on the screen, it will println() the height at the mouse coordinates and the
  // partial slopes at the mouse coordinates.
  
// Thanks to the reference pages and learning on the processing website.


float spinX = 0;
float spinY = 0;
float spinZ = 0;
float f = -800;
float u = 0;
float d = 0;
float q = 0;
float p = 0;
float s = 0;
// Change to adjust how many pixels are between objects, I would not go under 4 though.
float scaler = 250;

void setup() {
  size(500,500,P3D);
  background(0);
  colorMode(HSB);
  smooth();
}

void draw() {
  // All four functions that govern scaler size, rotation, rendering status, and printing info
  scaler();
  rotatePic();
  render();
  printline();
}

void scaler() {
  
    if(s == 0) scaler = 250;
    if(s == 1) scaler = 100;
    if(s == 2) scaler = 50;
    if(s == 3) scaler = 25;
    if(s == 4) scaler = 10;
    if(s == 5) scaler = 5;
    if(s > 5) s = 0;
    
}

void rotatePic() {
  
  // Rotates the screen and translates
  background(0);
  camera();
  translate(u,d,f);
  rotateX(radians(spinY));
  rotateY(radians(spinX));
  rotateZ(radians(spinZ));
  
}

void render() { 
  
  for(int x = 1; x < width; x+=scaler) {
    for(int y = 1; y < height; y+=scaler) {
      float z = 0;
      // Equation that needs changing to adjust graph, I suggest just making another float z line and
        // just commenting this out.
      if( p == 0 ) {
        z = (x*x + y*y)*.001;
      }
      if( p == 1 ) {
        z = (sin(x + y) - cos(x + y))*100;
      }
      if( p == 2 ) {
        z = pow(log(x*y),2)*2; 
      }
      
      //Ellipses
      pushMatrix();
      translate(0,0,z);
      fill(z%255,255,255);
      noStroke();
      if( q == 2 ) ellipse(x,y,z,z);
      popMatrix();
      
      //Spheres and Cubes
      pushMatrix();
      translate(x,y,z);
      fill(z%255,255,255);
      noStroke();
      if( q == 4 ) sphere(z);
      if( q == 3 ) box(z);
      popMatrix();
      
      // Wireframe
      stroke(z,255,255);
      if( q == 1 ) {
      line(x,y,0,x,y,z);
      line(x+scaler,y+scaler,0,x+scaler,y+scaler,z);
      line(x,y,z,x+scaler,y+scaler,z);
      }
      
      // Large Pixels
      noStroke();
      fill(z%255,255,255);
      if( q == 0 )rect(x,y,scaler,scaler);
      
    }
  }
  
  // Outline for Screen
  stroke(255);
  noFill();
  rect(0,0,width,height);
  
}

void printline() {
  
  float z = 0;
  
  // Same for this one as well
  if( p == 0 ) { 
    z = (mouseX*mouseX + mouseY*mouseY)*.001;
  }
  if( p == 1  && (mouseX + mouseY)%scaler == 0) { 
    z = (sin(mouseX + mouseY) - cos(mouseX + mouseY))*100;
  }
  if( p == 2 && mouseX != 0 && mouseY != 0) {
    z = 2*pow(log(mouseX*mouseY),2); 
  }
  
  // Creates white ellipes that guides where mouse is
  fill(255);
  pushMatrix();
  translate(0,0,z);
  ellipse(mouseX,mouseY,scaler,scaler);
  popMatrix();
  
  float partialX = 0;
  float partialY = 0;
  
  // Partial Derivatives for multivariable function
  if(p == 0) partialX = (2*mouseX)*.001;
  if(p == 1) partialX = (cos(mouseX + mouseY) + sin(mouseX + mouseY))*100;
  if(p == 2) partialX = 4*log(mouseX + mouseY)/mouseX;
  
  if(p == 0) partialY = (2*mouseY)*.001;
  if(p == 1) partialY = (cos(mouseX + mouseY) + sin(mouseX + mouseY))*100;
  if(p == 2) partialY = 4*log(mouseX + mouseY)/mouseY;
  
  if(mousePressed) {
    println("height = " + z + " slope at X = " + partialX + " slope at Y = " + partialY);
  }
    
}

void keyPressed() {
  
  // Rotations
  if(keyCode == UP) {
    spinY-=scaler/5;
  }
  if(keyCode == DOWN) {
    spinY+=scaler/5;
  }
  if(keyCode == LEFT) {
    spinX-=scaler/5;
  }
  if(keyCode == RIGHT) {
    spinX+=scaler/5;
  }
  if(key == '0') {
    spinZ+=scaler/5;
  }
  if(key == '1') {
    spinZ-=scaler/5;
  }
  
  // Transformations
  if(key == 'f') {
    f+=scaler;
  }
  if(key == 'a') {
    f-=scaler;
  }
  if(key == 'r') {
    u+=scaler;
  }
  if(key == 'l') {
    u-=scaler;
  }
  if(key == 'd') {
    d+=scaler;
  }
  if(key == 'u') {
    d-=scaler;
  }
  
  
  // Fullscreen
  if(key == 'o') {
    spinX = 0;
    spinY = 0;
    spinZ = 0;
    f = 0;
    u = 0;
    d = 0;
  }
  
  // Original
  if(key == '9') {
    spinX = 0;
    spinY = 0;
    spinZ = 0;
    f = -800;
    u = 0;
    d = 0;
  }
  
  // Facing Left
  if(key == '5') {
    spinX = 0;
    spinY = 75;
    spinZ = 250;
    f = -300;
    u = 0;
    d = 400;
  }
  
  // Facing Right
  if(key == '4') {
    spinX = 0;
    spinY = 250;
    spinZ = 75;
    f = -300;
    u = 400;
    d = 400;
  }
  
  // Changes from Pixel to Wireframe to Cubes to Spheres to Ellipses 
  if(key == 'w') {
    q++;
    
    if(q>4) q = 0;
    
  }
  
  if(key == 'g') {
    p++;
    
    if(p>2) p = 0;
    
  }
  
  if(key == 's') {
    s++;
  }
  
  if(key == 'z') {
    s = 0;
  }
  if(key == 'b') {
    s = -1;
    scaler = 1;
  }
}

