
Particle[] particles = new Particle[0];
SpaceRock[] rocks = new SpaceRock[0];

int maxParticles = 300;
SpaceShip[] ships = new SpaceShip[0];
int score = 0;
float speed = 2;
float rectY = 100;
float rectX = 100;
float yspeed = 5;
float xspeed = 5;
float rectW = 80;
float rectH = 40;
float xslow = 5;
player cat;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
PImage nyancat;
PImage star;
PImage nyanbg;

 
void setup() {
  size(600, 400);
  cat = new player();
  
  nyanbg = loadImage ("nyanbg.png");
  nyancat = loadImage ("character.png");
  star = loadImage("Star.png");
  
}
 
void draw() {
  background(0);
  image(nyanbg,0,0,600,400);
  cat.update();
  fill(255);
  text("score:" + score, 10,40);

   
  updateShips();
  updateParticles();
   
}

class player {
  float x;
  float y;
  
  float speed = 4;
  player() {
    x = width/5;
    y = height/5;
}

void update() {
  
  if(leftPressed) rectX-=speed;
  else if(rightPressed) rectX+=speed;
  
  if(upPressed) rectY-=speed;
  else if (downPressed) rectY+=speed;
  
 // fill(28,116,111);
  image(nyancat,rectX,rectY);
  
   for (int i = 0; i<ships.length; i++) {
    SpaceShip ship = ships[i];
 
    if ((rectX+rectW>ship.x) && (rectX+rectW<ship.x + ship.w+50) && (rectY+rectH>ship.y) && (rectY+rectH<ship.y+ship.h+40)) {
      ship.alive = false;
      ship.velX = 50;
      score++;
      makeExplosion(ship.x + (ship.w/2), ship.y+(ship.h/2));
      
}
}


}
}

void keyPressed() {
 
  if (key == CODED) {
    if (keyCode == UP) {
      upPressed = true;
    }
    else if (keyCode == DOWN) {
      downPressed = true;
    }
    else if (keyCode == LEFT) {
      leftPressed = true;
    }
    else if (keyCode == RIGHT) {
      rightPressed = true;
    }
  }
}

 
void keyReleased() {
 
  if (key == CODED) {
    if (keyCode == UP) {
      upPressed = false;
    }
    else if (keyCode == DOWN) {
      downPressed = false;
    }
    else if (keyCode == LEFT) {
      leftPressed = false;
    }
    else if (keyCode == RIGHT) {
      rightPressed = false;
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

void meteors() {
 
  if (frameCount % 40 == 0) {
    SpaceRock rock = new SpaceRock();
    rocks = (SpaceRock[]) append(rocks, rock);
  }
 
  if (rocks.length>10) {
 
    rocks = (SpaceRock[]) subset(rocks, 1);
  }
 
  for (int i = 0; i<rocks.length; i++) {
    rocks[i].update2();
  }
}
 
void updateShips() {
   
  if (frameCount % 40 == 0) {
    SpaceShip ship = new SpaceShip();
    ships = (SpaceShip[]) append(ships, ship);
    speed +=0.05;
  }
 
  if (ships.length>10) {
 
    ships = (SpaceShip[]) subset(ships, 1);  //
  }
 
  for (int i = 0; i<ships.length; i++) {
    ships[i].update();
  }
}
 
void makeExplosion(float xpos, float ypos) {
    
    for(int i = 0; i<50; i++) {
    Particle p = new Particle(xpos,ypos);
   
    p.yVel = random(-3,3);
    p.xVel = random(-3,3);
    //p.opacity = random(50,100);
    //p.gravity = 0.1;
    //p.fadeSpeed = 0.96;
    p.shrink = 0.90;
     
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
    particleSize = random(5,10);
     
    //opacity = 255;
    gravity = 0;
    fadeSpeed = 0.96;
    shrink =0.91;
      
  }
   
  void update() {
    x+=xVel;
    y+=yVel;
    opacity*=fadeSpeed;
    yVel += gravity;
    particleSize*=shrink;
     
    noStroke();
    //fill(255,opacity);
    //ellipse(x, y, particleSize, particleSize);
    image(star,x,y,particleSize,particleSize);
  }
   
}
 
class SpaceShip {
  float x;
  float y;
  float w;
  float h;
  float velX;
  float velY;
  float velback;
  boolean alive;
 
  SpaceShip() {
 
    y = random(0, height*0.7);
    w = 40;
    x = width;
    h = 40;
    velX = -speed;
    velback = +100;
    velY = 0;
    alive = true;
  } 
 
  void update() {
    x+=velX;
    y+=velY;
     
    if(alive) {
      fill(255, 0, 0);
      image(star,x, y, w, h);

    } else {
      fill(255,0); 
      noStroke();
      velY +=50;

     
     
    }
    //rect( x, y, w, h);
    //rect(x, y, w, h);
  }
}
 
void mousePressed() {
  for (int i = 0; i<rocks.length; i++) {
    SpaceRock rock = rocks[i];
 
    if ((mouseX>rock.x) && (mouseX<rock.x + rock.w) && (mouseY>rock.y) && (mouseY<rock.y+rock.h)) {
      rock.alive = false;
      score++;
    }
  }
}
 
 
class SpaceRock {
  float x;
  float y;
  float w;
  float h;
  float velX;
  float velY;
  boolean alive;
 
  SpaceRock() {
 
    y = random(0, height*0.7);
    w = 50;
    x = width;
    h = 20;
    velX = -4;
    velY = 0;
    alive = true;
  } 
 
  void update2() {
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
    rect(x, y, w, h);
  }
}



