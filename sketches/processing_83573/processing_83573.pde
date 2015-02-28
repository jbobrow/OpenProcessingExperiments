
Particle[] particles = new Particle[0];
int maxParticles = 900; 
SpaceShip[] ships = new SpaceShip[0]; 
int score = 0; 
float speed = 2; 
PImage spaceshipImage; 

void setup() { 
  size(600, 400);
  spaceshipImage = loadImage("imgres.png");
}

void draw() { 
  background(0); 
  fill(255); 
  text("score:" + score, 10,40); 
  
  updateShips(); 
  updateParticles(); 
  
}

void mousePressed() { 
  for (int i = 0; i<ships.length; i++) { 
    SpaceShip ship = ships[i]; 

    if ((mouseX>ship.x) && (mouseX<ship.x + ship.w) && (mouseY>ship.y) && (mouseY<ship.y+ship.h)) {
      ship.alive = false;
      ship.velX = 0; 
      score++; 
      makeExplosion(ship.x + (ship.w/2), ship.y+(ship.h/2)); 
    }
  }
}

void updateParticles() { 
  
  
  
  while(particles.length>maxParticles) { 
    particles = (Particle[]) subset(particles, 1);  
    
  }

  for(int i=0; i<particles.length; i++) {   
    particles[i].update();

  }
  
}

void updateShips() { 
  
  if (frameCount % 40 == 0) { 
    SpaceShip ship = new SpaceShip(); 
    ships = (SpaceShip[]) append(ships, ship);
    speed +=0.05; 
  }

  if (ships.length>10) { 

    ships = (SpaceShip[]) subset(ships, 1);
  }

  for (int i = 0; i<ships.length; i++) { 
    ships[i].update();
  }
}

void makeExplosion(float xpos, float ypos) { 
   
    for(int i = 0; i<100; i++) { 
    Particle p = new Particle(xpos,ypos);
    p.yVel = random(-3,3); 
    p.xVel = random(-3,3); 
    //p.opacity = random(50,100);
    p.gravity = 0.1; 
    //p.fadeSpeed = 0.96;
    p.shrink = 0.96; 
    
    particles = (Particle[]) append(particles, p );
  }
  
}


class Particle {
  
  float x; 
  float y; 
  float xVel; 
  float yVel;
  float particleSize; 
  float opacity; 
  float gravity; 
  float fadeSpeed; 
  float shrink; 
  
  Particle(float xpos, float ypos) { 
    x = xpos; 
    y = ypos; 
    xVel = random(-5,5); 
    yVel = random(-5,5); 
    particleSize = random(5,20);
    
    opacity = 255; 
    gravity = 0;
    fadeSpeed = 1; 
    shrink =1; 
     
  }
  
  void update() { 
    x+=xVel;
    y+=yVel; 
    opacity*=fadeSpeed;
    yVel += gravity; 
    particleSize*=shrink; 
    
    noStroke();
    fill(255,opacity);
    ellipse(x, y, particleSize, particleSize);
  }
  
}

class SpaceShip {
  float x; 
  float y; 
  float w; 
  float h; 
  float velX; 
  float velY; 
  boolean alive; 

  SpaceShip() { 

    y = random(0, height*0.7); 
    w = 50; 
    x = width; 
    h = 30; 
    velX = -speed; 
    velY = 0; 
    alive = true;
  }  

  void update() { 
    x+=velX; 
    y+=velY; 
    
    if(alive) { 
      fill(255, 0, 0); 
      stroke(255);   
    } else { 
      fill(128,0,0);  
      noStroke(); 
      velY +=0.3; 
    }
    image(spaceshipImage, x, y, w, h); 
    //rect(x, y, w, h);
  }
}



