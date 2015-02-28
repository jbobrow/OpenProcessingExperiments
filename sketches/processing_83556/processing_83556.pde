
SpaceStar[] stars = new SpaceStar[0];
Particle[] particles = new Particle[0];
int maxParticles = 200;
int score = 0;
float rectY = 100;
float rectX = 100;
float yspeed = 5;
float xspeed = 5;
float xslow = 5;
float rectW = 80;
float rectH = 40;
PImage nyancat;
PImage star;
PImage nyanbg;


void setup() {
  frameRate(60); 
  size(600, 400);
  nyanbg = loadImage ("nyanbg.png");
  nyancat = loadImage("character.png");
  star = loadImage("Star.png");
  
  smooth();
}

void draw() {
  image(nyanbg,0,0,600,400);
  fill(255);
  text("score:" + score, 10, 10);
  fill(255,0);
  noStroke();
  rect(rectX, rectY, rectW, rectH);
  image(nyancat, rectX, rectY);

/// Controls nyancats movement
  if (keyPressed) {
    if (key==CODED) {
      if (keyCode == UP) {
        rectY = rectY - yspeed;
      }

      if (keyPressed) {
        if (keyCode == DOWN) {
          rectY = rectY +yspeed;
        }
        if (keyPressed) {
          if (keyCode == RIGHT) {
            rectX = rectX +xslow;
          }
          if (keyPressed) {
            if (keyCode == LEFT) {
              rectX = rectX -xspeed;
            }
          }
        }
      }
    }
  }
            // 
            if (frameCount % 60 == 0) {
              SpaceStar ship = new SpaceStar();
              stars = (SpaceStar[]) append(stars, ship);
            }

            if (stars.length>5) {
            fill(255);
             // stars = (SpaceStar[]) subset(stars, 1);
            }

            for (int i = 0; i<stars.length; i++) {
              stars[i].update();
            }


            if (particles.length>maxParticles) {
              particles = (Particle[]) subset(particles, 1);
            }
            // for loop for updating particles in the array
            for (int b=0; b<particles.length; b++) {
              // REFERS TO THE FUNCTION
              particles[b].update();
            }

            for (int i = 0; i<stars.length; i++) {
              SpaceStar ship = stars[i];
                // NEED ADVICE ON MAKING THIS HITBOX WORK
              if ((rectX+rectW>ship.x) && (rectX+rectW<ship.x + ship.w) && (rectY+rectH>ship.y) && (rectY+rectH<ship.y+ship.h)) {
                ship.alive = false;
                score++;
                for (int b = 0; b<3; b++) {
                  Particle p = new Particle(rectX+80, rectY+20);
                  // sets the gravity to 0
                  p.yVel = random(-2, 1);
                  p.xVel = random(-2, 2);
                  //p.opacity = random(80,160);
                  // p.gravity = 0.5;
                  // p.fadespeed = 0.96;
                  p.shrink = 0.99;
                  // this line of code makes a new particle and appends it onto the end of the particles Array
                  // name of array (particles) / (particle[]) = force code, append adds to a particle
                  particles = (Particle[]) append(particles, p);
                }
              }
            }
          }



          class SpaceStar {
            float x;
            float y;
            float w;
            float h;
            float velX;
            float velY;
            boolean alive;

            SpaceStar() {

              y = random(0, height*0.8);
              w = 40;
              x = width;
              h = 40;
              velX = -5;
              velY = 0;
              alive = true;
            } 

            void update() {
              x+=velX;
              y+=velY;

              if (alive) {
                 noStroke();
                image(star,x, y, w, h);
              } 
              else {
                
                fill(255);
                //stars = (SpaceStar[]) subset(stars, 1);
              

                //velY +=0.8;
              }
              smooth();
              noStroke();
              
            }
          }

class Particle {

  float x;          // adds x position property
  float y;          // adds y position property
  float xVel;       // adds xvel property
  float yVel;       // adds yvel property
  float partsize;   // adds a size property
  float opacity;
  float gravity;
  float fadespeed;
  float shrink;
  float r = random(0,255);
  float rtwo = random(100,15);
  

  //Constructor = function// float says where it is xpos/ypos
  Particle(float xpos, float ypos) {
    // assigning the values
   // x = xpos = random (0, 600);    // causes it to snow in a line
    x = xpos;
    y = ypos;
    
    partsize = random (2, 3);
    // THE ABOVE IS A VARIABLE OF THE OPACITY
    gravity=0;
    fadespeed = 0.80;
    
   
  }
  
  //FUNCTION
  void update() {
   x+=xVel;
   y+=yVel;
   // Times the particle colour by itself, causing them to fade out
   opacity*=fadespeed;       // Causes the particle to fade out
   yVel +=gravity;    // adds gravity through the float
   partsize*=shrink;    // causes particles to shrink
   
   noStroke();
   // white with transparency
   
  colorMode(HSB);
  fill(x,y,x);
   ellipse(x,y,partsize, partsize);
   
   
  }
    
  }




