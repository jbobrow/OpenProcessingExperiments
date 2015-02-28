
import java.util.*;
import java.nio.*;

int MOON_SCALE = 40;
int MOON_RES = 32;

boolean showBounds = false;
boolean showContactRadius = false;

boolean gameOver = false;
Camera gamecam;
long lastMillis = -1;

// playfield
Moon moon;
Radio radio;

// actors
Buggy buggy;
List<Actor> miners;
List<Actor> bases;
List<Actor> blocks;

void setup() {
  
  size(800, 450, P3D);
  
  println("initializing moon");
  moon = new Moon();
  moon.setup();
  
  println("initializing radio");
  radio = new Radio();
  radio.setup();
  
  //  one base at center of moon
  println("initializing bases");
  bases = new ArrayList();
  Base base = new Base();
  base.setup();
  base.place(moon.getCenter());
  bases.add(base);
  
  println("initializing blocks");
  blocks = new ArrayList();
  {
     // no blocks to start 
  }

  println("initializing buggy");
  buggy = new Buggy();
  buggy.setup();
  buggy.place(somewhereNextTo((Actor)bases.get(0)));

  println("initializing miners");
  miners = new ArrayList();
  Miner miner = new Miner();
  miner.setup();
  miner.place(new PVector(moon.getCenter().x + MOON_RES * MOON_SCALE / 2, 0, moon.getCenter().z - MOON_RES * MOON_SCALE / 2));
  miner.mine(new PVector(moon.getCenter().x, 0, moon.getCenter().z), MOON_RES * MOON_SCALE * 3 / 8);
  miners.add(miner);

  gamecam = new Camera();
  gamecam.setup();
  gamecam.follow(buggy);
  
}

void keyPressed(){
  // steer buggy
  switch(keyCode) {
    case UP:
      buggy.accelerate();
      break;
    case DOWN:
      buggy.brake();
      break;
    case RIGHT:
      buggy.steerRight();
      break;
    case LEFT:
      buggy.steerLeft();
      break;
  }
  // debugging
  switch(key) {
    case 'b':
      showBounds = !showBounds;
      break;
    case 'c':
      showContactRadius = !showContactRadius;
      break;
  }
}

void keyReleased(){
  switch(keyCode){
    case UP:
    case DOWN:
      buggy.coast();
      break;
    case RIGHT:
      buggy.steerNeutral();
      break;
  }
}

public void update(float deltaTime) {
  
  // update all object positions
  
  buggy.update(deltaTime);
  
  for (int i = 0; i < miners.size(); i++) {
    ((GameObject)miners.get(i)).update(deltaTime);
  } 
  
  for (int i = 0; i < blocks.size(); i++) {
    ((GameObject)blocks.get(i)).update(deltaTime);
  } 
  
  for (int i = 0; i < bases.size(); i++) {
    ((GameObject)bases.get(i)).update(deltaTime);
  } 
  
  gamecam.update(deltaTime);
  radio.update(deltaTime);
  
}

public void draw() {
  
  // if game over reset
  if (gameOver) {
    return;
  }

  // get timing
  long nextMillis = millis();
  long deltaMillis = nextMillis - lastMillis;
  float deltaTime = lastMillis > 0 ? (float) deltaMillis / 1000 : 0;
  lastMillis = nextMillis;
  
  // run sim
  update(deltaTime);
  
  // collide buggy with blocks

  ArrayList toRemove = new ArrayList();  
  for (final Iterator<Actor> it = blocks.iterator(); it.hasNext(); ) {
    final Actor block = it.next();
    if (block.isInContactRadius(buggy)) {
      buggy.collide(block);
      block.collide(buggy);
      toRemove.add(block);
    } 
  }
  for (final Object a : toRemove) {
    blocks.remove(a);  
  }
 
  // draw
  
  background(0);

  gamecam.view();

  // draw the rest of the actors
  lights();

  // draw moon on its own
  moon.draw();

  for (int i = 0; i < bases.size(); i++) {
    ((Actor)bases.get(i)).draw();
  }
  
  for (int i = 0; i < blocks.size(); i++) {
    ((Actor)blocks.get(i)).draw();
  } 

  for (int i = 0; i < miners.size(); i++) {
    ((Actor)miners.get(i)).draw();
  }

  buggy.draw();
  
  radio.draw();

}

