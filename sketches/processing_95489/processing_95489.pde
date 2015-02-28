
Particle_System PS;
PVector mouseP = new PVector(0,0,0);
PVector mouseV = new PVector(0,0,0);

void setup(){
  size(1200, 700, P2D);
  rectMode(CENTER);
  shapeMode(CENTER);
  PS = new Particle_System(0,.1);
}

void draw(){
  background(0,0,0);
  PS.run();
  if(frameCount%6 == 0){
      mouseV.set(mouseX - mouseP.x, mouseY - mouseP.y, 0);
      mouseV.div(7);
      mouseP.set(mouseX, mouseY, 0);
  }
}









class thing{
  
  PVector location;
  PVector velocity;
  PVector gravity = new PVector(0,0,0);
  float life, rate;
  
  thing(int x, int y, PVector g){
    location = new PVector(x,y,0);
    velocity = new PVector(random(-2, 2) + mouseV.x, random(-2,2) + mouseV.y,0);
    gravity.set(g);
    life = 250;
    rate = 2;
  }
  
  void run(){
    display();
    move();
    life -= rate;
  }
  
  void display(){
    point(location.x, location.y);
  }
  
  void move(){
    if(location.y >= height){
      velocity.y = -abs(velocity.y);
    } else{
        velocity.add(gravity);
    }
    location.add(velocity);
    if(location.x > width){
      velocity.x = -.8*abs(velocity.x);
    } else{
      if(location.x < 0){
        velocity.x = .8*abs(velocity.x);
      }
    }
  }
}
  
  
  
class square extends thing{
  
  color thisColor;
  
  square(int x, int y, PVector g){
    super(x, y, g);
    thisColor = color(random(250), random(250), random(250));
  }
  
  void display(){
    fill(thisColor, life);
    rect(location.x, location.y, 50, 50);
  }
}




class circle extends thing{
  
  color thisColor;
  
  circle(int x, int y, PVector g){
    super(x, y, g);
    thisColor = color(random(250), random(250), random(250));
  }
  
  void display(){
    fill(thisColor, life);
    ellipse(location.x, location.y, 50, 50);
  }
}



class Particle_System{
  
  ArrayList<thing> things;
  PVector gravity;
  Particle_System(float gx, float gy){
    things = new ArrayList();
    gravity = new PVector(gx, gy, 0);
  }
  
  void run(){
    for(int i = 0; i < things.size(); i++){
      thing temp = things.get(i);
      if(temp.life < 0){
        things.remove(temp);
      } else{
        temp.run();
      }
    }
    if(things.size() < 150){
        addNew();
    }
  }
  
  
  void addNew(){
    float r = random(1);
    if(r > .3){
      things.add(new circle(mouseX, mouseY, gravity));
    } else{
      things.add(new square(mouseX, mouseY, gravity));
    }
  }
  
}
