
//arraylist of drones
ArrayList <Unit> supportDrone = new ArrayList<Unit>();
ArrayList <Asteroid> meteors = new ArrayList<Asteroid>();
ArrayList <Base> Sputniks = new ArrayList<Base>();

int number_of_drones = 20;
int number_of_asteroids = 50;

void setup() {
//adding drones
   size (800,800);
   
   for (int i = 0; i < number_of_drones; i ++) {
   supportDrone.add (new Unit (width/2, height/2));
   }

//adding meteors

   for (int i = 0; i < number_of_asteroids; i ++) {
   meteors.add (new Asteroid (random (0, width),random (0, height), random (5, 10)));
   }
   
// adding Sputnick

   for (int i = 0; i < 1; i ++) {
   Sputniks.add (new Base (width/2, height/2));
   }


}




void draw() {
  background(0,0,0);

//drawing everything
for (Unit drone : supportDrone) {
  drone.script();
  
  }

for (Asteroid space_rock : meteors) {
  space_rock.script();
  }

for (Base sp : Sputniks) {
   sp.script();
  }





//finding the nearest asteroid

for (Unit drone : supportDrone) {
  
//finding the nearest asteroid
  if (drone.getState() == 5) {
  
  
  for (int i = 0; i < meteors.size(); i++) {
  Asteroid space_rock = meteors.get(i);
  drone.updateAsteroidLocation(i, space_rock.getX(), space_rock.getY());
  }
  
  drone.setState(6);
  
  }

// init base
  Base sp = Sputniks.get(0);
  drone.init_base (sp.getX(), sp.getY(), sp.getRes());


// looking checking other drones

  if (drone.getState() == 2) {
  int counter = 0;
  for (int i = 0; i < supportDrone.size(); i++) {
  
  Unit current_drone = supportDrone.get(i);  
    if (dist (drone.getX(), drone.getY(), current_drone.getX(), current_drone.getY()) < 30) {
    counter = counter + 1;
    
    }
    
    if (counter >= 3) {
    drone.setState (8);
    drone.setLever (1);
    }
  
    if (counter < 3) {
    drone.setState (9);
    }
}
  


  }


}

}

class Asteroid {
  PVector location;
  float size;
  PImage rock;  
  
  int counter = 0;
  
Asteroid (float x, float y, float _size) { 
  location = new PVector(x,y);
  size =  _size;
 // rock = loadImage ("../Sprites/rock.png"); 
}

void present () {
  pushMatrix ();
  pushStyle();
  translate (location.x, location.y);
  fill (240,105,2);
  strokeWeight (3);
  stroke (131,101,101);
  //scale(0.03*size);
  //image(rock, 0, 0);
  ellipse (0, 0, size, size);
  
  popMatrix();
  popStyle();

  }


void tellRes () {
  if (((mouseX - location.x)*(mouseX - location.x) + (mouseY - location.y)*(mouseY - location.y)) < size*size) {
  pushStyle();
  textSize (15);
  fill  (112,14,178);

  text (int(size), location.x+size*0.6, location.y); 
  popStyle();
  } 
 
 }


void script () {
  present();
  tellRes();
  }

float getX () {
return location.x;
}

float getY () {
return location.y;
}

}


class Base {

PVector location;

int res = 0;
int size = 30;
float angle = 0;


Base (float _x, float _y) {

  location =  new PVector(_x,_y);
  
  }



void show () {
  pushMatrix();
  pushStyle(); 
   
  translate (location.x, location.y);
  
  fill (203, 136,136); 
  rectMode (CENTER);
  rect(0,0, size, size);
  
  
  
  popMatrix();
  popStyle();
}


void script () {
show ();
showRes();
}

void showRes () {

  if ((mouseX < location.x + size/2) && (mouseX > location.x - size/2) && (mouseY > location.y - size/2) && (mouseY < location.y + size/2)) {
  
  pushStyle();  
  textSize (15);
  fill  (112,14,178);



  text (int(res), location.x +size*0.5, location.y - size*0.5); 
  popStyle();
  }
  
}

float getX () {
return location.x;
}

float getY () {
return location.y;
}

float getRes () {
return res;
}

}
class Unit {
//globals for all the functions
PVector location;
PVector velocity;
PVector acceleration;
float stop_distance = 100;

//the target the ship is moving to now
PVector currentTarget = new PVector (0,0);

//milscenarious variables
float maxforce;
float maxspeed;
float r = 5;
float m = 0.5;

// asteroids search
PVector nearestAsteroid = new PVector (width, height);
PVector currentAsteroid; 
float floatCurrAst = 50;



// life parameters
float hp = 100;
float fp = 100;
float dhp = 0.01;
float dfp = 0.01;


//base info
PVector base_location = new PVector (width, height);
float b_res = 0;


//mining
float store = 0;
float dstore = 0.1;
float maxstore = 20;

//states
int state = 8; 

//distance to the asteroid
float ast_dist = 0;
float base_dist = 0;

//states
  int time_roam = 0;
  int time_diff = 2000;
  
