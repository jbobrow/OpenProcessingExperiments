
Mover[] movers = new Mover[5];//connect to the mover, and 5 represent there are five balls
import ddf.minim.*;//put in the media 
Minim minim; // audio engine
AudioPlayer thesound;

void setup() {
  size(500, 600);
  randomSeed(1);
  smooth();
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1, 4), random(width), 0);
  }
  minim = new Minim(this);//sound valuable 
  thesound = minim.loadFile("data/bomb.mp3");//input the sounds data
}

void draw() {
  background(200);
  if(mousePressed){
          playSound(); 
  }

  for (int i = 0; i < movers.length; i++) {

    int x=0;
    PVector wind = new PVector(x,x);//wind gravity
    if (mousePressed){//setting the action when mouse pressed
    x=x+5;
    wind = new PVector(x,x);//random wind gravity
    }
    if (keyPressed){//do the same function like mouse
    float k = 5;
    wind.mult(-1); 
    wind.normalize();
    wind.mult(k);
  }
    
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    
    float c = 0.05;
    PVector friction = movers[i].velocity.get();
    friction.mult(-1); 
    friction.normalize();
    friction.mult(c);
    
 if (movers[i].location.x > width) {

      playSound(); 
    } else if (movers[i].location.x < 0) {
      playSound(); 

    }

    if (movers[i].location.y >= height) {

      playSound(); 
    }
    

    movers[i].applyForce(friction);
    movers[i].applyForce(wind);

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}



void playSound()//It is the function to play sound
{
  thesound.cue(0);
  thesound.play();
}




class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x , float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(0,127);
    ellipse(location.x,location.y,mass*16,mass*16);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;

    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;

    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;

    }else if (location.y < 0) {
      location.y = 0;
      velocity.y *= -1;

    }

  }

}





