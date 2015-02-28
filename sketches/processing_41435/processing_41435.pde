
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int num = 10;

AudioPlayer player;
AudioPlayer Press;
AudioPlayer mover;
Minim minim;




Ball[] ball = new Ball[num];

void setup() {
  size(700,400, P2D);
  smooth();
  
  minim = new Minim(this);
  mover = minim.loadFile("move.wav");
    player = minim.loadFile("passthrough.wav");
     Press = minim.loadFile("Press.wav");
  mover.play();
  mover.loop();
  

  for (int i = 0; i < ball.length; i++) {
    ball[i] = new Ball(); 
  }
}

void draw() {
  
  
   if (mousePressed){
     Press = minim.loadFile("Press.wav");
    Press.loop(0);
 

  }
  
  noStroke();
  fill(255,80);
  rect(0,0,width,height);

  for (int i = 0; i < ball.length; i++) {
    ball[i].update();
    ball[i].passthrough();
    ball[i].display(); 

  }
}

 
class Ball {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Ball() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed =6;
  }

  void update() {

    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);  
    dir.normalize();    
    acceleration = dir;  
 

  if(mousePressed){
      dir.mult(-0.3);
      
    location.x += random(-5, 5);
    location.y += random(-5, 5);
  
    
    }

    else{
      dir.mult(0.3);
    }

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    strokeWeight(2);
    fill(0);
    stroke(255,20);
    ellipse(location.x,location.y,10,10);

       
  }

  void passthrough() {

    if (location.x > width) {
      location.x = 0;
     
      player.loop(0);
    } else if (location.x < 0) {
      location.x = width;
      player.loop(0);
    }

    if (location.y > height) {
      location.y = 0;
      player.loop(0);
    }  else if (location.y < 0) {
      location.y = height;
      player.loop(0);
    }

  }

}  