// Pick a point near the contact radius of the given actor
public PVector somewhereNextTo(Actor actor) {
  float dir = 45; //random(360);
  float dx = actor.contactRadius * cos(dir);
  float dz = actor.contactRadius * sin(dir);
  float y = moon.getAltitudeAt(dx, dz);
  return new PVector(actor.location.x + dx, y, actor.location.z + dz);
}




class Actor extends GameObject {

  OBJModel model;
  PVector location;
  PVector rot;
  PVector velocity;
  PVector acceleration;
  float contactRadius = 10;
  PVector bounds;
  float maxVelocity = 100;
  
  public void place(PVector place) {
    
    if (null == location) 
      location = new PVector();
      
    location.x = place.x;
    location.y = place.y;
    location.z = place.z;
    rot = new PVector(0, 0, 0);
    velocity = new PVector(0, 0, 0);
    acceleration = new PVector(0, 0, 0);

  }
  
  public float getVolume() {
    if (null == bounds) return 0;
    return bounds.x * bounds.y * bounds.z;
  }

  public void draw() {

    pushMatrix();
    translate(location.x, location.y, location.z);
    
    rotateY(-rot.y);
    rotateZ(-rot.z);
    rotateX(-rot.x);
    if (showContactRadius) {
      stroke(color(0, 255, 0));
      sphere(contactRadius);       
    }

    if (null != bounds && showBounds) {
      pushMatrix();
      stroke(color(255, 0, 0));
      noFill();
      translate(0, bounds.y / 2, 0);
      box(bounds.x, bounds.y, bounds.z);
      popMatrix();
    }

    model.draw();

    popMatrix();
  }
  
  
  public void update(float deltaTime) {
    
    boolean moving = (velocity.mag() > 0);
    // Velocity changes according to cceleration
    if (moving) {
      if (velocity.mag() < 10) {
        velocity.mult(0);  
      } else {
        velocity.mult(constrain(1.0 - 1.0 * deltaTime, 0, 0.90));
      }
    }
    
    if (acceleration.mag() > 0) {
      velocity.x += acceleration.x * deltaTime;
      velocity.z += acceleration.z * deltaTime;
    }

    // Block limit
    velocity.limit(maxVelocity);
    
    // Location changes by velocity
    location.x += velocity.x * deltaTime;
    location.z += velocity.z * deltaTime;

    if (null == bounds) {
      
      location.y = moon.getAltitudeAt(location.x, location.z);
      
    } else {
      
      float my = moon.getAltitudeAt(location.x, location.z);
      
      float cosd = cos(rot.y);
      float sind = sin(rot.y);
      float dx11 = (bounds.x * cosd - bounds.z * sind) / 2.0;
      float dz11 = (bounds.z * cosd + bounds.x * sind) / 2.0;
      float q11 = moon.getAltitudeAt(location.x - dx11, location.z - dz11);
      float dx12 = (bounds.z * cosd + bounds.x * sind) / 2.0;
      float dz12 = (bounds.z * cosd - bounds.x * sind)  / 2.0;
      float q12 = moon.getAltitudeAt(location.x - dx12, location.z + dz12);
      float q21 = moon.getAltitudeAt(location.x + dx12, location.z - dz12);
      float q22 = moon.getAltitudeAt(location.x + dx11, location.z + dz11);
      
      float ay = (q11 + q12 + q21 + q22) / 4f;
      float fz1 = constrain((q12 + q22) / 2f - (q11 + q21) / 2f, -bounds.z, bounds.z);
      float fx1 = constrain((q11 + q12) / 2f - (q21 + q22) / 2f, -bounds.x, bounds.x);
      
      location.y = max(my, ay);
      rot.x = asin(fz1 / bounds.z);
      rot.z = asin(fx1 / bounds.x);
      
    }
    
    // We must clear acceleration each frame
    acceleration.x = 0;
    acceleration.z = 0;
    
 }
 
 public boolean isInContactRadius(Actor a) {
   float distance = a.location.dist(location);
   float contactDistance = max(a.contactRadius, contactRadius);
   return distance < contactDistance;  
 }
 
 public void collide(Actor a) {}
  
}
class Base extends Actor {

 public void setup() {
   model = new OBJModel();
   model.loadObj("astro_base.obj");
   model.setScale(0.5, 0.5, 0.5);
   model.setFill(color(200, 255, 200));
   model.move(0, 25, 0);
   bounds = new PVector(60, 25, 60);
   contactRadius = 100;
 }

}
class Block extends Actor {

