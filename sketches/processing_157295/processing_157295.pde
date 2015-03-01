
ArrayList particles;
int num;
int amount = 5;

void setup(){
  size(320, 480);
  particles = new ArrayList();
  smooth();
  num = 0;
}

void draw(){
  num += 1;
  if(num<amount) {
    particles.add(new Particle("good"));
    particles.add(new Particle("bad"));
  }
  background(#FFCC00);
  for(int i=0; i < particles.size(); i++){
    Particle p = (Particle) particles.get(i);
    p.run();
    //p.gravity();
    p.display();
    p.conect();
    p.dead();
    if(p.death){
      particles.remove(i);
    }
  }



}

void mousePressed(){
  num = 0;
}

class Particle{
  float x;
  float y;
  float xspeed = 0;
  float yspeed = 0;
  float myDiameter= 2;
  float distance = 60;
  float delay = random(0.001, 0.01);
  float elastic = 0.98;
  int life =0, lifeTime = 50+int(random(200));
  boolean death = false;
  String tp;

  
  Particle(String type){
    tp = type;
    if(tp == "good") {
      x= int(random(width));
      y= int(random(height));
    }
    if(tp == "bad") {
      x= mouseX;
      y= mouseY;
      xspeed= random(-1, 1);
      yspeed= random(-1, 1);  
    }
  }
    
  void run(){
    if(tp == "good") {
      float dx = mouseX - x;
      float dy = mouseY - y;
      xspeed = dx*delay+xspeed*elastic;
      yspeed = dy*delay+yspeed*elastic;
      x = x+xspeed;
      y = y+yspeed;
    }
    if(tp == "bad") {
      x = x+xspeed;
      y = y+yspeed; 
    }
    
  }
    
  void display(){
    stroke(0);
    fill(0);
    ellipse(x, y, 2, 2);
  }
  
  void gravity(){
    yspeed += 0.01;
  }
  
  void dead() {
    life += 1;
    if(life>lifeTime) {
      death = true;  
    } else {
      death = false;
    } 
  }
  
  void conect() {
    for (int i = 0; i <particles.size() ; i++) {
      
      Particle other = (Particle) particles.get(i);
 
      if (this != other) {
        if (dist(x, y, other.x, other.y)<distance) {
          stroke(0);
          line(x, y, other.x, other.y);
          noStroke();
          fill(0, 0, 0, random(255));
          ellipse(x,y,myDiameter*5,myDiameter*5);
        }
      }
    } //end for
  }
  
    
}
