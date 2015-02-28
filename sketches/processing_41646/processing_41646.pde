
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//number of particles

int num = 300;

//Audioplayers

AudioPlayer player;
AudioPlayer Press;
AudioPlayer mover;
AudioPlayer release;
Minim minim;



Ball[] ball = new Ball[num];

void setup() {
  size(700, 400, P2D);
  minim = new Minim(this);

  //sound files

    mover = minim.loadFile("move.wav");
  release = minim.loadFile("release.wav");
  player = minim.loadFile("passthrough.wav");
  Press = minim.loadFile("Press.wav");

  mover.loop();

  for (int i = 0; i < ball.length; i++) {
    ball[i] = new Ball();
  }
}



void draw() {

  // Jitter sound ( mouse click sound )

  if (mousePressed) {

    Press.rewind();
    Press.play();
  }

  //creates the trail and fade length

  noStroke();
  fill(255, 30);
  rect(0, 0, width, height);

  //array of particles and 

  for (int i = 0; i < ball.length; i++) {
    ball[i].update();
    ball[i].passthrough();
    ball[i].display();
  }
}

//visuals behind ellipse

void spikyBall(float x, float y, float rad, int count) {
  float theta = TWO_PI/(count+0.0);

  for (int i = 0; i < count; i++) {
    line(x, y, x+cos(theta*i)*rad, y+sin(theta*i)*rad);
  }
} 

// play sound when mouse is released

void mouseReleased() {

  release.loop(0);
}


class Ball {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;


  // variables for particle

  Ball() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);

    //speed control

    topspeed = 5;
  }

  void update() {

    //variables for mouse movement

    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);  
    dir.normalize();    
    acceleration = dir;  


    // Jitter function and acceleration

    if (mousePressed) {
      dir.mult(-0.5);

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


  // visuals of particle

  void display() {

    strokeWeight(2);

    fill(0, random(30, 100));
    stroke(0, random(10, 20));
    spikyBall(location.x, location.y, 7, 8);
    ellipse(location.x, location.y, 6, 6);
  }


  //allows particle to go through screen to other side and trigger sound

  void passthrough() {

    if (location.x > width) {
      location.x = 0;
      player.rewind();
      player.play();
    } 
    else if (location.x < 0) {
      location.x = width;
      try {
        player.rewind();
        player.play();
      }
      catch(Exception e) {
      }
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

//////////////Created by Jordan Shand/////////////////////////
//////////Sounds Created by Jordan Shand/////////////////////



/* tutorials used
 - http://www.openprocessing.org/visuals/?visualID=18798
 - http://processing.org/learning/pvector/
 */

