
/* 
 A bit of a celebration for finishing year 12.
 
 However the sketch is a nice use of objects and simple vector manipulation.
 */

ArrayList fws = new ArrayList();

void setup() {
  size(640, 640);
  /* Would normally not change this however it keeps the sketch at a consistent speed */
  frameRate(30);
}

void draw() {
  fill(0, 30);
  rect(-1, -1, width+1, height+1);
  /* 
   Iterate over every FireWork object and draw them. Also check if the firework is dead by
   a boolean statement.
   */
  for (int i = 0; i < fws.size (); i++) {
    FireWork f = (FireWork) fws.get(i);
    f.draw();
    if (f.dead) {
      fws.remove(f);
    }
  }

  if ((frameCount % 15) == 0) {
    fws.add(new FireWork(new PVector(random(width), random(height))));
  }
}

class FireWork {
  /* We store each particle in an arraylist */
  ArrayList fw = new ArrayList();
  PVector loc;
  boolean dead = false;

  FireWork(PVector loc) {
    this.loc = loc;
    /* You can change each individual particle's color by puting the below line in the for loop. */
    color c = color(random(100, 255), 0, random(100, 255));
    for (int i = 0; i < 360; i+=6) {
      /* Makes the particle's go in a cirlce */
      float x = sin(radians(i))*4;
      float y = cos(radians(i))*4;
      /*
      Acceleration is, for every frame, how much we move the particle on the x and y axis. We want it to be a low number
       because imagine what would happen if in every frame we move the particle 50 pixels. Not so visually appealing. 
       So we first get its location on the axis so x or y. Then we minus itself with its new location which is our variables
       x and y. So its position - (position - new Position). Its difficult to understand at first.
       */
      PVector acc = new PVector(loc.x-(loc.x+x), loc.y-(loc.y+y));

      fw.add(new Particle(new PVector(loc.x+x, loc.y+y), acc, c));
    }
  }

  void draw() {
    /* 
     Draw each particle and check if they are dead. When 1 particle is dead we make the FireWork dead. Which then deletes the 
     entire FireWork. This saves us deleting the particles first then the FireWork.   
     */
    for (int i = 0; i < fw.size (); i++) {
      Particle p = (Particle) fw.get(i);
      p.drawParticle();
      p.move();
      if (p.dead) {
        dead = true;
      }
    }
  }
}

class Particle {
  PVector loc;
  PVector sloc; //The starting location. For the lines.
  PVector vel;
  PVector acc;
  color c;
  boolean dead = false;

  Particle(PVector loc, PVector acc, color c) {
    this.loc = loc.get();
    this.sloc = loc.get();
    this.acc = acc.get();
    this.c = c;
    vel = new PVector(0, 0);
  }

  void drawParticle() {
    /* Variable s takes the distance between itself and its starting location. Then makes that value between 1 and 60. */
    float s = map(dist(sloc.x, sloc.y, loc.x, loc.y), 0, width/2, 1, 60);
    stroke(c, 250-s*6);
    fill(c, 250-s*6);
    ellipse(loc.x, loc.y, s, s);
    /* The second x and y locations look familiar. */
    line(loc.x, loc.y, loc.x-(loc.x-sloc.x)/2, loc.y-(loc.y-sloc.y)/2);

    /*
     We use the same formular for the transperency of the particles so that when its completely gone we can delete it.
     
     NOTICE: We multiply by 4 instead of 6 because when deleting a FireWork, it flashes right before it is deleted. So 
     by multiplying it by 4 the value will get to 0 slower and makeing the FireWork still be alive for a little longer
     but fixes the problem.
     */
    if (250-s*4 <= 0) {
      dead = true;
    }
  }

  void move() {
    vel.add(acc);
    loc.add(vel);
    /* Vel gets to fast so we divide by 6 to make it slower. */
    vel.div(6);
  }
}



