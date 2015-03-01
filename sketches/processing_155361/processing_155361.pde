
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
 * 5. New offspring can mutate to get faster, giving them a theoretical advantage.
 * 6. If the population stagnates and remains stable for too long, spontaneous invaders
 *    arrive to liven things up.
 *
 * @pjs preload "bg1.jpg"
 * @pjs preload "sig001.png"
 * @pjs preload "bgtrk.mp3"
 * @pjs preload "bgtrk.ogg"
 *
 */
//import ddf.minim.spi.*;
//import ddf.minim.signals.*;
import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
//import ddf.minim.effects.*;
Minim minim;
AudioPlayer[] soundfx;

boolean show_web = false;

static final int min_beasts = 50;
static final int max_beasts = 90;
int stagnation_point = 600 ; // 20 sec at 30 FPS
int num_beasts;
int last_num_beasts;
int population_age = 0;

PImage bgimg;
PImage sig;

ArrayList<Beast> beasts;
int num_bubbles;
Bubble[] bubbles;

color filter_hue;
 
void setup() {
  
  size(1280, 720);
  bgimg = loadImage("bgHiResdk.jpg");
  sig = loadImage("sig001.png");
  noTint();
  image(bgimg,0,0); // background(bgimg);
  
  filter_hue = 178;
  
  beasts = new ArrayList<Beast>();
  
  // make an initial population
  num_beasts = (int)random(min_beasts, max_beasts);
  last_num_beasts = num_beasts;
  for ( int i=0; i<num_beasts; i++ ) {
    beasts.add(new Beast(random(width), random(height), random(8, 75)) );
    Beast beast = beasts.get(i);
    beast.getgoing();
    beast.set_genome();
  }
  
  // create some bubbles to float around
  num_bubbles = (int)random(20, 50);
  bubbles = new Bubble[num_bubbles];
  for (int i=0; i<num_bubbles; i++ ) {
    bubbles[i] = new Bubble();
  }
  
  // setup the sound & loop background track
  minim = new Minim(this);
  soundfx = new AudioPlayer[1];
  soundfx[0] = minim.loadFile("bgtrk.mp3");
  soundfx[0] = minim.loadFile("bgtrk.ogg"); //NB: Not supported in java - UNcomment for js version!
  // soundfx[0].setGain(-24);                     //NB: Not present in minim.js - comment OUT for js version
  soundfx[0].loop();

  colorMode(HSB, 360, 100, 100);
  noStroke();
  smooth(8);
}

void draw() {
  
  //background(198,38,52);
  noTint();
  image(bgimg,0,0); // background(bgimg);
  
  // draw some bubbles over the background
  for (int i=0; i<num_bubbles; i++ ) {
    bubbles[i].move_bubble();
    bubbles[i].draw_bubble();
  }
  
  // color filter - changes slowly to add a bit of extra visual interest
  fill(filter_hue, 100, 100, 60);
  noStroke();
  rect(0,0,width,height);
  if ( frameCount%10 == 0 ) {
    filter_hue = ++filter_hue%360;
  }
  
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
    beast.reproduce();
    
  }
  
  // If the population's too stagnant, we need some new blood
  num_beasts = beasts.size();
  if ( num_beasts == last_num_beasts ) {
    ++population_age;
    if ( population_age >= stagnation_point ) {
      // make some more
      int newbeasts = (int)random(min_beasts/2, max_beasts/2);
      for ( int i=0; i<newbeasts; i++ ) {
        beasts.add(new Beast(random(width), random(height), random(8, 75)) );
        Beast newbeast = beasts.get(last_num_beasts+i);
        newbeast.getgoing();
        newbeast.set_genome();
      }
      num_beasts = beasts.size(); last_num_beasts = num_beasts; population_age = 0;
    }
  } else {
    last_num_beasts = num_beasts;
    population_age = 0;
  }
  
  // lastly - sign it!
  tint(179, 40, 75, 150);
  image(sig,width-130,height-60);
  
}

void keyPressed() {
  switch(key) {
    case 's': saveFrame("MH_KM_####.jpg"); break;
    case 'w': show_web = !show_web; break;
    case 'm': if ( soundfx[0].isMuted() ) soundfx[0].unmute(); else soundfx[0].mute(); break;
  }
}


/*
 * Class definition for the beast object
 */
static final int MIN_SPINES = 3;
static final int MAX_SPINES = 20;
 
class Beast {
  
  float x, y, size, original_size;    // Set in initialisation routine

  float direction, wander;     // These are randomised in getgoing routine
  float nuc_dx, nuc_dy;
  color nucleus_color;