  int lever = 1;
  
Unit (float _x, float _y) {
// initializing the object
  acceleration = new PVector (0,0);
  velocity = new PVector (0,0);
  location = new PVector (_x, _y);
  
  maxspeed = 1;
  maxforce = 0.1;
}

void update() {
// update the coordinates for the move fucntion
  velocity.add (acceleration);
  velocity.limit (maxspeed);
  location.add (velocity);
  acceleration.mult(0);
}

void setTarget (float _x, float _y) {
//set some target to move to
  currentTarget.x = _x;
  currentTarget.y = _y;

}

void seek(PVector target) {
//some inner procedures for the move function
  PVector desired = PVector.sub (target, location);

// how far are wee from the target   
  float d = desired.mag();
  
  desired.normalize();
//changing everything in accordance with the "stop" procedure
if (d < stop_distance) {
  float con = map (d, 0, stop_distance, 0, maxspeed);
  desired.mult (con);
}

else {
  desired.mult(maxspeed);
}

  PVector steer = PVector.sub(desired, velocity);
  steer.limit (maxforce/m);
  
  acceleration.add (steer);
}


void display() {
//showing everything on the screen
  pushMatrix();
  translate (location.x, location.y);
  fill (255,255,255);
  stroke (153); 
  strokeWeight (2);
  ellipse (0,0, r*m,r*m);
  popMatrix();
  
  
}

//finding the nearest asteroid
void updateAsteroidLocation (int i, float x, float y) {
  currentAsteroid = new PVector (x, y);
  
  PVector index = PVector.sub(currentAsteroid,location);
  
  if (i == 0) {
  floatCurrAst = sqrt (height*height + width*width);
  }
  
  if (index.mag() < floatCurrAst) {
  nearestAsteroid = new PVector (x,y);
  
  floatCurrAst = index.mag( ); 
  }

}


void showNearestAst () {
   line (location.x, location.y, nearestAsteroid.x, nearestAsteroid.y);
}

void showBase () {
   line (location.x, location.y, base_location.x, base_location.y);
}

// life statistics
void life () {
hp = hp - dhp;
fp = fp - dfp;
}


void switch_state () {
//0 - idle
//1 - empty / base needs resources / looking fot the ast - proceeding to the ast
//6 - looking for an asteroid
//2 - near the asteroid
//3 - full
//4 - unload
//5 - loocking for the nearest asteroid 
//7 - found the asteroid  
//8 - deciding to reckon around
//9 - mining
//10 - waiting 
  ast_dist = dist (location.x, location.y, nearestAsteroid.x, nearestAsteroid.y);
  base_dist = dist (location.x, location.y, base_location.x, base_location.y);
  
  
  //state 8 - looking for the ase random location near te base
  float angle = random (0,360);
  
  if (state == 8 && lever == 1) {
  float xx = location.x + 200*sin(radians(angle));
  float yy = location.y + 200*cos(radians(angle));
  setTarget (xx, yy);
  time_roam = millis ();  
  lever = 0;
  }
  
  //firt near the base
  if (((millis() - time_roam) > time_diff) && state == 8) {
  state = 0;
  }
  

  
  // if idle - check the needs and proceed 
  if ((b_res < 10) && (store < 2*dstore) && state == 0) {
  state = 5;
  }
  

  //setting target for the asteroid
  if (state == 6) {
  setTarget (nearestAsteroid.x, nearestAsteroid.y);
  state = 7;
  }
  
  
  //now near the asteroid
  if ((ast_dist < 10) &&  state == 7  && store < maxstore) {
  state = 2;
  }
  
  
  //start mining 
  if (state == 9) {
  store = store + dstore;
  }

  //going back to the baze
  if (store >= maxstore) {
  state = 3;
  }

  //set the base as the target
  if (state == 3) {
  setTarget (base_location.x, base_location.y);
  
  }

  //now near the base
  if (base_dist < 10 && state == 3) {
  state = 4;
  }
  
  //start unloading
  if (state == 4) {
  store = store - dstore;
  }

  //unloaded - idle
  if (store < 2*dstore && base_dist < 10 && state == 4) {
  state = 6;
  }
}


void init_base (float _b_x, float _b_y, float _b_res) {

base_location = new PVector (_b_x, _b_y);
b_res = _b_res;

}


void move () {
//only responsible for moving
  seek(currentTarget);
  update();
  switch_state();

}

void script() {
//the main function
  move();
  display();

// display misc info
//  showNearestAst ();
//  showBase();
}

int getState () {
return state;
}

float getX () {
return location.x;
}

float getY () {
return location.y;
}

void setLever (int lev) {
lever = lev;
}

void setState (int st) {
state = st;
}
}









