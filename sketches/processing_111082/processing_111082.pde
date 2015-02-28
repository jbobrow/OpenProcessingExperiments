
ArrayList<Star> stars;
float G = 1.2;
color[] colors = {#335A5F,#5C969D,#B70006,#FFE51C,#FA633D,#FBFF21,#FFBD5A};
int blurRadius = 1;
 
void setup() {
  size(600,500);
  reset();
}
 
void draw() {
  //blur previously drawn frames
  filter(BLUR,blurRadius);
  fill(0,2);
  rect(0,0,width,height);
  //apply gravitational attraction between all stars
  if (stars.size()>=1) {
    for (int i = stars.size()-1; i >= 0; i--) {
      Star s1 = stars.get(i);
      for (int j = stars.size()-1; j >= 0; j--) {
        if (i != j) {
      Star s2 = stars.get(j);
      PVector force = s2.attract(s1);
      s1.applyForce(force);
        }
      }
  
      s1.update();
      s1.checkEdges();
      s1.display();
    }
  }
}

//reset canvas
void reset() {
   background(0); 
   stars = new ArrayList<Star>();
}

//add a new star
void mousePressed() {
  stars.add(new Star(random(0.5,3),mouseX,mouseY));
}

void mouseDragged() {
  if (stars.size()>=1) {
    for (int i = stars.size()-1; i >= 0; i--) {
      Star s1 = stars.get(i);
        PVector mouse = new PVector(mouseX,mouseY);
        PVector repulse = PVector.sub(s1.location,mouse);
        repulse.normalize();
        repulse.mult(0.2);
        s1.applyForce(repulse);
    }
  }
}

void keyReleased() {
  if (key == DELETE || key == BACKSPACE) reset();
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
  if (key == CODED ) {
     if (keyCode == UP) {
       if (G < 7) {
        G+=0.1;
       }
     } else if (keyCode == DOWN) {
       if (G > 0) {
         G-=0.1;
       }
     }
  }
} 

class Star {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float radius = mass*16.0;
  color c = colors[int(random(7))];
 
  Star(float m, float x, float y) {
    mass=m;
    location = new PVector(x, y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
 
 void applyForce(PVector force) {
   PVector f = PVector.div(force,mass);
   acceleration.add(f);
 }
 
 PVector attract(Star s) {
   PVector force = PVector.sub(location,s.location);
   float distance = force.mag();
   distance = constrain(radius+s.radius,5,500);
   force.normalize();
   
   float strength = (G*mass*s.mass)/(distance*distance);
   force.mult(strength);
   return force;
 }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
 
//Display star
  void display() {
    stroke(0);
    noStroke();
    fill(c,100);
    ellipse(location.x,location.y,mass*16,mass*16);
    fill(c,150);
    ellipse(location.x,location.y,mass*10,mass*10);
    fill(c,200);
    ellipse(location.x,location.y,mass*6,mass*6);
  }
  
 
//Bounce off of edges
  void checkEdges() {
 
    if (location.x > width) {
      location.x = width;
      velocity.x *= -.5;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -.5;
    }
 
    if (location.y > height) {
      location.y = height;
      velocity.y *= -0.5;
    }  else if (location.y < 0) {
      location.y = 0;
      velocity.y *=-0.5;
    }
  }
}


