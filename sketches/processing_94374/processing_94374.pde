
//inspired from http://processing.org/learning/topics/simpleparticlesystem.html
ArrayList<Particle> particles;
int centerX = 0;
int centerY = 0;
int counter = 0;
void setup() {
    size(640,360);
    centerX = width/2;
    centerY = height/2;
    particles = new ArrayList<Particle>();
}
 
void draw() {
  background(255);
  //[offset-down] A new Particle object is added to the ArrayList every cycle through draw().
    particles.add(new Particle());
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.run();
    if (p.isDead()) {
      particles.remove(i);
    }
  }
    fill(20,0,250);
    ellipse(mouseX,mouseY,40,40);
}
 
class Particle {
    int radius =centerY+50;
    int grad = 0;
    int pcenterX;
    int pcenterY;
    int speed;
    color pcolor;
  float lifespan;
 
  Particle() {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    pcenterX = centerX+random(-20,20);
    pcenterY = centerY+random(-20,20);
    speed = random(1,40);
    lifespan = 255.0;
    pcolor = color(20,0,250);
  }
 
  // Sometimes it’s convenient to have a “run”
  // function that calls all the other functions we need.
  void run() {
    update();
    display();
  }
 
  void update() {
    lifespan -= 0.50;
     grad+=3;
    radius-=0.5;
  }
 
  void display() {
    stroke(pcolor,lifespan);
    fill(pcolor,lifespan);
    float winkel = radians(grad);
    float x = pcenterX + (cos(winkel)*radius);
    float y = pcenterY + (sin(winkel)*radius);
    
           if ((abs(mouseX-x) <= (50)) &(abs(mouseY-y) <= (50)) )
        {
            if (x>mouseX)
            {
                x=x+30;
            }
            else if (x<mouseX)
            {
                x=x-30;
            }
            if (y>mouseY)
            {
                y=y+30;
            }
            else if (y<mouseY)
            {
                y=y-30;
            }        
        }
    
    ellipse(x,y,8,8);
  }
 
  // Is the Particle alive or dead?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
