
boolean lines = false;
boolean gravity = false;
PImage b;

int partC = 600;
 
Particle[] particles = new Particle[partC+1];



void setup() {
  size(700,400);
  frameRate(60);
  b = loadImage ("fade.png");
  smooth();
  background(255);
  //fill (255);
 
  for (int x = partC; x >= 0; x--) {
    particles[x] = new Particle();
  }
}
void draw() {
  image(b,0,0); 
  noStroke();
  //noCursor();
  fill(0,0,0,5);
  rect(0,0,1000,1000);
  for (int i = partC; i >= 0; i--) {
    Particle particle = (Particle) particles[i];
    particle.update(i);
  }
}

//Particles

class Particle {
  float x;
  float y;
  float xx;
  float yy;

   
  Particle() {
    x = 5;
    y = 5;
 
  }
  float getx() {
    return x;
  }
  float gety() {
    return y;
  }
  
//partset
  
  void update(int num) {
    xx *= 0.90;
    yy *= 0.90;
    for (int i = partC; i >= 0; i--) {
      if (i != num) {
        boolean drawthis = false;
        Particle particle = (Particle) particles[i];
        float getX = particle.getx();
        float getY = particle.gety();
        float radius = dist(x,y,getX,getY);
    
    //particle repulsion//
        //wave effect//
        if (radius < 32) {
        //swarm effect//
        //if (radius < 34) {
          drawthis = true;
          float angle = atan2(y-getY,x-getX);
          if (radius < 45) {
            xx += (25 - radius) * 0.07 * cos(angle);
            yy += (25 - radius) * 0.07 * sin(angle);
          }
          if (radius > 40) {
            xx -= (25 - radius) * 0.02 * cos(angle);
            yy -= (25 - radius) * 0.02 * sin(angle);
          }
        }
      }
    }
    
    //Mouse functions
    
    if (mousePressed) {
      float mousePosX = mouseX;
      float mousePosY = mouseY;
      float radius = dist(x,y,mousePosX,mousePosY);
      if (radius < 400) {
        float angle = atan2(mousePosY-y,mousePosX-x);
        //attracts particles       
        if (mouseButton == LEFT) {
          xx += radius * 0.01 * cos(angle);
          yy += radius * 0.01 * sin(angle);
          stroke(radius * 4,0,0);
        }
        //repells particles
        if (mouseButton == RIGHT) {
         if(radius < 200) {
          if (radius < 50) {
            xx -= radius * 0.14 * cos(angle);
            yy -= radius * 0.14 * sin(angle);
            stroke(radius *4,0,0);
          
      }
      else {
        if (lines) lines = false;
        else lines = true;}}
        }
      }
    }
    //If statements keeping particles in the box
    
    int posX = (int)x;
    int posY = (int)y;
    x += xx;
    y += yy;
    if (gravity == true) yy += 0.7;
    if (x > width) {
      if (abs(xx) == xx) xx *= -1.0;
      x = width;
    }
    if (x < 0) {
      if (abs(xx) != xx) xx *= -1.0;
      x = 0;
    }
    if (y < 0) {
      if (abs(yy) != yy) yy *= -1.0;
      y = 0;
    }
    if (y > height) {
      if (abs(yy) == yy) yy *= -1.0;
      xx *= 0.6;
      y = height;
    }
    if (!lines) {
      stroke (4);
      line(posX,posY,int(x),int(y));
    }
  }
} 
void keyPressed() {
  if (keyPressed == true) {
    if (gravity) gravity = false;
    else gravity = true;
  }
  else {
    if (lines) lines = false;
    else lines = true;
  }
}
    

