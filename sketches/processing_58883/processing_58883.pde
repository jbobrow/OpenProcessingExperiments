
class Shake {
  PVector loc;
  PVector vel;
  PVector acc;
  PVector dir;
  PVector mouse;
  
  float topspeed;
  float r, g, b;
  float radius;
  float theta;
  
  int timer;
  boolean check = false;
  
  // Constructor
  Shake() {
    loc = new PVector(random(width + random(-10, 10)), random(height) + random(-10, 10));
    vel = new PVector(0, 0);
    
    topspeed = 4;
    radius = 0;
    timer = 0;
  }
  
  void displayRect() {
    fill(255, 2); // semi-transparent white
    noStroke();
    rect(0, 0, width, height);
  }
  
  void update() {
    mouse = new PVector(mouseX, mouseY);
    dir = PVector.sub(mouse, loc);
    dir.normalize();
    dir.mult(0.5);    
    acc = dir;
    
    vel.add(acc);
    vel.limit(topspeed);
    loc.add(vel);
  }
  
  void displayCircle() {
    fill(random(255), timer);
     loc.x += noise (frameCount % width);
    if (millis() - timer >= 2000) {
      timer = millis();
      loc.y += noise(frameCount * 0.1) ;
    }
    
    if (check) {
      fill(0);
      stroke(frameCount % 255);
      
    } else if (check = !check) {
      
      // use frameCount and noise to change the red color component
      r = noise(frameCount * 0.3) * 255;
      // use frameCount and modulo to change the green color component
      g = frameCount % 255;
      // use frameCount and noise to change the blue color component
      b = 255 - noise(1 + frameCount * 0.2) * 255;
      // use frameCount and noise to change the radius
      radius = noise(frameCount * 0.01) * 40;
      color c = color(r, g, b);
      fill(c);
      stroke(255);
    }
    ellipse(loc.x, loc.y, radius, radius);
    seperate();
  }
  
  void checkEdge() {
    if (loc.x > width) {
      loc.x = 0;
    } else if (loc.x < 0) {
      loc.x = width;
    }

    if (loc.y > height) {
      loc.y = 0;
    }  else if (loc.y < 0) {
      loc.y = height;
    }
  }
  
  void seperate() {
    if (mousePressed) {
      check = true; 
      
      theta = random(-PI/4,PI/4);
      acc.mult((cos( theta)) * radius);
      
      acc.mult(-1);
      vel.sub(acc);
      loc.sub(vel);
      
    } else {
      check = false;
      theta = 0;
    }
  }
}


