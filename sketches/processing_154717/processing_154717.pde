
/*
 * Evolution: by Martin Herbert - July 2014
 *
 * Predators & prey
 * 
 * Rules:
 * 1. Chase and eat anything smaller than yourself.
 * 2. Run away from anything bigger than yourself.
 * 3. When you eat, you grow.
 * 4. When you get big enough, you reproduce.
 * 5. If the population stagnates and remains stable for too long, spontaneous invaders
 *    arrive to liven things up.
 *
 * @pjs preload "bg1.jpg"
 *
 */

static final int min_beasts = 50;
static final int max_beasts = 90;
int stagnation_point = 900 ; // 30 sec at 30 FPS
int num_beasts;
int last_num_beasts;
int population_age = 0;

PImage bgimg;

ArrayList<Beast> beasts;
 
void setup() {
  
  size(1024, 768);
  bgimg = loadImage("bg1.jpg");
  image(bgimg,0,0); // background(bgimg);
  
  beasts = new ArrayList<Beast>();
  
  // make an initial population
  num_beasts = (int)random(min_beasts, max_beasts);
  last_num_beasts = num_beasts;
  for ( int i=0; i<num_beasts; i++ ) {
    beasts.add(new Beast(random(width), random(height), random(8, 70)) );
    Beast beast = beasts.get(i);
    beast.getgoing();
  }
  colorMode(HSB, 360, 100, 100);
  noStroke();
}

void draw() {
  
  //background(198,38,52);
  image(bgimg,0,0); // background(bgimg);
  
  // for each beast
  for (int i=0; i<beasts.size(); i++) {
    Beast beast = beasts.get(i);
    
    // move it
    beast.move();
    
    // look for a target/enemy and change direction if necessary
    beast.hunt(i);

    // display it
    beast.display();
    
    // eat or be eaten
    beast.encounter(i);
    
    // if you're mature, make little beasts
    beast.reproduce(i);
    
  }
  
  // If the population's too stagnant, we need some new blood
  num_beasts = beasts.size();
  
  println("Population: ", num_beasts, " Last population: ", last_num_beasts, " Population age: ", population_age);
  
  if ( num_beasts == last_num_beasts ) {
    ++population_age;
    if ( population_age >= stagnation_point ) {
      // make some more
      int newbeasts = (int)random(10,20);
      for ( int i=0; i<newbeasts; i++ ) {
        beasts.add(new Beast(random(width), random(height), random(8, 70)) );
        Beast newbeast = beasts.get(last_num_beasts+i);
        newbeast.getgoing();
      }
      num_beasts = beasts.size(); last_num_beasts = num_beasts; population_age = 0;
    }
  } else {
    last_num_beasts = num_beasts;
    population_age = 0;
  }
  
}

void keyPressed() {
  if ( key == 's' ) saveFrame("MH_KM_####.jpg");
}

/*
 * Class definition for the beast object
 */
 
class Beast {
  
  float x, y, size, original_size;
  float direction, wander, speed;
  color bcolor, nucleus_color;
  float nuc_dx, nuc_dy; //offset of the nucleus from the centre
  
  Beast(float x_, float y_, float size_) {
    x = x_;
    y = y_;
    size = size_;
    original_size = size_;
  }

  // lets get moving
  void getgoing() {
    direction = random(0, TWO_PI);
    wander = random(radians(-5), radians(5)); // rate of change of direction - degrees per frame
    speed = random(0.1, 1.4);
    float hue = random(176, 198);
    colorMode(HSB, 360, 100, 100);
    bcolor = color(hue, 100, 100, 90);
    nucleus_color = color(hue, 100, 40, 120);
    nuc_dx = random(-size/6, size/6);
    nuc_dy = random(-size/6, size/6);
  }
  
  // move according to current speed and direction - stay on the screen
  void move() {
    float dx = speed*cos(direction);
    float dy = speed*sin(direction);
    x += dx;
    y += dy;
    // some random variation in direction to help avoid getting stuck against the edge when running away
    if ( x <= size/2 || x >= width-size/2 || y < size/2 || y > height-size/2 ) direction = direction - PI + radians(random(-15, 15));
    direction -= wander;
  }
  
  // draw to screen
  void display() {
    fill(bcolor);
    stroke(nucleus_color);
    draw_beast(x, y, size);
  }
  
  // is there something nearby? Do we chase it or run away?
  void hunt(int thisbeast) {
    float range, range_of_detection;
    Beast me = beasts.get(thisbeast);
    
    // only interact if I'm on the screen - need a chance to get back in play otherwise
    if ( me.x > me.size/2 && me.x < width-me.size/2 && me.y > me.size/2 && me.y < height-me.size/2 ) {
      // check for nearby beasts
      for (int i=beasts.size()-1; i>=0; i--) {
        if (i != thisbeast ) {
          Beast otherbeast = beasts.get(i);
          range_of_detection = (me.size+otherbeast.size)*2 + random(0, me.size/2); // more random variation to combat stalemate situations
          range = dist(me.x, me.y, otherbeast.x, otherbeast.y);
          if ( range <= range_of_detection ) {
            // chase it!
            me.direction = -acos( (otherbeast.x - me.x )/range );
            if ( otherbeast.y > me.y ) me.direction += PI;
            // except if it's bigger than me, then run away (with random variation to help avoid stalemates)!
            if ( me.size < otherbeast.size ) me.direction = -me.direction + radians(random(-10, 10));
          }
        }
      }
    }
  }
  
  // find something smaller than yourself? eat it!
  void encounter(int thisbeast) {
    Beast me = beasts.get(thisbeast);
    // check those other beasts
    for (int i=beasts.size()-1; i>=0; i--) {
      if (i != thisbeast ) {
        Beast otherbeast = beasts.get(i);
        if ( dist(me.x, me.y, otherbeast.x, otherbeast.y) < (me.size+otherbeast.size)/2 && me.size>otherbeast.size ) {
          // gain area, not just diameter!
          size = 2*sqrt( sq(me.size/2) + sq(otherbeast.size/2) );
          beasts.remove(otherbeast);
        }
      }
    }
  }
  
  // make little beasts!
  void reproduce(int i) {
    if (size >= 1.05*original_size) {
      float newsize=size*0.705;
      size=newsize;
      getgoing();    // send the original beast off in a random direction
      beasts.add(new Beast(x, y, newsize));
      Beast newbeast = beasts.get(beasts.size()-1);
      newbeast.getgoing();    // .. and send the new beast off too
      newbeast.original_size = original_size; // inheritance - remember where we came from
    }
  }
  
  // draw a beast
  void draw_beast(float x, float y, float size) {
    strokeWeight(size/30);
    ellipse(x, y, size, size);
    pushMatrix();
    translate(x+nuc_dx, y+nuc_dy);
    rotate(direction+wander);
    fill(nucleus_color);
    noStroke();
    ellipse(0, 0, size/3, size/4);
    popMatrix();
  }
 
}


