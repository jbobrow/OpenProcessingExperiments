
World world;
EventManager eventManager;

void setup() {
  size(640, 360, P3D);
  eventManager = new EventManager();
  world = new World();
}

void draw() {
  world.draw();
}

void keyPressed() {
  eventManager.keyPressed();
}

void keyReleased() {
  eventManager.keyReleased();
}
class Block implements Visible {
  float x, y, z, xSize, ySize, zSize;
  int clr;

  Block(float x_, float y_, float z_
    , float xSize_, float ySize_, float zSize_, int clr_) {
    x = x_;
    y = y_;
    z = z_; 
    xSize = xSize_;
    ySize = ySize_;
    zSize = zSize_;
    clr = clr_;
  }

  void draw() {
    pushMatrix();
    fill(clr);
    translate(x, y, z);
    float clrScale = 0.5;
    stroke(red(clr) * clrScale, green(clr) * clrScale, blue(clr) *clrScale);
    box(xSize, ySize, zSize);
    popMatrix();
  }
}
class EventManager {
  // An EventManager keeps track of which keys are currently pressed.
  
  IntegerSet keySet = new IntegerSet();

  void keyPressed() {
    keySet.add(key);
  }

  void keyReleased() {
    keySet.remove(key);
  }

  boolean hasKey(int c) {
    return keySet.hasValue(c);
  }
}
class IntegerSet {
  // An IntegerSet is, not surprisingly, a SET of integers.
  // That means that unlike a list or array, elements are
  // not repeated. 
  //If you try to add an element already in the 
  // set, it will ignore you.
  int[] values = new int[0];

  void add(int value) {
    int[] newValues = new int[values.length + 1];
    for (int i = 0; i < values.length; ++i ) {
      if (values[i] == value) {
        //already have it
        return;
      }
      newValues[i] = values[i];
    }
    newValues[values.length] = value;
    values = newValues;
  }

  boolean hasValue(int value) {
    for (int i = 0; i < values.length; ++i ) {
      if (values[i] == value) {
        return true;
      }
    }
    return false;
  }

  boolean isEmpty() {
    return values.length == 0;
  }

  void remove(int value) {
    if (values.length == 0) {
      //empty, so nothing to remove
      return;
    }
    int[] newValues = new int[values.length - 1];
    int newIndex = 0;
    for (int i = 0; i < values.length; ++i ) {
      if (values[i] != value) {
        //copy, don't remove
        newValues[newIndex++] = values[i];
      }
    }
    values = newValues;
  }
}
class Sphere implements Visible {
  Sphere() {
  }
  void draw() {
    pushMatrix();
    //draw moon & sun
    rotate(millis()/4500.0);
    translate(1500, 0, 0);
    noStroke();
    fill(200);
    sphere(50);
    fill(#FFFF00);
    translate(-3000, 0, 0);
    sphere(75);
    popMatrix();
  }
}

interface Visible {
  /* Everything that can be drawn should implement Visible.
  This allows us to have collections of Visibles which we
  can iterate over */
  void draw();
}

class World {
  ArrayList<Visible> visibles;
  ArrayList<Visible> visiblesToRemove;
  float x, y, z;//position of Observer in space
  float heading = 0;//initial heading
  float stepSize = 10;//position increment when moving
  int lastFiringTime = 0;
  float headingStep = 0.04;//angle increment when turning
  World() {
    x = y = z = 0;
    visibles = new ArrayList<Visible>();
    visiblesToRemove = new ArrayList<Visible>();
    //create some colored blocks so we have something to look at
    float blockSize = width / 6;
    float yBlockCenter = -blockSize /2 ;
    float blockSpacing = blockSize * 2;
    for (int i = 2; i <5 ; ++i) {
      visibles.add(new Block(blockSpacing * i, yBlockCenter, 0, blockSize, blockSize, blockSize, color(255, 0, 0)));
      visibles.add(new Block(-blockSpacing * i, yBlockCenter, 0, blockSize, blockSize, blockSize, color(255, 200, 200)));
      visibles.add(new Block(0, yBlockCenter, blockSpacing * i, blockSize, blockSize, blockSize, color(0, 0, 255)));
      visibles.add(new Block(0, yBlockCenter, -blockSpacing * i, blockSize, blockSize, blockSize, color(200, 200, 255)));
    }
    visibles.add(new Sphere());
    visibles.add(new MouseEvent(x, y, z));
  }

  void draw() {
    handleInput();

    //draw sky
    float secondsPerDay = 30;
    float skyBlueLevel = map(sin(millis()*0.001* 2 * PI / secondsPerDay), -1, 1, 100, 255);
    float skyRedLevel = skyBlueLevel * 0.3;
    float skyGreenLevel = skyBlueLevel * 0.8;
    background(skyRedLevel, skyGreenLevel, skyBlueLevel);

    //draw ground
    fill(0, 200, 0);
    rotateX(PI / 2 );
    ellipse(0, 0, width * 100, width * 100);
    rotateX(-PI / 2 );

    //draw visibles
    translate(width/2, height/2, 0);
    rotateY(heading);
    float pixelsBelowEyeLevel = 60;
    camera(x, y - pixelsBelowEyeLevel, z, x - cos(heading), y - pixelsBelowEyeLevel, z - sin(heading), 0.0, 1.0, 0.0);
    for (Visible visible : visibles) {
      visible.draw();
    }
    for (Visible rmv : visiblesToRemove) {
      visibles.remove(rmv);
    }
    visiblesToRemove = new ArrayList<Visible>();
    
  }
  
  void removeVisible(Visible v) {
    visiblesToRemove.add(v);
  }

  void handleInput() {
    //fire
    if (millis()-lastFiringTime > 500) {
      if (eventManager.hasKey('f') ) {
        lastFiringTime = millis();
        visibles.add(new Event(x, y, z, heading));
      }
    }
    //forward
    if (eventManager.hasKey('w') ) {
      x -= stepSize * cos(heading);
      z -= stepSize * sin(heading);
    } 
    //backward
    if (eventManager.hasKey('s') ) {
      x += stepSize * cos(heading);
      z += stepSize * sin(heading);
    }
    //turn left
    if (eventManager.hasKey('a') ) {
      heading -= headingStep ;
    }
    //turn right
    if (eventManager.hasKey('d') ) {
      heading += headingStep;
    }
    //go up
    if (eventManager.hasKey(' ') ) {
      y -= stepSize ;
    } 
    else {
      //fall back down, but don't fall below zero level.
      if ( y < 0) {
        y += stepSize;
      } 
      else {
        y = 0;
      }
    }
  }
}

class Event implements Visible {
  int count = 0;
  float x, y, z, heading;
  Event(float x_, float y_, float z_, float heading_) {
    x = x_;
    y = y_;
    z = z_;
    heading = heading_;
  }

  void draw() {
    ++count;
    pushMatrix();
    fill(200-count, 0, count);
    float stepSize = 3;
    x -= stepSize * cos(heading);
    z -= stepSize * sin(heading);
    noStroke();
    translate(x, y-50+(count*count/200), z);
    sphere(5);
    if (count >200) {
      world.removeVisible(this);
    }
    popMatrix();
  }
}

class MouseEvent implements Visible {
  float x, y, z;
  MouseEvent(float x_, float y_, float z_) {
    x = x_;
    y = y_;
    z = z_;
  }

  void draw() {
    pushMatrix();
    if (mousePressed) {
      
    }
    popMatrix();
  }
}