 public void setup() {
   model = new OBJModel();
   model.box(30, 15, 30);
   model.move(0, 7.5, 0);
   model.setFill(color(128, 255, 128));
   bounds = new PVector(30, 15, 30);
   contactRadius = 60;
 }
 
}
class Buggy extends Actor  {
 
 float steer = 0;
 float drive = 0;
 int moonbucks = 0;

 public void setup() {
   model = new OBJModel();
   model.loadObj("astro_ute.obj");  
   model.setScale(0.2, 0.2, 0.2);
   model.setFill(color(128, 128, 255));
   model.turn(PI);
   model.move(0, 20, 0);
   bounds = new PVector(25, 12.5, 17.5);
   maxVelocity = 200;
 }
 
 public void accelerate() {
   drive = 2000;
 }
 
 public void brake() {
   drive = -1000;
 }

 public void coast() {
   drive = 0; 
 }

 public void steerRight() {
   steer = -PI/4;
 }

 public void steerLeft() {
   steer = PI/4;
 }

 public void steerNeutral() {
   steer = 0;
 }
  
 public void update(float deltaTime) {
   
    if (steer != 0) {
      rot.y = rot.y + steer * deltaTime;
    }
    
    if (drive != 0) {
      acceleration.x = drive * cos(rot.y);
      acceleration.z = drive * sin(rot.y);
    }
    
    super.update(deltaTime);
    
    drive *= .99;
    steer *= 0;
    
 }

 public void collide(Actor a) { 
   // always a block
   Block block = (Block) a;
   moonbucks += block.getVolume() / 1000;
   radio.clear();
   radio.addMessage("Got the cheese!", 5);
   radio.addMessage("You've got " + moonbucks + " moonbucks", 5);
 }

}
class Camera extends GameObject {
  
  float eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ;
  Actor target = null;

  public void setup() {
     eyeX = 0;
     eyeY = 0;
     eyeZ = 0;
     centerX = 1;
     centerY = 0;
     centerZ = 1;
     upX = 0;
     upY = -1;
     upZ = 0;
  }
  
  public void update(float deltaTime) {
     if (null == target) return;
     centerX = target.location.x;
     centerY = target.location.y + target.bounds.y + 10;
     centerZ = target.location.z; 
     eyeX = centerX - (100 * cos(target.rot.y));
     eyeZ = centerZ - (100 * sin(target.rot.y));     
     eyeY = centerY + 10;
  }
  
  public void follow(Actor actor) {
     target = actor;
  }
  
  public void view() {
     camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);
  }
  
}
class GameObject {
    
  public void setup() {}

  public void update(float deltaTime) {}

  public void draw() {}
  
}
class Miner extends Actor {

  PVector miningPlace;
  float miningRadius;
  
  List<PVector> waypoints;
  boolean digging;
  float dug = 0;
  float capacity = 250;
  float efficiency = 1.0f;
  
  public void setup() {
    model = new OBJModel();
    model.loadObj("cold_planer.obj");
    model.setScale(4, 4, 6);
    model.move(0, 7.5, 0);
    model.setFill(color(255, 128, 128));
    bounds = new PVector(125, 60, 60);
    contactRadius = 100;
    waypoints = new ArrayList<PVector>();
    digging = false;
    maxVelocity = 25;
  }
  
  public void survey(PVector target, float radius, PVector topLeft, PVector bottomRight) {
    topLeft.x = target.x - radius;
    topLeft.z = target.z - radius;
    bottomRight.x = target.x + radius;
    bottomRight.z = target.z + radius;
  }
  
  public void mine(PVector target, float radius) {
    miningPlace = target;
    miningRadius = radius;
    PVector topLeft = new PVector();
    PVector bottomRight = new PVector();
    survey(target, radius, topLeft, bottomRight);
    while (topLeft.x <= bottomRight.x) {
      PVector w1 = topLeft;
      w1.y = moon.getAltitudeAt(w1.x, w1.z);
      waypoints.add(w1);
      PVector w2 = new PVector(w1.x, w1.y, bottomRight.z);
      w2.y = moon.getAltitudeAt(w2.x, w2.z);
      waypoints.add(w2);
      PVector w3 = new PVector(w2.x + bounds.z, w2.y, w2.z);
      w3.y = moon.getAltitudeAt(w3.x, w3.z);
      waypoints.add(w3);
      PVector w4 = new PVector(w3.x, w3.y, w1.z);
      w4.y = moon.getAltitudeAt(w4.x, w4.z);
      waypoints.add(w4);
      topLeft = new PVector(w4.x + bounds.z, w4.y, w4.z);
    }
  }

