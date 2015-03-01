
//asteroids

import ddf.minim.*;

Minim minim;
AudioPlayer snd_shoot;

Player ship;
ArrayList<Shot> shots;
ArrayList<Asteroid> asteroids;

boolean keyUp = false;
boolean keyLeft = false;
boolean keyRight = false;
boolean keyShoot = false;


void setup() {
  size(1000, 800);
  frameRate(30);
  background(10);
  ship = new Player(width/2, height/2);
  shots = new ArrayList<Shot>();
  minim = new Minim(this);
  snd_shoot = minim.loadFile("Laser_Shoot12.wav");
  asteroids = new ArrayList<Asteroid>();
  noCursor();
  restart();
}


void draw() {
  rectMode (CORNER);
  fill(10, 80);
  noStroke();
  rect(0, 0, width, height);
  ship.display();
  ship.update();
  
  for(int i = 0; i < shots.size(); i++) {
    Shot tempShot = shots.get(i); //using this to represent the current shot in the array of shots and updating it
    tempShot.update();
    tempShot.display();
    tempShot.dissipate(i);
  }
  
  for(int i = 0; i < asteroids.size(); i ++) {
    Asteroid tempAst = asteroids.get(i);
    tempAst.update();
    tempAst.display();
    for (int j = 0; j < shots.size(); j++) {
      Shot tempShot = shots.get(j);
      tempAst.shotCollision(tempShot, tempAst, i, j);
    }
    if (ship.alive == true) {
      tempAst.playerCollision(ship, tempAst);
    }
  }
  if (ship.alive == false) {
    restart();
  }
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {keyUp = true;}
    if (keyCode == LEFT) {keyLeft = true;}
    if (keyCode == RIGHT) {keyRight = true;}
  }
  if (key == ' ') {keyShoot = true;}
    
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {keyUp = false;}
    if (keyCode == LEFT) {keyLeft = false;}
    if (keyCode == RIGHT) {keyRight = false;}
  }
  if (key == ' ') {keyShoot = false;}
}

void restart() {
  asteroids.clear();
  asteroids.add(new Asteroid(random(50,400), random(50, 750), random(1,3), 0, random(radians(359)), 0));
  asteroids.add(new Asteroid(random(50,400), random(50, 750), random(1,3), 0, random(radians(359)), 0));
  asteroids.add(new Asteroid(random(50,400), random(50, 750), random(1,3), 0, random(radians(359)), 0));
  ship.x = width/2;
  ship.y = height/2;
  ship.velocity = 0;
  ship.alive = true;
}
class Asteroid {
  float x;
  float y;
  float velocity;
  float angle;
  float rotation;
  float rotationRate;
  float w;
  int type;
  
  Asteroid(float X, float Y, float V, int T, float A, float R) {
    x = X;
    y = Y; 
    velocity = V;
    angle = A;
    type = T;
    rotation = R;
    
    //determine size based on 'type'
    if (type == 0) {
      w = random(80,100);
    } else if (type == 1) {
      w = random(60,80);
    } else if (type == 2) {
      w = random(30,60);
    } else if (type == 3) {
      w = random(15,25);
    } 
  }
  
  void update() {
    //check postion against screen size
    if ( x < 0 ) {x = width;} 
    if ( x > width) {x = 0;}
    if ( y < 0) {y = height;}
    if ( y > height) {y = 0;} 
    
    rotation += rotationRate; 
    x += cos(angle) * velocity;
    y += sin(angle) * velocity;
  }
  
  void display() {
    pushMatrix();
    translate(x,y); 
    noFill();
    stroke(200,255,255,180);
    rotate(rotation);
    ellipse(0,0,w,w);
    popMatrix(); 
  }
  
