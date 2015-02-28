
int numParticles = 200;
GenParticle[] p = new GenParticle[numParticles]; //set particle in center
LeftParticle[]q= new LeftParticle[numParticles];
RightParticle[]r=new RightParticle[numParticles];
void setup() {
  size(300, 300);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = -i;
    // Inputs: x, y, x-velocity, y-velocity,
    // radius, origin x, origin y
    p[i] = new GenParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
    q[i]= new LeftParticle(width/4, height/2, velX, velY, 1.0, width/4, height/2);
    r[i]= new RightParticle(3*width/4, height/2, velX, velY, 2.0, 3*width/4, height/2);
  }
}

void draw() {
  fill(136,137,124);
  rect(0,0,width,height);
  fill(142,120,59);
  quad(((width/2)-20),height/2,0,height,width,height,((width/2)+20),height/2); //creates volcano
  fill(255, 60);
  for (int i = 0; i < p.length; i++) { //sets up array boundaries
    p[i].update();
    p[i].regenerate();
    p[i].display(); //sets up commands for GenParticle
    q[i].update();
    q[i].regenerate();
    q[i].display(); //sets up commands for LeftParticle
    r[i].update();
    r[i].regenerate();
    r[i].display(); //sets up commands for RightParticle
  }
}


class Particle {
  float x, y; // The x & y coordinates
  float vx, vy; // The x & y velocities
  float radius; // Particle radius
  float gravity = 0.1;
color c= color (floor(random(255)),0,0); //sets a random color in red hue

  Particle(float xpos, float ypos, float velx, float vely, float r) {
    x = xpos;
    y = ypos;
    vx = velx*2;
    vy = vely;
    radius = r;
  }

  void update() {
    vy = vy; // particlesgoes straight up  
    y += vy; //y adds vy variable
    x += vx; //x adds vy variable
  }

  void display() {
    fill(c);
    ellipse(x, y, radius*2, radius*2);
  }
}


class GenParticle extends Particle {
  float originX, originY;

  GenParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r);
    originX = ox;
    originY = oy;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-1.0, 1.0);
      vy = random(-4.0, -2.0);
    }
  }
}

class LeftParticle extends Particle {
  float originX, originY;
  float gravity=0.2; //set gravity
  float speed=1;
  float friction=1;

  LeftParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn,vxIn,vyIn,r);
    originX=ox;
    originY=oy;
  }
  
  void update(){
    vy=vy+gravity; 
    y+=vy;
    x+=vx;
    
    speed=speed+gravity; //causes the particle to float down and bounce
    speed=speed+friction; //causes the particle to slow down
    y=y+speed;
    if(y>(height-radius)){
      y=height-radius;
      speed=-speed; //decreases speed
    }
  }

  void regenerate() {
    if ((x>width+radius) || (x<-radius) || (y>height + radius) || (y<-radius)) {
      x=originX;
      y=originY;
      vx= random(-1.0, 1.0);
      vy= random(-6, -4);
    }
  }
}

class RightParticle extends Particle {
  float originX, originY;
    float gravity=0.6;
  float speed=1;
  float friction=.99;

  RightParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn,yIn,vxIn,vyIn,r);
    originX=ox;
    originY=oy;
  }
    
    void update(){
    vy=vy+gravity;
    y+=vy;
    x+=vx;
    
    speed=speed+gravity; //makes particle go down and bounce
    speed=speed+friction; //slows it down
    y=y+speed;
    if(y>(height-radius)){
      y=height-radius;
      speed=-speed; //slows down the speed 
    }
  }

  void regenerate() {
    if ((x>width+radius) || (x<-radius) || (y>height + radius) || (y<-radius)) {
      x=originX;
      y=originY;
      vx= random(-1.0, 1.0);
      vy= random(-6, -4);
    }
  }
}