  float speed;                        // Initially random, but inherited from parent
  ArrayList<Spine> spines;            // when reproducing - no. of spines and color are
  color bcolor;                       // visual indicators of speed, which can mutate,
                                      // and gives evolutionary advantage.
  
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
    nuc_dx = random(-size/6, size/6);
    nuc_dy = random(-size/6, size/6);
  }
  
  // initialise the inherited characteristics
  void set_genome() {
    speed = random(1, 4);
    float hue = random(176, 198);
    colorMode(HSB, 360, 100, 100);
    bcolor = color(hue, 100, 100, 90);
    nucleus_color = color(hue, 100, 40, 200);
    setup_spines();
  }
  
  // copy over inheritable characteristics
  void inherit(Beast oldbeast, Beast newbeast) {
    newbeast.speed = oldbeast.speed;
    newbeast.bcolor = oldbeast.bcolor;
    newbeast.nucleus_color = oldbeast.nucleus_color;
    // we'll keep the same number of spines, but not make them identical
    newbeast.spines = new ArrayList<Spine>();
    int num_spines = (int)oldbeast.spines.size();
    for (int i=0; i<num_spines; i++ ) {
      float division = TWO_PI/num_spines;
      newbeast.spines.add(new Spine( division*i, random(size/8, size/3) ));
    }
  }

  // set up an array of spines
  void setup_spines() {
    int num_spines;
    spines = new ArrayList<Spine>();
    
    num_spines = (int)random(MIN_SPINES, MAX_SPINES);
    
    // for each spine, set up an angular offset and length, proportional to size
    for (int i = 0; i<num_spines; i++) {
        float division = TWO_PI/num_spines;
        spines.add(new Spine( division*i, random(size/8, size/3) ));
    }
  } 
   
  // move according to current speed and direction - stay on the screen
  void move() {
    float dx = speed*cos(direction);
    float dy = speed*sin(direction);
    x += dx;
    y += dy;
    direction -= wander;
    // wrap around the spherical topology if we hit the side
    if ( x < -size/2 ) x = width + size/2 ; if ( x > width + size/2 ) x = -size/2 ;
    if ( y < -size/2 ) y = height + size/2 ; if ( y > height + size/2 ) y = -size/2;
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
            if (show_web) { // visualise web of conflicting influences
              strokeWeight(0.4);
              stroke(69,29,85,200); // stroke(me.nucleus_color);
              line(me.x+me.nuc_dx, me.y+me.nuc_dy, otherbeast.x+otherbeast.nuc_dx, otherbeast.y+otherbeast.nuc_dy);
            }
            // chase it!
            me.direction = -acos( (otherbeast.x - me.x )/range );
            if ( otherbeast.y > me.y ) me.direction += PI;
            // unless it's bigger than me, then run away (with random variation to help avoid stalemates)!
            if ( me.size <= otherbeast.size ) me.direction = -me.direction + radians(random(-30, 30));
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
  void reproduce() {
    Beast oldbeast = this;
    if (oldbeast.size >= 1.2*oldbeast.original_size) {
      oldbeast.size=oldbeast.size*0.6;
      beasts.add(new Beast(x, y, oldbeast.size));
      Beast newbeast = beasts.get(beasts.size()-1);
      oldbeast.getgoing();          // and send off in differerent directions
      newbeast.getgoing();
      inherit(oldbeast, newbeast);  // inherit characteristics
      oldbeast.mutate();            // either one could mutate
      newbeast.mutate();
    }
  }
  
  // beast could spontaneously mutate to get a bit faster or slower.
  // faster is an advantage - link to no. of spines and redness as visual indicators
  void mutate() {
    if ( random(0,2) < 1 ) {  // 1 in 3 chance of mutation
      float increment = random(-1, 1);
      speed += increment;
      if (increment > 0) {
        float bhue = hue(bcolor);
        if (bhue > 0) {
          bhue -= 10;
          bcolor = color(bhue, saturation(bcolor), brightness(bcolor), alpha(bcolor));
        }
        int num_spines = spines.size()+1;
        spines.clear();
        for (int i=0; i<num_spines; i++ ) {
          float division = TWO_PI/num_spines;
          spines.add(new Spine( division*i, random(size/8, size/3) ));
        }
      }
    }
  }
  
  // draw a beast
  void draw_beast(float x, float y, float size) {
    
    // draw the cell body
    strokeWeight(size/30);
    ellipse(x, y, size, size);
    
    // draw the spines (and rotate a bit for next time)
    for (int i=0; i<spines.size(); i++ ) {
      Spine cur_spine = spines.get(i);
      cur_spine.draw_spine(x, y, size, nucleus_color);
      cur_spine.angle -= wander/4;
    }
    
    // draw the nucleus
    pushMatrix();
    translate(x+nuc_dx, y+nuc_dy);
    rotate(direction+wander);
    fill(nucleus_color);
    strokeWeight(size/15);
    stroke(186, 20, 91, 90);
    ellipse(0, 0, size/3, size/4);
    popMatrix();
    
  }
 
}
/*
 * Class definition for the bubble object
 */

class Bubble {
 
  float x, y, size, speed, direction, wander;
  color bubble_col = color(184, 8, 95, 9);

  Bubble() {
     x = random(width);
     y = random(height);
     size = random( 10, 30 );
     speed = random(1, 4 );
     direction = random( -PI/4, PI/4 );
     wander = 0.003; // random( 0.001, 0.008 );
  }
  
  void move_bubble() {
    x = x + speed*cos(direction);
    y = y + speed*sin(direction);
    direction += wander;
    if ( x < -size/2 ) x = width + size/2 ; if ( x > width + size/2 ) x = -size/2 ;
    if ( y < -size/2 ) y = height + size/2 ; if ( y > height + size/2 ) y = -size/2;
  }
  
  void draw_bubble() {
    noFill();
    stroke(bubble_col);
    for ( int i=0; i<4; i++ ) {
      strokeWeight(size/(i+1));
      ellipse(x, y, size, size);      
    }
  }
    
}
/*
 * Class definition for a spine object
 */
 
class Spine {
  
  float angle;
  float spine_length;
  
  Spine (float angle_, float length_) {
    angle = angle_;
    spine_length = length_;
  }
  
  void draw_spine(float x, float y, float beast_size, color nucleus_color) {
    
    pushMatrix();
    translate(x, y);
    rotate(angle);
    strokeWeight(beast_size/35);
    stroke(nucleus_color);
    line(beast_size/2, 0, beast_size/2+spine_length, 0);
    stroke(186, 20, 100, 80);
    fill(0, 0, 50, 40);
    ellipse(beast_size/2+spine_length, 0, beast_size/25, beast_size/25);   
    // offset a bit and draw an interior blob
    rotate(radians(30));
    ellipse(spine_length*0.95, 0, beast_size/8, beast_size/8);
    popMatrix();
  }
  
}


