
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int num = 300;

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

  mover.loop();

  for (int i = 0; i < ball.length; i++) {
    ball[i] = new Ball();
  }

  player = minim.loadFile("passthrough.wav");
  Press = minim.loadFile("Press.wav");
}

void draw() {





  if (mousePressed) {

    Press.rewind();
    Press.play();
  
  }

  noStroke();
  fill(255,50);
  rect(0,0,width,height);

  for (int i = 0; i < ball.length; i++) {
    ball[i].update();
    ball[i].passthrough();
    ball[i].display();
  }
}

void spikyBall(float x, float y, float rad, int count) {
  float theta = TWO_PI/(count+0.0);

  for(int i = 0; i < count; i++) {
    line(x,y,x+cos(theta*i)*rad,y+sin(theta*i)*rad);
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


    if(mousePressed) {
      dir.mult(-0.3);

      location.x += random(-5, 5);
      location.y += random(-5, 5);
    }

    else {
      dir.mult(0.3);
    }

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    //  strokeWeight(2);
    fill(0,random(60,100));
    stroke(0,random(60,90));
    spikyBall(location.x,location.y,6,6);
  }

  void passthrough() {

    if (location.x > width) {
      location.x = 0;
      player.rewind();
      player.play();
    } 
    else if (location.x < 0) {
      location.x = width;
      try{
      player.rewind();
      player.play();
      }catch(Exception e){}
    }

    if (location.y > height) {
      location.y = 0;
      player.rewind();
      player.play();
    }  
    else if (location.y < 0) {
      location.y = height;
      player.rewind();
      player.play();
    }
  }
}  




