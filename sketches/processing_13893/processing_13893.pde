

class Ball {
  
  float deg = random(360); // random starting position
  float r = random(10, 400); // random radius
  float heightBall = random(225, 525); // random y position
  
  float rnd = random(-0.5);

  color Color = color(random(255), random(10, 120), 100); // random color

  float xPositions;
  float zPositions;
  
  // coordinates for fixed particle
  float x = r * cos(radians(deg));
  float y = heightBall;
  float z = r * sin(radians(deg));
  
  float d;
  
  
  void Ball() {
  }
  
  void display() {

    stroke(255);
    noFill();
  
    // coordinates for fixed particle 
    float x = r * cos(radians(deg));
    float y = heightBall;
    float z = r * sin(radians(deg));
  
    deg += (1/r*200); // make it rotate
    r += rnd; // make it spiral inwards
    heightBall += 0.5; // make it spiral downwards
    
    if (r < 10) r = 400;
    if (heightBall > 525) heightBall = 225; 
    
    // x and z positions
    xPositions = r * cos(radians(deg));
    zPositions = r * sin(radians(deg)); 
    
    pushMatrix();
    
    rotateX(radians(-35));
    
    point(xPositions, heightBall, zPositions);
    
    for (int i = 0; i < balls.length; i++) {
    
      // measure distance between fixed particle and moving particles
      float d = dist(x, y, z, balls[i].x, balls[i].y, balls[i].z);
      if (d < minDist) {
        
        // draw a line between fixed particle and moving particles
        stroke(255, 40);
        line (x, y, z, balls[i].x, balls[i].y, balls[i].z);
        
        // draw a shape between fixed particle and moving particles
        beginShape();
        fill(Color, 30);
        noStroke();
        
        vertex(x, y, z);
        vertex(balls[i].x, balls[i].y, balls[i].z);
        vertex(balls[i].x*var1, balls[i].y*var2, balls[i].z*var3);
        // multiply the third vertex coordinates by controllable variables

        endShape(CLOSE);
      } 
    }   
    
    
    popMatrix();
    
  }
  
  
}

