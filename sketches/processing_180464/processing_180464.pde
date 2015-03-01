

//arraylist of drones
//
ArrayList <Unit> supportDrone = new ArrayList<Unit>();
ArrayList <Asteroid> meteors = new ArrayList<Asteroid>();
ArrayList <Base> Sputniks = new ArrayList<Base>();

int maxMine = 2;
int number_of_drones = 20;
int number_of_asteroids = 400;

//for scrolling and scaling
float XX = 0;
float YY = 0;
float smooth = 0.8;
float scaleSize = 1;


void setup() {
   size (800,800);
   
//adding drones

   
   for (int i = 0; i < number_of_drones; i ++) {
     supportDrone.add (new Unit (width/2, height/2));
   }

//adding meteors

   for (int i = 0; i < number_of_asteroids; i ++) {
     meteors.add (new Asteroid (random (-width*2, width*2),random (-height*2, height*2), random(20,60)));
   }
   
// adding Sputnick (which are just bases for collecting resources)

   for (int i = 0; i < 1; i ++) {
     Sputniks.add (new Base (width/2, height/2));
   }


}




void draw() {
  background(255,255,255);
  
//scrolling
  translate (XX, YY);
  scale (scaleSize);

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





//scripting for each asteroid 
for (Unit drone : supportDrone) {
  
//finding the nearest asteroid (state 5 - looking for an asteroid)
  
  if (drone.getState() == 5) {

  // update the drone's information about the asteroids (drone chooses the one which is closer) 
  
  for (int i = 0; i < meteors.size(); i++) {
    Asteroid space_rock = meteors.get(i);
    drone.updateAsteroidLocation(i, space_rock.getX(), space_rock.getY());
  }
  
  //where do I go from here?  
  int counter2 = 0;
  for (int i = 0; i < supportDrone.size(); i++) {
    Unit current_drone = supportDrone.get(i);  
    if ((dist(drone.nearestAstX(), drone.nearestAstY(), current_drone.nearestAstX(), current_drone.nearestAstY()) < 50)) {
      counter2 = counter2 + 1;
    }
  }
  
  //if the nearest asteroid has 3 or more drones already - start searching for a new one
  //if less than 3 - ok - move on to it
  if (counter2 < maxMine) {drone.setState(6);}
  if (counter2 >= maxMine) {drone.setState(8); drone.setLever(1); } //this "level" thing is just a path as I tried to make the drone go throught the 8th state only once
  }

// update the drone's information about the base
  Base sp = Sputniks.get(0);
  drone.init_base (sp.getX(), sp.getY(), sp.getRes());


//  when looking for an asteroid, if 3 or more are already mineing one (the one this drone has chosen) - choose another
  if (drone.getState() == 2) {
    int counter = 0;
    for (int i = 0; i < supportDrone.size(); i++) {
  
      Unit current_drone = supportDrone.get(i);  
      if (dist (drone.getX(), drone.getY(), current_drone.getX(), current_drone.getY()) < 10) {
        counter = counter + 1;
      }
    
      if (counter >= maxMine) {
        drone.setState (8);
        drone.setLever (1);
      }
  
      if (counter < maxMine) {
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

void mouseDragged() {
if (pmouseX < mouseX) {XX = XX + abs(pmouseX-mouseX)*smooth;}
if (pmouseX > mouseX) {XX = XX - abs(pmouseX-mouseX)*smooth;}
if (pmouseY < mouseY) {YY = YY + abs(pmouseY-mouseY)*smooth;}
if (pmouseY > mouseY) {YY = YY - abs(pmouseY-mouseY)*smooth;}
}


void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  scaleSize = scaleSize + e/10;
//  println(scaleSize);
}

class Asteroid {
  PVector location;
  float size;
  int counter = 0;
  
Asteroid (float x, float y, float _size) { 
  location = new PVector(x,y);
  size =  _size;
}

//showing everything
void present () {
  pushMatrix ();
  pushStyle();
  translate (location.x, location.y);

  
  stroke(#805115);
  fill (#FFD9AA);
  ellipse (0,0,size,size);
  
  popMatrix();
  popStyle();

  }

//show the resources left when pointing at the asteroid
void tellRes () {
  if (((mouseX - location.x)*(mouseX - location.x) + (mouseY - location.y)*(mouseY - location.y)) < size*size) {
  pushStyle();
  textSize (15);
  fill  (112,14,178);

  text (int(size), location.x+size*0.6, location.y); 
  popStyle();
  } 
 
 }

//doinf everything for the asteroid
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

//decrease the resources for the asteroids
void decRes (float mining) {
  size = size - mining;
}

float getSize () {
return size;
}
}


class Base {

PVector location;



float res = 0;
float size = 50;
float angle = 0;


Base (float _x, float _y) {

  location =  new PVector(_x,_y);

  }


//show everuthing
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

// the base in consuming the res periodically 
  res = res - 0.001;
  if (res < 0) {res = 0;} 
  
  
  popMatrix();
  popStyle();
}

//scripting 
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

//add res when the droids are unloading
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

//size of the drone
int s = 15;

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



// life parameters - not used in this version
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

//states (random search for time_diff time
int state = 8; 
int lever = 1;

//distance to the asteroid / base
float ast_dist = 0;
float base_dist = 0;

//needed for the random search
int time_roam = 0;
int time_diff = 2000;
  
 
  
Unit (float _x, float _y) {
// initializing the object
  acceleration = new PVector (0,0);
  velocity = new PVector (0,0);
  location = new PVector (_x, _y);
  
  maxspeed = 1;
  maxforce = 0.2;
  }

//**************************************************************
//MOVING PROCEDURE
//**************************************************************


//some inner procedures for the move function
void seek(PVector target) {
  PVector desired = PVector.sub (target, location);
  float d = desired.mag();
  desired.normalize();

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

// update the coordinates - BASICALLY moving
void update() {
  velocity.add (acceleration);
  velocity.limit (maxspeed);
  location.add (velocity);
  acceleration.mult(0);
}

//the main MOVE function - sets the target
void setTarget (float _x, float _y) {
  currentTarget.x = _x;
  currentTarget.y = _y;

}

//showing everything on the screen
void display() {
float theta = velocity.heading2D() + PI/2;
float flameSize = velocity.mag();
flameSize = map (flameSize, 0, maxspeed, 0, s*2); 
  
  
  
  pushMatrix();
  translate (location.x, location.y);
 
  fill (0,0,0);
 
  
  rotate (theta);
  stroke (153); 
  strokeWeight (2);

  stroke(#A66F00);
  fill (#FFD073);
  ellipse (0,0, s,s);
  fill (#FF0000);
  stroke(#FF0000);
  ellipse (0,-s/3, s/9,s/9);
  
  //displayFlame (0, s/2, flameSize,flameSize/2,6);
  popMatrix();
}

// moving
void move () {
//only responsible for moving
  seek(currentTarget);
  update();
  switch_state();
}

//the main function
void script() {
  move();
  display();
}

// life statistics - originally the drone should have needed repairs and fuel - not in this version
void life () {
hp = hp - dhp;
fp = fp - dfp;
}

//**************************************************************
//BEHAVIOUR
//**************************************************************

//still in progress, many were added on the go, as the need arose 
void switch_state () {
//0 - idle
//1 - 
//2 - near the asteroid
//3 - full - setting course to the base for unloading
//4 - near the base - unloading
//5 - looking for the nearest asteroid (checking if there is one with less, than 3 mineing drones already ... 
//6 - the target asteroid established (this state is awarded through the "main" tab)
//7 - asteroid coordinates are set -> moving to the asteroid
//8 - randomly looking for a suitable asteroid for 2 sec 
//9 - near the asteroid -> mineing the asteroid (this state is awarded through the "main" tab)


//usefull distances to the base / asteroid
  ast_dist = dist (location.x, location.y, nearestAsteroid.x, nearestAsteroid.y);
  base_dist = dist (location.x, location.y, base_location.x, base_location.y);
  
  
  //state 8 - randomly looking for a suitable asteroid for 2 sec 
  float angle = random (0,360);
  
  if (state == 8 && lever == 1) {
    float xx = location.x + search_radius*sin(radians(angle));
    float yy = location.y + search_radius*cos(radians(angle));
    setTarget (xx, yy);
    time_roam = millis ();  
    lever = 0;  //need to run this state on;y once in the cycle
  
  }
  
  //done scouting around - now idle
  if (((millis() - time_roam) > time_diff) && state == 8) {
  state = 0; //idle
  }
  

  
  //if idle - check if  the base needs the resources and proceed 
  if ((b_res < 10) && (store < 2*dstore) && state == 0) {
  state = 5; //looking for a suitable asteroid
  }
  
  //awarded throught the main tab - asteroid found
  if (state == 6) {
  setTarget (nearestAsteroid.x, nearestAsteroid.y);
  state = 7; //asteroid coordinates are set -> moving to the asteroid
  }
  
  
  //now near the asteroid
  if ((ast_dist < 20) &&  state == 7  && store < maxstore) {
  state = 2; //check if there are already 3 drones here
  }
  
  
  //start mining (awarded throught the main tab - asteroid found)
  if (state == 9) {
    store = store + dstore;
    fill (0,0,0);
    text ("state 9 - mining", location.x, location.y);
  }

  //have collected enough resources to fit its  bay
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

  //now near the base, unloaded -> idle
  if (store < 2*dstore && base_dist < 10 && state == 4) {
  state = 0;
  }
}

//**************************************************************
//UTILITIES
//**************************************************************

//updating the info from the main tab - basically comparing the current_asteroid the droid wants to harvest with the one received from the main tab
//if the one received is closer - forget about the one it already has <- used to change from state 5 (looking for an asteroid) to state 6 (coordinates of the asteroid set)

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

// this one was needed to see what the drone is "thinking" about
void showNearestAst () {
   line (location.x, location.y, nearestAsteroid.x, nearestAsteroid.y);
}

// this one was needed to see what the drone is "thinking" about
void showBase () {
   line (location.x, location.y, base_location.x, base_location.y);
}

//asking for the coordinates of the base
void init_base (float _b_x, float _b_y, float _b_res) {

base_location = new PVector (_b_x, _b_y);
b_res = _b_res;

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





void displayFlame (int x, int y, float w, float h, int dir) {
  int angle = 0;
  pushMatrix();
  pushStyle();
  
//  translate (x+w/2, y);
  
  if (dir == 12) {angle = -90; translate (x, y-w/2);}
  if (dir == 3) {angle = 0; translate (x+w/2, y);}
  if (dir == 6) {angle = 90; translate (x, y+w/2);}
  if (dir == 9) {angle = 180;translate (x-w/2, y);}
  
  noStroke();  
  
  rotate (radians(angle));
  
  fill (73, 126, 219, random (90,105));
  ellipse (0,0, random (w*0.9, w), random (h*0.9, h*1.1));
  
  fill (73,126,219, random (155,165));
  ellipse (0 - w/4,0,w/2,random (h*0.5, h*0.7));
  popStyle();
  popMatrix();
  
}