  void shotCollision(Shot shot, Asteroid asteroid, int asteroidIndex, int shotIndex) {
    if ( dist(x,y, shot.x,shot.y) < w/2 + 2) {
      shots.remove(shotIndex);
      if (asteroid.type == 0) {
        asteroids.add(new Asteroid(x+random(-5,5), y + random(-5,5), asteroid.velocity+random(1), 1, random(radians(359)),0));
        asteroids.add(new Asteroid(x+random(-5,5), y + random(-5,5), asteroid.velocity+random(1), 1, random(radians(359)),0));
      }
      else if (asteroid.type == 1) {
        asteroids.add(new Asteroid(x+random(-5,5), y + random(-5,5), asteroid.velocity+random(1), 2, random(radians(359)),0));
        asteroids.add(new Asteroid(x+random(-5,5), y + random(-5,5), asteroid.velocity+random(1), 2, random(radians(359)),0));
      }
      else if (asteroid.type == 2) {
        asteroids.add(new Asteroid(x+random(-5,5), y + random(-5,5), asteroid.velocity+random(1), 3, random(radians(359)),0));
        asteroids.add(new Asteroid(x+random(-5,5), y + random(-5,5), asteroid.velocity+random(1), 3, random(radians(359)),0));
      }
      asteroids.remove(asteroidIndex); 
    }
  }
  
  void playerCollision(Player player, Asteroid asteroid) {
    if ( dist(x, y, player.x, player.y) < w/2 + 5) {
      fill(200,255,255,180);
      ellipse(player.x,player.y,100,100);
      player.alive = false;
    }
  }
}
class Player {
  float x; 
  float y; 
  
  float velocity; 
  float angle; 
  float rotation;
  float rotationRate;
  
  float shotTimer;
  float shotRate;
  
  float maxVelocity;
  boolean alive;
  
  Player(float X, float Y) {
    x = X;
    y = Y; 
    
    shotRate = 5;
    shotTimer = 0;
    
    maxVelocity = 10;
    alive = true;
  }
  
  void display() {
    if (alive == true) {
    pushMatrix();
    translate(x,y);
    rotate(rotation);  
    noFill();
    stroke(200,255,255,180);
    triangle(0, 12, 8, -8, -8, -8);
    popMatrix();   
    }
  }
  
  void update() {
    if (alive == true) {
    //check postion against screen size
    if ( x < 0 ) {x = width;} 
    if ( x > width) {x = 0;}
    if ( y < 0) {y = height;}
    if ( y > height) {y = 0;} 
    
    rotation += rotationRate; 
    x += cos(angle) * velocity;
    y += sin(angle) * velocity;

    if (keyUp == true) {
      accelerate();
    } else {
      velocity = velocity - (velocity*0.01);
    }
    if (keyLeft == true) {rotation -= 0.1;}
    if (keyRight == true) {rotation += 0.1;}   
    if (shotTimer > 0) {
      shotTimer--;
    } else {
      shotTimer = 0;
    }
    
    
    if (keyShoot == true) {
    if (shotTimer == 0){
      shoot();
    }
    }
    }
  }
  
  void accelerate() {
    if (alive == true) {
    float xt = cos(angle) * velocity + cos(rotation + PI/2) * 0.25;
    float yt = sin(angle) * velocity + sin(rotation+ PI/2) * 0.25;
   if (velocity < maxVelocity) {
    velocity = sqrt(sq(yt)+sq(xt));
    angle = atan2(yt, xt);
   } else {
     velocity = maxVelocity - 0.1;
   }
   velocity = velocity - (velocity * 0.01);
    }
  }
  
  void shoot() {
    if (alive == true) {
    snd_shoot.play();
    snd_shoot.rewind();
    shots.add(new Shot(x, y, rotation + PI/2, 10, rotation + PI/2)); //using rotation of ship to get angle of shot, set value of velocity right now, could add in +velocity to include how fast the ship is going  
}
  }
}

class Shot {
  float x;
  float y;
  float velocity;
  float angle;
  float rotation;
  float rotationRate;
  
  int lifespan;
  int runtime;
  
  Shot(float X, float Y, float A, float V, float R) {
    x = X;
    y=Y;
    angle = A;
    velocity = V;
    rotation = R;
    
    lifespan = 35;
    runtime = 0;
  }
  
  
void display() {
  pushMatrix();
  translate(x, y);
  fill(200, 255, 255);
  ellipse(0,0,3,3);
  popMatrix();
}

void update() {
  //check postion against screen size
    if ( x < 0 ) {x = width;} 
    if ( x > width) {x = 0;}
    if ( y < 0) {y = height;}
    if ( y > height) {y = 0;} 
    
    rotation += rotationRate; 
    x += cos(angle) * velocity;
    y += sin(angle) * velocity;
}

void dissipate(int index) {
  runtime++;
    if (runtime > lifespan) {
      shots.remove(index);
    }
}

}


