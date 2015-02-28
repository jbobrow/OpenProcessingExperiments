
ArrayList particles;

Fan f;
int fSize = 50; // fan size
float fSpeed=0.01; // fan speed

void setup() {
  size(700, 700);
  particles = new ArrayList();
  smooth();
  noCursor(); //hide cursor
  f = new Fan();
}

void draw() {
  particles.add(new Particle());

  background(160);

  for (int i=0; i < particles.size(); i++) {
    Particle p = (Particle) particles.get(i);
    p.run();
    p.display();
    p.wind(mouseX,mouseY);
    
    if ((p.y>height) || (p.y<0) || (p.x>width) || (p.x<0)) {
      particles.remove(i); // delete particle
    }

  }
  f.display();
  f.update();
}


class Fan {
  float x;
  float y;
  float rotation;

  Fan() {
    x= mouseX;
    y= mouseY;
  }

  void update() {
    x=mouseX;
    y=mouseY;
    rotation+=fSpeed;
  }
  
  void display() {
      noStroke();
      fill(0);
      pushMatrix();
      translate(mouseX, mouseY);
      rotate(rotation);
      rect(-1, 0-(fSize/2), 3, fSize);
      popMatrix();
      if (mousePressed) {
    if(fSpeed<0.8){
      fSpeed+=0.01;
    }
      }
    else {
      if(fSpeed>0.02){
        fSpeed-=0.01;
      }
    }
  }
}


class Particle {
  float x;
  float y;
  float xspeed;
  float yspeed;
  float r;


  Particle() {
    x= width/2;
    y= height/2;
    xspeed= random(-0.5, 0.5);
    yspeed= random(-0.5, 0.5);
    r=random(5,15);
  }

  void run() {
    x = x+xspeed;
    y = y+yspeed;
  }

  void wind(float posx,float posy){
    float d = dist(posx,posy,x,y);
    float r = atan2(mouseY-y,mouseX-x)+PI;
   
    if(d<fSize){
        xspeed = xspeed + (d * cos(r))/(100/fSpeed);
        yspeed = yspeed + (d * sin(r))/(100/fSpeed); 
  }
}

  void display() {
    noStroke();
    fill(0,255,255);
    ellipse(x,y, r, r);
  }
}



