
//arraylist of drones
ArrayList <Unit> supportDrone = new ArrayList<Unit>();
ArrayList <Asteroid> meteors = new ArrayList<Asteroid>();
ArrayList <Base> Sputniks = new ArrayList<Base>();

int number_of_drones = 20;
int number_of_asteroids = 20;

void setup() {
   size (800,800);
//adding drones

   
   for (int i = 0; i < number_of_drones; i ++) {
   supportDrone.add (new Unit (width/2, height/2));
   }

//adding meteors

   for (int i = 0; i < number_of_asteroids; i ++) {
   meteors.add (new Asteroid (random (0, width),random (0, height), random (20, 40)));
   }
   
// adding Sputnick

   for (int i = 0; i < 1; i ++) {
   Sputniks.add (new Base (width/2, height/2));
   }


}




void draw() {
  background(255,255,255);

// drawing asteroids
for (Asteroid space_rock : meteors) {
  space_rock.script();
  }

//deleting asteroids which are lost
for (int i = 0; i < meteors.size(); i++) {
  Asteroid m = meteors.get(i);
  if (m.getSize()<0.5) {
    meteors.remove(i);
  }
  }

//drawing bases
for (Base sp : Sputniks) {
   sp.script();
  }





//finding the nearest asteroid
for (Unit drone : supportDrone) {
  
//finding the nearest asteroid (state 5 - looking for an asteroid)
  if (drone.getState() == 5) {
  
  int counter2 = 0;
  
  for (int i = 0; i < meteors.size(); i++) {
  Asteroid space_rock = meteors.get(i);
  drone.updateAsteroidLocation(i, space_rock.getX(), space_rock.getY());
  }
  
  //where do I go from here?  
  for (int i = 0; i < supportDrone.size(); i++) {
  Unit current_drone = supportDrone.get(i);  
    if ((dist(drone.nearestAstX(), drone.nearestAstY(), current_drone.nearestAstX(), current_drone.nearestAstY()) < 50)) {
    counter2 = counter2 + 1;
    }
  }
  
  //if the nearest asteroid has 3or more drones already - start searching for a new one
  //if less than 3 - ok - move on to it
  if (counter2 < 3) {drone.setState(6);}
  if (counter2 >= 3) {drone.setState(8); drone.setLever(1); }
  }

// init base
  Base sp = Sputniks.get(0);
  drone.init_base (sp.getX(), sp.getY(), sp.getRes());


//  checking other drones

  if (drone.getState() == 2) {
  int counter = 0;
  for (int i = 0; i < supportDrone.size(); i++) {
  
  Unit current_drone = supportDrone.get(i);  
    if (dist (drone.getX(), drone.getY(), current_drone.getX(), current_drone.getY()) < 10) {
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

// mining the asteroids 
  if (drone.getState() == 9) {
    for (int i = 0; i < meteors.size(); i++) {
    Asteroid space_rock = meteors.get(i);
      if (dist (drone.getX(), drone.getY(), space_rock.getX(), space_rock.getY()) < 30) {
        space_rock.decRes (drone.getMS());
        }
     }
  }

// unloading the cargo 
  if (drone.getState() == 4) {
    for (int i = 0; i < Sputniks.size(); i++) {
    Base sat = Sputniks.get(i);
      if (dist (drone.getX(), drone.getY(), sat.getX(), sat.getY()) < 40) {
        sat.addRes (drone.getMS());
        }
     }
  }

}
//drawing everything
for (Unit drone : supportDrone) {
  drone.script();
  
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
  rock = loadImage ("asteroid.png"); 
}

void present () {
  pushMatrix ();
  pushStyle();
  translate (location.x, location.y);
//  fill (240,105,2);
//  strokeWeight (3);
//  stroke (131,101,101);
  
//  image(rock, 0-size/2, 0-size/2, size, size);
//  ellipse (0, 0, 5, 5);
  stroke(#805115);
  fill (#FFD9AA);
  ellipse (0,0,size,size);
  
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

void decRes (float mining) {
  size = size - mining;
}

float getSize () {
return size;
}
}


class Base {

PVector location;
PImage base;


float res = 0;
float size = 30;
float angle = 0;


Base (float _x, float _y) {

  location =  new PVector(_x,_y);
  base = loadImage ("base.png");
  }



void show () {
  angle = angle + 1;
  pushMatrix();
  pushStyle(); 
   
  translate (location.x, location.y);
  rotate (radians(angle));
  fill (203, 136,136); 
  strokeWeight (2);
  stroke(#801515);
  fill (#AA3939);
  triangle(0, size, size*sin(PI/3), -size*cos(PI/3), -size*sin(PI/3), -size*cos(PI/3));
//  image (base, -size/2, -size/2, size,size);
  //rectMode (CENTER);
  //rect(0,0, size, size);
  res = res - 0.001;
  if (res < 0) {res = 0;} 
  
  
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



  text (res, location.x +size*0.5, location.y - size*0.5); 
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


void addRes (float addRes) {
res = res + addRes;
}

}
class Unit {
//globals for all the functions
PVector location;
PVector velocity;
PVector acceleration;
float stop_distance = 100;


//Colour
color drone_colour = #AEAFB2; //
//image
PImage dr;
int s = 5;
//the target the ship is moving to now
PVector currentTarget = new PVector (0,0);

//milscenarious variables
float maxforce;
float maxspeed;
float r = 5;
float m = 5;

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

//search_radius
int search_radius = 400;

//mining
float store = 0;
float dstore = 0.001;
float maxstore = 0.1;

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
  maxforce = 0.2;
  
  dr = loadImage ("RD3.png");
  }

void update() {
// update the coordinates for the move fucntion
  PVector noise = new PVector (random (-10,10)/100, random (-10,10)/100);
  velocity.add (acceleration);
  velocity.limit (maxspeed);
  
  location.add (velocity);
//  location.add (noise);
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
float theta = velocity.heading2D() + PI/2;

  pushMatrix();
  translate (location.x, location.y);
  rotate (theta);
  stroke (153); 
  strokeWeight (2);

  stroke(#801515);
  fill (#AA3939);
  ellipse (0,0, s,s);
  fill (#FF5B3E);
  stroke(#FFAAAA);
  ellipse (0,-s/3, s/3,s/3);
  
  
  //image (dr, -s/2,-s/2, s,s);
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
  float xx = location.x + search_radius*sin(radians(angle));
  float yy = location.y + search_radius*cos(radians(angle));
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
  if ((ast_dist < 20) &&  state == 7  && store < maxstore) {
  state = 2;
  }
  
  
  //start mining 
  if (state == 9) {
  store = store + dstore;
  fill (0,0,0);
  text ("state 9 - mining", location.x, location.y);
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
  if (base_dist < 40 && state == 3) {
  state = 4;
  }
  
  //start unloading
  if (state == 4) {
  store = store - dstore;
  }

  //unloaded - idle
  if (store < 2*dstore && base_dist < 10 && state == 4) {
  state = 0;
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

float getMS () {
return dstore;
}

float nearestAstX () {
return nearestAsteroid.x;
}

float nearestAstY () {
return nearestAsteroid.y;
}

}