  public PVector nextWaypoint() {
    while (!waypoints.isEmpty()) { 
      PVector waypoint = (PVector) waypoints.get(waypoints.size() - 1); 
      if (location.dist(waypoint) > bounds.x) {
        return waypoint;
      }
      digging = true;
      waypoints.remove(waypoints.size() - 1);

    }
    digging = false;
    
    if (null == miningPlace) {
      return null;
    }
    
    // replan
    mine(miningPlace, miningRadius);
    return nextWaypoint();
    
  }

  public void draw() {
    super.draw();
   
    if (showBounds) {
      stroke(color(0, 255, 0));
      PVector last = null;
      for (final PVector waypoint : (List<PVector>) waypoints) {
        if (null != last) {
          line(last.x, last.y, last.z, waypoint.x, waypoint.y, waypoint.z);
        }
        last = waypoint;
      }
      if (null != last) {
        line(last.x, last.y, last.z, location.x, location.y, location.z);
      }
    } 
  }

  public void update(float deltaTime) {
    
    PVector waypoint = nextWaypoint();
    if (null != waypoint) {
      PVector heading = PVector.sub(waypoint, location);
      heading.y = 0;
      heading.normalize();
      heading.mult(500);
      float a = ((heading.z > 0) ? -1 : 1) * acos(heading.x / heading.mag());
      rot.y = rot.y + (a - rot.y) * deltaTime;
      acceleration.x = heading.x;
      acceleration.z = heading.z;
    }   

    super.update(deltaTime);

    if (digging) {
      float digDepth = location.y - 5;
      float cosd = cos(rot.y);
      float sind = sin(rot.y);
      PVector digVector = new PVector((- bounds.z * sind) * 0.525, (bounds.z * cosd) * 0.525);
      PVector digPoint = new PVector(location.x - digVector.x, location.z - digVector.y);
      digVector.normalize();
      digVector.mult(moon.scale / 2);
      int iter = (int) (bounds.z * 2.2 / moon.scale);
      for (int i = 0; i < iter; i++) {
        dug += moon.digAt(digPoint.x, digPoint.y, digDepth) * efficiency;
        digPoint.add(digVector);
      }
      while (dug > capacity) {
        dug -= capacity;
        Block block = new Block();
        block.setup();
        block.place(location);
        blocks.add(block);
      }
    }
        
 }

}

class Moon extends GameObject {
  
  float scale = MOON_SCALE;
  float[][] map;
  int mapWidth = MOON_RES;
  int mapHeight = MOON_RES;

  PVector center;
  PVector q1;
  PVector q2;
  PVector q3;
  PVector q4;
 
  public PVector getCenter() {
    return center;
  }

  public PVector getQ1() {
    return q1;
  }

  public PVector getQ2() {
    return q2;
  }

  public PVector getQ3() {
    return q3;
  }

  public PVector getQ4() {
    return q4;
  }
  
  public PVector getRandom() {
    int ix = (int) random(mapWidth / 2) + mapWidth / 4;
    int iz = (int) random(mapHeight / 2) + mapHeight / 4;
    float cx = ix * scale;
    float cz = iz * scale;
    return new PVector(cx, altitude(ix, iz), cz);
  }
  
  public float getAltitudeAt(float x, float z) {
    
    // bilinear interpolation of altitude
    
    float sx = x / scale;
    float sz = z / scale;
    int i = (int) sx;
    int j = (int) sz;
    float dx = sx - i;
    float dz = sz - j;
    
    float q11 = altitude(i, j);
    if ((dx + dz) < 0.01) return q11;
    
    float q21 = altitude(i + 1, j);
    float q12 = altitude(i, j + 1);
    float q22 = altitude(i + 1, j + 1);  
    float q = ((q11 * (1f - dx) * (1f - dz)) +
              (q21 * (dx) * (1f - dz)) + 
              (q12 * (1f - dx) * (dz)) + 
              (q22 * (dx) * (dz))); 
         
    return q;
    
  }

