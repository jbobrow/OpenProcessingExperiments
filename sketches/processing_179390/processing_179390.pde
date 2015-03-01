
//arraylist of drones
ArrayList <Unit> supportDrone = new ArrayList<Unit>();
ArrayList <Asteroid> meteors = new ArrayList<Asteroid>();
ArrayList <Base> Sputniks = new ArrayList<Base>();


void setup() {
//adding drones
   size (800,800);
   
   for (int i = 0; i < 2; i ++) {
   supportDrone.add (new Unit (random (0, width),random (0, height)));
   }

//adding meteors

   for (int i = 0; i < 5; i ++) {
   meteors.add (new Asteroid (random (0, width),random (0, height), random (10, 40)));
   }
   
// adding Sputnick

   for (int i = 0; i < 1; i ++) {
   Sputniks.add (new Base (random (0, width),random (0, height)));
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
  for (int i = 0; i < meteors.size(); i++) {
  Asteroid space_rock = meteors.get(i);
  drone.updateAsteroidLocation(i, space_rock.getX(), space_rock.getY());
  
  }

// init base
  Base sp = Sputniks.get(0);
  drone.init_base (sp.getX(), sp.getY(), sp.getRes());

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
float r = 10;
float m = random (1);

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
int state = 0; 

Unit (float _x, float _y) {
// initializing the object
  acceleration = new PVector (0,0);
  velocity = new PVector (0,0);
  location = new PVector (_x, _y);
  
  maxspeed = 4;
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
//1 - empty / base needs resources / proceeding
//2 - mining
//3 - full
//4 - unload
  
  if ((b_res < 10) && (store < 2)) {
  setTarget (nearestAsteroid.x, nearestAsteroid.y);
  state = 1;
  }

  if ((dist (location.x, location.y, nearestAsteroid.x, nearestAsteroid.y) < 10) && state == 1 && store < maxstore) {
  store = store + dstore;
    }

  if (store >= maxstore) {
  state = 3;
  }

  if (state == 3) {
  setTarget (base_location.x, base_location.y);
  
  }

  if ((dist (location.x, location.y, base_location.x, base_location.y) < 10) && state == 3) {
  store = store - dstore;
  println (store);
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


}









