
import tsps.*;
TSPS tspsReceiver;


/*
Rotate was made by Jared "BlueThen" C.
 Created on October 31, 2009. Refined and commented on November 3 of 2009, November 6 of 2009, and November 8 of 2009.
 www.bluethen.com
 */

/* Particle count. */
int particleCount = 9000;
/* Here we create a global Particle array using our particleCount  */
Particle[] particles = new Particle[particleCount+1];
/* Setup, initialization, etc. */
void setup()
{
  /* The window size is set too 500 by 500 pixels. */
  size(768, 1024, P2D);
  /* RGB mode is set to 1, since we'll only be using 2 colors: Black and White. */
  colorMode(RGB, 1);
  /* The stroke color is the color used for our particles */
  stroke(1);
  /* The fill color is the background color, meant for inside the borderm, since it is drawn using quad() */
  fill(0);
  /* Frame rate */
  //frameRate(30);
  tspsReceiver= new TSPS(this, 12000);

  /* The particles are created. */
  for (int x = particleCount; x >= 0; x--) {
    /* We call the particle function inside its class to set up a new particle. Each is positioned randomly. */
    particles[x] = new Particle();
  }
}

void draw()
{
  /* The screen is cleared, and the background is colored black */
  background(0);
  TSPSPerson[] people = tspsReceiver.getPeopleArray(); //get people array
  /* We draw our border. It is 10 pixels from all sides. */
  //quad(10, 10, width-10, 10, width-10, height-10, 10, height-10);
  /* The particles are looped through, then updated. */
  if (people.length>0) {
    for (int k=0; k<people.length; k++) {
      println(people.length);
      // get person
      TSPSPerson person = people[k];
      int lx = int(person.centroid.x * width);
      int ly = int(person.centroid.y * height);
      println(lx);

      //write code for images
      //conditionals for images (ifs)
      //compare distance

      for (int i = particleCount; i >= 0; i--) {
        Particle particle = (Particle) particles[i];
        particle.update(lx, ly);
      }
      //ellipse( (person.centroid.x * width), (person.centroid.y * height), 5, 5 );
    };
  }
  else {
    for (int i = particleCount; i >= 0; i--) {
      Particle particle = (Particle) particles[i];
      particle.update(1000, 1000);
    }
  }
}
class Particle {
  /* Our global class variables. These variables will be kept track of for each frame and throughout each function. */
  /* x and y represents the coordinates. vx and vy represents the velocities or speed and direction of the particles. */
  float x;
  float y;
  float vx;
  float vy;
  float px; //people y
  float py; //people x
  /* We call this to set up a new particle. */
  Particle() {
    /* The x and y coordinates of the particle is random and within the borders. */
    x = random(10, width-20);
    y = random(10, height-20);
  }
  /* Here we update the coordinates and redraw the particle. */
  void update(int px, int py) {
    /* Check to see if the user's mouse is pressed. */


    /* Variables are used to keep track of the x and y coordinates of the cursor. */
    int rx = mouseX; //switch between px and mouseX
    int ry = mouseY; //switch between py and mouseY
    /* The radius variable stores the distance between the cursor and the particle. */

      float radius = dist(x, y, rx, ry);
      /* Proceed if the particle is within 150 pixels of the cursor. */
      if (radius < random(0, 75)) {
        /* atan2 is used to find the angle between the cursor and the particle. */
        float angle = atan2(y-ry, x-rx);
        /*
        Most of our math is done here.
         Again, vx and vy are the veloicities. They're not the actual coordinates, but they're the speed and direction of the particles.
         The base formula here is (for (x,y)): (c + r * cos(a), c + r * sin(a)). c is the center, r is the radius, a is the angle.
         This formula finds the edge of a circle according to an angle, radius, and center.
         In the formula below, we use:
         c: x/y
         The center is technically x and y, since vx and vy are later added on to x and y.
         
         r: (150 - radius) * 0.01
         Remember that radius is the distance from the cursor to the particle. The radius/distance in our formula can also represent the speed of the particle.
         The max radius is 150, as limited to by our if statement above. Because of this, we subtract the distance from 150 to invert this value
         If we didn't, the particles would be moving as fast as how far they are. Multiplying it by 0.01 tones it down, so the particles don't get too out of control.
         
         a: angle + (0.7 + 0.0005 * (150 - radius))
         variable angle is the angle between the cursor and the particle. it is added to the radius, which is inverted, multiplied by 0.0005.
         If we used angle alone, the particles would simply fly towards our cursor, and nothing else.
         Adding on 0.7 turns each particle by 0.7 radians, but to add to our pretty effect, we throw in the radius into the equation.
         Having the radius inverted (multiplied by 0.0005 to tone it down) will decrease the effect on particles by how far away they are
         and increase the effect on particles by how close they are to the cursor.
         */
        vx -= (150 - radius) * 0.009 * cos(angle + (1.155 + 0.21 * (150 - radius)));
        vy -= (150 - radius) * 0.009 * sin(angle + (1.155 + 0.21 * (150 - radius)));
      }

      /* x and y are increased by our velocities. This completes our formula c + r * cos(a) or sin(a), with vx/vy being the r * cos(a) or sin(a) */
      x += vx+random(-.1, .1);
      y += vy+random(-.1, .1);

      /* The velocities are decreased by 3% to simulate friction. */
      vx *= .92;
      vy *= .92;

      /*
    Boundary collision is calculated here. If the particle is beyond the boundary, its velocity is reversed and the particle is moved back into the main area.
       */
      if (x > width-10) {
        vx *= -1;
        x = width-11;
      }
      if (x < 10) {
        vx *= -1;
        x = 11;
      }
      if (y > height-10) {
        vy *= -1;
        y = height-11;
      }
      if (y < 10) {
        vy *= -1;
        y = 11;
      }


      point((int)x, (int)y);
    }
  }