  public void normal(int i, int j, PVector up) {
    up.x = altitude(i - 1, j) - altitude(i + 1, j);
    up.z = altitude(i, j - 1) - altitude(i, j + 1);
    up.y = 2;
    up.normalize();
  }
  
  private float altitude(int i, int j) {
    if (i < 0 || j < 0 || i > (mapWidth - 1) || j > (mapHeight - 1)) {
      return 100;
    }
    float r1 = map[i][j];
    return constrain(r1, 0, 255);
  }

  private float digAt(float x, float z, float depth) {
    
    // modify heightmap at given location
    
    int i = (int) round(x / scale);
    int j = (int) round(z / scale);
    
    if (i < 0 || j < 0 || i > (mapWidth - 1) || j > (mapHeight - 1)) {
      return 0;
    }
    
    float a = altitude(i, j);
    float dug = a - depth;
    if (dug < 0) return 0;
    
    map[i][j] = depth;
    
    return dug;
    
  }
 
  public void setup() {
    
    // get height map
    map = new float[mapWidth][mapHeight];
    for (int i = 0; i < mapWidth; i++) {
      for (int j = 0; j < mapHeight; j++) {
        map[i][j] = 100;   
      }
    }

    // calc center
    int ix = mapWidth / 2;
    int iz = mapHeight / 2;
    float cx = ix * scale;
    float cz = iz * scale;
    center = new PVector(cx, altitude(ix, iz), cz);
    q1 = new PVector(cx / 2, altitude(ix / 2, iz / 2), cz / 2);
    q2 = new PVector(cx + cx / 2, altitude(ix + ix / 2, iz / 2), cz / 2);
    q3 = new PVector(cx / 2, altitude(ix / 2, iz + iz / 2), cz + cz / 2);
    q4 = new PVector(cx + cx / 2, altitude(ix + ix / 2, iz + iz / 2), cz + cz / 2);
    
  }
  
  public void draw() {
    stroke(color(255, 255, 255));
    fill(color(0, 0, 0));
    
    
    for (int i = 0; i < (mapWidth - 1); i++) {
      beginShape(QUAD_STRIP);
      for (int j = 0; j < (mapHeight); j++) {
        vertex(i * scale, altitude(i, j), j * scale); 
        vertex((i + 1) * scale, altitude(i + 1, j), j * scale); 
      }
      endShape();
    }
    
    
  }
  
}
// borrowed from http://www.openprocessing.org/sketch/49836

class OBJModel {

  PVector size = new PVector(1, 1, 1);
  PVector location = new PVector(0, 0, 0);
  float rY = 0;
  List<PVector> vertexes = new ArrayList<PVector>();
  List<Integer> faces = new ArrayList<Integer>();
  boolean isFill = true;
  int fillColor = color(255, 255, 255); 
  boolean isStroke = false;
  int strokeColor = 0;
  
  public void setScale(float x, float y, float z) {
    size.x = x;
    size.y = y;
    size.z = z; 
  }
  
  public void turn(float y) {
    rY += y; 
  }

  public void move(float x, float y, float z) {
    location.x += x;
    location.y += y;
    location.z += z; 
  }

  public void setFill(int c) {
    isFill = true;
    fillColor = c;
  }
  
  public void draw() {
    rotateY(rY);
    scale(size.x, size.y, size.z);
    translate(location.x, location.y, location.z);
    if (isFill) {
      fill(fillColor);
    } else {
      noFill();
    }
    if (isStroke) {
      stroke(strokeColor);
    } else {
      noStroke();
    }
    beginShape(TRIANGLES);
    for(int i=0; i < faces.size(); i++) {
      PVector p = vertexes.get(((int) faces.get(i))-1);
      vertex(p.x,p.y,p.z);
    }
    endShape(); 
  }  
  
