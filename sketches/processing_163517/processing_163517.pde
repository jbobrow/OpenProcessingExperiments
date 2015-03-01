
/* 
 A Cloud Maker (WORKS BEST WITH A LARGE WINDOW, NOT ON THE WEB)
 
 Using particles, PGraphics and complex coloring techniques to create an interactive cloud maker.
 */

ArrayList clouds = new ArrayList();
boolean move = false, orange, blue, pink, grey = true;
float a = 0;

void setup() {
  size(640, 640);
}

void draw() {
  /* Try black */
  background(255);
  for (int i = 0; i < clouds.size (); i++) {
    Cloud c = (Cloud) clouds.get(i);
    c.draw();
  }

  /* Start the count to how big the cloud will be  */
  if (mousePressed && a < width/16) a += 0.5;
  fill(0);
  text("Size: " + a, mouseX, mouseY);
}

void mouseReleased() {
  /* Add "a" and then clear it for the next cloud */
  clouds.add(new Cloud(new PVector(mouseX-50, mouseY+50), (int)a));
  a = 0;
}

void keyPressed() {
  /* Clear Sky */
  if (key == ' ') clouds.clear();
  /* Toggle move */
  if (key == 'm' && move) {
    move = false;
  } else if (key == 'm' && !move) {
    move = true;
  }
  if (key == '1') {
    orange = true; 
    blue = false; 
    pink = false; 
    grey = false;
  }
  if (key == '2') {
    orange = false; 
    blue = true; 
    pink = false; 
    grey = false;
  }
  if (key == '3') {
    orange = false; 
    blue = false; 
    pink = true; 
    grey = false;
  }
  if (key == '4') {
    orange = false; 
    blue = false; 
    pink = false; 
    grey = true;
  }
}

class Cloud {
  ArrayList cloudParticles = new ArrayList();

  Cloud(PVector loc, int a) {
    PVector vel = new PVector(random(0.2, 0.5), 0);
    for (int i = -a; i <= a; i++) {
      /* 
       s is where we calculate the size of the cloud depending where it is located. 
       We add randomness to make it more realistic. 
       */
      int s = (int)map(abs(i), 0, a, 50+random(-10, 10), 5);
      /* Add CloudParticle(Location, Velocity (When we want to move it), size); */
      cloudParticles.add(new CloudParticle(new PVector(loc.x+i*10, loc.y+random(-20, 20)), vel, s));
    }
  }

  void draw() {
    for (int i = 0; i < cloudParticles.size (); i++) {
      CloudParticle c = (CloudParticle) cloudParticles.get(i);
      c.drawCloudParticle();
    }
  }
}

class CloudParticle {
  PVector loc;
  PVector vel;
  int r;
  /* 
   We use a PGraphic becuase we don't want to keep redrawing hundreds of particles per frame. Instead, when we click,
   it draws the particles, convertes it into an image, then just draws the image.
   
   We multiply by 2 because in our loops we increment by 2. 
   */
  PGraphics pg;

  CloudParticle(PVector loc, PVector vel, int s) {
    this.loc = loc;
    this.vel = vel;
    /* This makes the cloud bigger in the middle and then spread out. s cannot be less than 1. */
    if (s <= 1) {
      r = 2;
    } else {
      r = s;
    }

    pg = createGraphics(r*2, r*2);
    float t = random(0, 30);

    /* 
     The 2 for loops made a square. However if we put an if statement saying only draw if the coords distance from
     the center of the particle are less than r (r is the size of the particle) 
     */
    for (int x = -r; x < r; x+=2) {
      for (int y = -r; y < r; y+=2) {
        float radius = dist(0, 0, x, y);
        if (radius <= r) {
          pg.beginDraw();
          pg.noStroke();
          /* 
           This is the fading of each particle in the clouds areas. We make the pink color, then minus a
           random number to add texture to the cloud, then minus y to make the bottom of the cloud darker 
           
           I made a list of other colours below.
           */
          if (pink) { 
            pg.fill(255-t, 100-t-x*3, 100-t-y*3, r-radius);
          } else if (blue) { 
            pg.fill(100-t+x*3, 100-t-y*3, 255-t-x, r-radius);
          } else if (orange) { 
            pg.fill(255-t-y*3, 100-t+x*3, 0, r-radius);
          } else if (grey) { 
            pg.fill(150-t-y*3, 150-t-y*3, 150-t-y*3, r-radius);
          }
          pg.ellipse(r+x, r+y, 4, 4);
          pg.endDraw();
        }
      }
    }
  }

  void drawCloudParticle() {
    /* Again multipy by 2 */
    image(pg, loc.x, loc.y, r*2, -r*2);

    if (move)loc.add(vel);
    if (loc.x >= width) {
      loc.x = -r*2;
    }
  }
}



