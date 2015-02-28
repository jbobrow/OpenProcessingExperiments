
ArrayList particles;

void setup(){
  size(400, 600);
  particles = new ArrayList();
  smooth();
}

void draw(){
  particles.add(new Particle());
  background(255);
  for(int i=0; i < particles.size(); i++){
    Particle p = (Particle) particles.get(i);
    p.run();
    p.gravity();
    p.display();
  }
  if(particles.size()>100){
    particles.remove(0);
  }

    println(particles.size());
}

void mousePressed(){
  
  particles.add(new Particle());
}

class Particle{
  float x;
  float y;
  float xspeed;
  float yspeed;

  Boolean gone;
  
  Particle(){
    x= mouseX;
    y= mouseY;
    xspeed= random(-1, 1);
    yspeed= random(-2, 0);
    gone = false;
  }
    
    void run(){
      x = x+xspeed;
      y = y+yspeed;
    }
    
    void gravity(){
      yspeed += 0.1;
    }
    
    void display(){
      stroke(0);
      fill(0, 75);
      ellipse(x, y, 10, 10);
    }
  
    
}