  public void box(float w, float h, float d) {
    
    vertexes.add(new PVector(-w / 2, -h / 2, -d / 2));
    vertexes.add(new PVector(-w / 2, -h / 2, d / 2));
    vertexes.add(new PVector(-w / 2, h / 2, -d / 2));
    vertexes.add(new PVector(-w / 2, h / 2, d / 2));
    vertexes.add(new PVector(w / 2, -h / 2, -d / 2));
    vertexes.add(new PVector(w / 2, -h / 2, d / 2));
    vertexes.add(new PVector(w / 2, h / 2, -d / 2));
    vertexes.add(new PVector(w / 2, h / 2, d / 2));

    faces.add(1);
    faces.add(2);
    faces.add(3);
    faces.add(7);
    faces.add(1);
    faces.add(6);
    faces.add(6);
    faces.add(1);
    faces.add(5);
    faces.add(7);
    faces.add(5);
    faces.add(1);
    faces.add(1);
    faces.add(4);
    faces.add(3);
    faces.add(6);
    faces.add(2);
    faces.add(1);
    faces.add(4);
    faces.add(2);
    faces.add(6);
    faces.add(8);
    faces.add(5);
    faces.add(7);
    faces.add(8);
    faces.add(5);
    faces.add(7);
    faces.add(5);
    faces.add(8);
    faces.add(6);
    faces.add(8);
    faces.add(7);
    faces.add(3);
    faces.add(8);
    faces.add(3);
    faces.add(4);
    faces.add(8);
    faces.add(4);
    faces.add(6); 
    
  }
  
  public void loadObj(String name) {
    println("loading object file: " + name);
  
    String[] file = loadStrings(name); //load 'er up!
    println(name + " lines in file: " + file.length);

    float minX = 0, minY = 0, minZ = 0;
    float maxX = 0, maxY = 0, maxZ = 0;
    
    for(int i=0; i < file.length; i++) {

      String theChar = file[i].substring(0, 1);
      if(theChar.equals("#")) {
        continue; //it's a comment!
      }
      if(theChar.equals("v")) { //vertex

        String vertexList = file[i].substring(2,file[i].length()); //get the list
        String[] vertexArray = split(vertexList,' '); //split the list
        PVector v = new PVector(
          float(vertexArray[0]), //make a vector
          float(vertexArray[1]),
          float(vertexArray[2])
        );
        if (vertexes.isEmpty()) {
          maxX = minX = v.x;
          maxY = minY = v.y;
          maxZ = minZ = v.z;          
        } else {
          maxX = max(maxX, v.x);
          maxY = max(maxY, v.y);
          maxZ = max(maxZ, v.z);
          minX = min(minX, v.x);
          minY = min(minY, v.y);
          minZ = min(minZ, v.z);
        }
        vertexes.add(v); //and add it!
        
      } else if(theChar.equals("f")) {
        
        String faceList = file[i].substring(2,file[i].length());
        String[] faceArray = split(faceList,' ');
        faces.add(int(faceArray[0]));
        faces.add(int(faceArray[1]));
        faces.add(int(faceArray[2]));
      }
    }
    
    // autocenter
    location.x -= (maxX + minX) / 2;
    location.y -= (maxY + minY) / 2;
    location.z -= (maxZ + minZ) / 2;
    
    println(name + " vertexes: " + vertexes.size());
    println(name + " faces: " + faces.size());
    println(name + " location: " + location);

  }
  
}


class Message {
  
  String text;
  float timeLeft;
  Message next;
  
  public Message(String string, float displayTime) {
    text = string;
    timeLeft = displayTime;
  }
  
  void decrement(float deltaTime) {
    timeLeft -= deltaTime; 
  }
  
  boolean isExpired() {
    return timeLeft <= 0; 
  }
  
}

class Radio extends GameObject {

  Message message = null;
  Message lastMessage = null;
  boolean consoleOnly = true;
  
  public void setup() {
    addMessage("I Dig the Moon", 5);
    addMessage("Use arrow keys to navigate", 5);
    addMessage("Pick up moonbricks from the surface miner for moonbucks", 5);
    addMessage("Enjoy your life on the Moon!", 5);
  }
 
  public void addMessage(String text, float displayTime) {
    Message next = new Message(text, displayTime);
    if (null != lastMessage) lastMessage.next = next;
    else if (null == message) {
      message = next;
      println(message.text);
    }
    lastMessage = next;
  }
  
  public void clear() {
    message = null;
    lastMessage = null;
  }
  
  public void update(float deltaTime) {
    if (null != message) {
      message.decrement(deltaTime);
      if (message.isExpired()) {
        message = message.next;
        if (null != message) {
          println(message.text);
        }
      } 
    }
    
  }
  
  public void draw() {
    if (null != message && !consoleOnly) {
      fill(255, 255, 255);
      translate(buggy.location.x, buggy.location.y + 50, buggy.location.z);
      rotateY(-(buggy.rot.y - PI / 2));
      rotateX(PI);
      textAlign(CENTER);
      scale(0.5);
      text(message.text, 0, 0, 0); 
    }
  }

}


