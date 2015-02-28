
/*
Made by Jared "BlueThen" C.
Created on November 6, 2009.
Refined, commented, polished, and updated on:
  November 7, 2009
  November 8, 2009
  and
  November 11, 2009
www.bluethen.com
This version: Mariana Mora
For this version, minor changes were introduced, the frame rate were
altered for a slower, dramatical, movement. And the border was eliminated
so it become part of the internal design, without lines. 
*/
 
/*
boolean lines determines whether our lines for particle relationships are drawn
toggle this by pressing any key, but 'g'
*/
boolean lines = false;
/*
gravity toggle
toggle this by pressing 'g'
*/
boolean gravity = true;
/* Particle count */
int particleCount = 500;
/* Particle array */
Particle[] particles = new Particle[particleCount+1];
void setup() {
  /* The app is 500 x 500 pixels */
  size(500,500);
  /* RGB colormode, with range of 0 to 400 */
  colorMode(RGB, 400);
  /* Frame rate is 30 */
  frameRate(15);
  /* The fill color is set to black (0) for the boundaries (drawn as a quad) */
  fill (0);
  /* We loop through our particle count and initialize each */
  for (int x = particleCount; x >= 0; x--) {
    particles[x] = new Particle();
  }
}
void draw() {
  /* The screen is cleared, and colored black */
  background(0);
  /* The stroke color is set to white for the border. */
  stroke (400);
   //stroke (50);
  /* The border; it is 10 pixels from all sides */
  quad (10,10,10,height-10,width-10,height-10,width-10,10); 
  /* All of our particles are looped through, and updated */
  for (int i = particleCount; i >= 0; i--) {
    Particle particle = (Particle) particles[i];
    particle.update(i);
  }
}
class Particle {
  /*
  Global class variables
  These are kept track of, and aren't lost when the class particle is finished operating.
  */
  /* the x and y are our coordinates for each particles */
  float x;
  float y;
  /* vx and vy are the velocities along each axis the particles are traveling */
  float vx;
  float vy;
  /* Particle initialization. We define the beginning properties of each particle here. */
  Particle() {
    x = random(10,width-10);
    y = random(10,height-10);
  }
  /* These are called everytime we check with the other particle's distances  */
  float getx() {
    return x;
  }
  float gety() {
    return y;
  }
  void update(int num) {
   /* Friction is simulated here */
   vx *= 0.84;
   vy *= 0.84;
   /* Here, every particle is looped through and checked to see if they're close enough to have effect on the current particle. */
   for (int i = particleCount; i >= 0; i--)  {
     /* Check to see if the particle we're checking isn't the current particle. */
     if (i != num) {
        /* drawthis boolean is initialized. it determines whether the particle is close enough to the other particles for relationship lines to be drawn, assuming it's enabled */
        boolean drawthis = false;
        /*
        Integers are used to keep track of the shade for each particle
        The red shade shows opposition
        The blue shade shows attraction
        */
        float redshade = 0;
        float blueshade = 0;
        /* We set our particle */
        Particle particle = (Particle) particles[i];
        /* The x and y coordinates of the particle is found, so we can compare distances with our current particle. */
        float tx = particle.getx();
        float ty = particle.gety();
        /* The radius or distance between both particles are determined */
        float radius = dist(x,y,tx,ty);
        /* Is the radius small enough for the particle to have an effect on our current one? */
        if (radius < 35) {
           /* We've the determine that the particle is close enough for relationship lines, so we set drawthis to true. */
           drawthis = true;
           /* If so, we proceed to calculate the angle. */
           float angle = atan2(y-ty,x-tx);
           /* Is the radius close enough to be deflected? */
           if (radius < 30) {
             /* Is relationship lines toggled? */
             if (lines) {
               /*
               Redshade is increased by the distance * 5. The distance is multiplied by 10 because our radius will be within 40 pixels,
               30 * 13.33... is 400
               We invert it so it gets redder as the particle approaches the current particle, rather than vice versa.
               */
               redshade = 13 * (30 - radius);
             }
             /*
             Here, we calculate a coordinate at a angle opposite of the direction where the other particle is.
             0.07 is the strength of the particle's opposition, while (40 - radius) is how much it is effected, according to how close it is.
             */
             vx += (30 - radius) * 0.07 * cos(angle);
             vy += (30 - radius) * 0.07 * sin(angle);
           }
           /*
           Here we see if the particle is within 25 and 35 pixels of the current particle
           (we already know that the particle is under 35 pixels distance, since this if statement is nested
           in if (radius < 35), so rechecking is unnecessary
           */
           if (radius > 25) {
             /* check to see if relationship lines are toggled */
             if (lines) {
               /* The blue shade, between 0 and 400, is used to show how much each particle is attracted */
               blueshade = 40 * (35 - radius);
             }
             /* This does the opposite of the other check. It pulls the particle towards the other.  */
             vx -= (25 - radius) * 0.005 * cos(angle);
             vy -= (25 - radius) * 0.005 * sin(angle);
           }
        }
        /* Check to see if relationship lines are enabled */
        if (lines) {
          /* Check to see if the two particles are close enough. */
          if (drawthis) {
             /* Set the stroke color */
             stroke (redshade, 0, blueshade);
                 //stroke (redshade, 100, blueshade);
             /* draw the line */
             line(x,y,tx,ty);
          }
        }
      }
    }
    /* Check to see if the user is clicking */
    if (mousePressed) {
      /* The cursor's x and y coordinates. */
      float tx = mouseX;
      float ty = mouseY;
      /* the distance between the cursor and particle */
      float radius = dist(x,y,tx,ty);
      if (radius < 100) {
        /* Calculate the angle between the particle and the cursor. */
        float angle = atan2(ty-y,tx-x);
        /* Are we left-clicking or not? */
        if (mouseButton == LEFT) {
          /* If left, then the particles are deflected */
          vx -= radius * 0.07 * cos(angle);
          vy -= radius * 0.07 * sin(angle);
          /* The stroke color is red */
          stroke(radius * 4,0,0);
        }
        else {
          /* If right, the particles are attracted. */
          vx += radius * 0.07 * cos(angle);
          vy += radius * 0.07 * sin(angle);
          /* The stroke color is blue */
          stroke(0,0,radius * 4);
        }
        /* If line relationships are enabled, the lines are drawn. */
        if (lines) line (x,y,tx,ty);
      }
    }  
    /* Previox x and y coordinates are set, for drawing the trail */
    int px = (int)x;
    int py = (int)y;
    /* Our particle's coordinates are updated. */
    x += vx;
    y += vy;
    /* Gravity is applied. */
    if (gravity == true) vy += 0.7;
    /* Border collisions */
    if (x > width-11) {
      /* Reverse the velocity if towards wall */
      if (abs(vx) == vx) vx *= -1.0;
      /* The particle is placed back at the wall */
      x = width-11;
    }
    if (x < 11) {
      if (abs(vx) != vx) vx *= -1.0;
      x = 11;
    }
    if (y < 11) {
      if (abs(vy) != vy) vy *= -1.0;
      y = 11;
    }
    if (y > height-11) {
      if (abs(vy) == vy) vy *= -1.0;
      vx *= 0.6;
      y = height-11;
    }
    /* if relationship lines are disabled */
    if (!lines) {
      /* The stroke color is set to white */
      stroke (400);
      /* The particle is drawn */
      line(px,py,int(x),int(y));
    }
  }
} 
/* User presses a key */
void keyPressed() {
  /* if they press g */
  if (key == 'g' || key == 'G') {
    /* we toggle gravity */
    if (gravity) gravity = false;
    else gravity = true;
  }
  /* otherwise */
  else {
    /* we toggle line relationships */
    if (lines) lines = false;
    else lines = true;
  }
}

