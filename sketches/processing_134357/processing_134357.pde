
///////////////////////////////////// DATA

import ComputationalGeometry.*;

int NUM_CATS = 30;
int NUM_MICE = 1000;

float MIN_CAT_RADIUS = 20;
float MAX_CAT_RADIUS = 30;

float MIN_MOUSE_RADIUS = 5;
float MAX_MOUSE_RADIUS = 10;

ArrayList<Jerry> mice;
//Jerry[] mice; // array to hold instances of the Jerry class
Tom[] cats;


IsoContour iso;


///////////////////////////////////// SETUP

void setup()
{
  randomSeed(1);
  background(0);
  size(1280, 720, P3D);
  frameRate(60);
  smooth();

  // Construct instance(s) of the Tom class
  cats = new Tom[NUM_CATS];
  // Construct instance(s) of the Jerry class
  mice = new ArrayList<Jerry>(); // Create an empty arraylist


  for (int i =0; i < cats.length; i++)
  {
    cats[i] = new Tom(random(width), random(height), random(MIN_CAT_RADIUS, MAX_CAT_RADIUS));
  }

  // populate mice arraylist
  for (int j = 0; j < NUM_MICE; j++)
  {
    mice.add(new Jerry(random(width), random(height), random(MIN_MOUSE_RADIUS, MAX_MOUSE_RADIUS)));
  }

  // create isocontour  
  iso = new IsoContour(this, new PVector(0, 0), new PVector(width, height), 200, 200);
}

void update()
{
  for (int i = 0; i < cats.length; i++)
  {
    cats[i].update();
  }

  for (int j = 0; j < mice.size(); j++)
  {
    Jerry jerry = mice.get(j);
    jerry.update();

    /*
    if (jerry.spawnChild == true)
     {
     //mice.add(new Jerry(jerry.location.x, jerry.location.y, jerry.radius));
     jerry.spawnChild = false; 
     }
     */
  }

  /////////////////////////////////////////////////////////// CAT SHAPE
  // lets make a shape
  //blendMode(BLEND);
  //fill(0, 0, 0, 50);
  //stroke(255, 0, 0, 20);
  //beginShape();
  iso.clear();
  for (int m = 0; m < mice.size(); m++) {

    Jerry mousePoint = mice.get(m);

    // if the mouse is fleeing
    if (mousePoint._state == 2)
    {
      //println("fdf");
      PVector pt = new PVector( mousePoint.location.x, mousePoint.location.y, 0 );
      iso.addPoint(pt);

      // Alternate: add a point with a weighting factor
      // iso.addPoint(pt, random(0,1)); 


      // store the points in the shape
      //curveVertex(mousePoint.location.x, mousePoint.location.y);
    }
  }
  //endShape(CLOSE);
  // Plot Voxel Space
}

///////////////////////////////////// DRAW

void draw()
{
  update(); // update everything's position
  //background(255, 1);
  blendMode(BLEND);
  //filter(BLUR,0);
  fill(0, 10);
  noStroke();
  rect(0, 0, width, height);

  // draw the cats
  for (int i = 0; i < cats.length; i++)
  {
    if ( cats[i]._state == 2)
    {
      cats[i].draw();
    }
  }

  // draw the mice
  for (int j = 0; j < mice.size(); j++)
  {
    Jerry jerry = mice.get(j);
    //jerry.draw();
  }

  for (int j = 0; j < mice.size(); j++)
  {
    // get a first mouse
    Jerry firstMouse = mice.get(j);
    // draw line from that mouse to the closest mouse, if both roaming
    if (firstMouse._state == 1 && firstMouse.targetMouse._state == 1)
    {
      stroke(15);
      line(firstMouse.location.x, firstMouse.location.y, firstMouse.targetMouse.location.x, firstMouse.targetMouse.location.y);
      //bezier(firstMouse.location.x, firstMouse.location.y,  firstMouse.targetMouse.location.x, firstMouse.targetMouse.location.y);
    }

    // get a cat
    for (int k = 0; k < cats.length; k++)
    {
      Tom firstCat = cats[k];

      // if the mouse is fleeing the cat
      if (firstMouse._state != 1)
      {
        // change stroke color based on cat state
        if (firstCat._state == 0) { 
          stroke(100, 0, 0);
        }
        if (firstCat._state == 1) { 
          stroke(150, 150, 0);
        }
        blendMode(SCREEN);
        // draw a line between them
        //line(firstMouse.location.x, firstMouse.location.y, firstCat.location.x, firstCat.location.y);
      }
    }
  }



  // Plot Contour at a Threshold
  fill(0, 0, 0, 10);
  stroke(200, 0, 0);
  float threshold = abs(sin(frameCount/100.0f)) * .01;
  iso.plot( threshold); // you must provide a threshold to render the iso contour


  /////////////////////////////////// TEXT

  // text
  fill(0, 102, 153);
  //text("mice: " + mice.size(), 30, 30);
}

void mouseReleased()
{
  // When we click and release the mouse, save a frame
  saveFrame();
}

class Jerry 
{
  // Jerry's behavior is to roam around randomly, if he see's Tom, he will flee and hide.
  // If it's safe he'll continue roaming. If Jerry runs into another mouse, they'll have
  // a child.

  // data
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector direction;
  PVector targetLocation;
  float dx;
  float dy;
  float radius;
  float heading;
  float speed;
  float topSpeed = 12;
  float DELTA_ANGLE = radians(5);
  color mouseColor = color(255, 255, 255);
  color targetedColor = color(255, 0, 0);
  //
  float jWalkSpeed = random(3, 5);
  float jFleeSpeed = random(7, 10);
  float jHideSpeed = 1;
  float safeDistance = 300;
  float dangerDistance = 100;
  float distClosest = 999999;
  Jerry targetMouse;

  boolean doneHiding = true;
  boolean catInFront = false;
  boolean catIsClose = false;
  boolean catIsGone = false;
  boolean targeted = false;
  boolean dead = false;
  boolean male = false;
  boolean spawnChild = false;

  // create a var for each state
  final int jStateHide = 0;
  final int jStateRoam = 1;
  final int jStateFlee = 2;

  // holds the current state id
  int _state;

  // time
  int savedTime; // used to save a time at a certain point
  int totalTime = 2000; // we compare savedTime with the current time (millis())
  // and when it equals totalTime, our timer is done

  // constructor
  Jerry(float _x, float _y, float _radius) 
  {
    location = new PVector(_x, _y);
    radius = _radius;
    heading = random(radians(360));
    // set the initial state
    switchState(jStateRoam);
  }

  void draw()
  {
    pushStyle(); // Remember current drawing style

      if (targeted)
    {
      fill(targetedColor); // fill with mouse color
    }
    else
    {
      if (_state == 0) mouseColor = color(0, 255, 0);
      if (_state == 1) mouseColor = color(255, 255, 255);
      if (_state == 2) mouseColor = color(0, 0, 255);
      fill(mouseColor);
    }
    stroke(0); // Black stroke
    strokeWeight(1); // 1 pixel stroke
    ellipseMode(RADIUS); // set ellipse drawing mode to radius
    pushMatrix(); // Remember current drawing transofrmation
    translate(location.x, location.y); // Translate to the position of the circle
    rotate(heading); // Rotate to the direction of the heading
    ellipse(0, 0, radius, radius); // Draw the circle (x, y, width/2, height/2)
    line(0, 0, radius, 0); // Draw a line in the direction of the heading);
    popMatrix(); // Restore previous drawing transformation

    // draw a red line between the centers of circles that are touching

    popStyle(); // restore previous drawing style
  }

  // functionality
  void update() 
  {
    // update the state
    updateState();

    // wrap around
    wrapAround();

    // find closest mouse
    findClosestMouse();

    /*
    // stay in bounds
     //stayOnCanvas();
     
     // turn if you hit a wall, unless you're hiding
     if (_state != jStateHide) {
     turnAround();
     }
     */

    // print the state
    //println("State: " + _state);
  }

  // this function will initialize any variables when we switch states
  // and call the behavior function we want
  void switchState(int state)
  {
    switch(state)
    {
    case jStateHide:
      speed = jHideSpeed;
      doneHiding = false;
      catIsClose = false;
      savedTime = millis();
      heading = random(radians(360));
      behaviorHide();
      break;
    case jStateRoam:
      speed = jWalkSpeed;
      catInFront = false;
      behaviorRoam();
      break;
    case jStateFlee:
      speed = jFleeSpeed;
      catIsGone = false;
      behaviorFlee();
      break;
    }
    _state = state;
  }

  void updateState()
  {
    switch(_state)
    {
    case jStateHide:
      // keep hiding
      behaviorHide();
      // Did the cat get close again?
      if (catIsClose)
      {
        // println("Cat too close, must flee");
        switchState(jStateFlee);
      }
      // Am I done looking around?
      if (doneHiding)
      {
        // println("Seems safe, continue roaming");
        switchState(jStateRoam);
      }
      break;
    case jStateRoam:
      // keep roaming
      behaviorRoam();
      // Did the cat jump in front of me
      if (catInFront)
      {
        // println("Saw cat, must flee");
        switchState(jStateFlee);
      }
      break;
    case jStateFlee:
      // keep fleeing
      behaviorFlee();
      // Finally got away from cat..
      if (catIsGone)
      {
        // println("Cat is gone, let's hide");
        switchState(jStateHide);
      }
      break;
    }
  }

  void behaviorRoam()
  {
    // randomly roam around
    heading += random (-DELTA_ANGLE, DELTA_ANGLE);

    // update velocity
    dx = speed * cos(heading);
    dy = speed * sin(heading);

    // stay with your other mice
    orientTowardsLikeObjects();

    velocity = new PVector(dx, dy);

    // location changes by velocity
    location.add(velocity);

    // if the cat is in front of us
    for (int i = 0; i < cats.length; i++)
    {
      if (distanceToCat(cats[i]) <= dangerDistance)
      {
        // we see it
        catInFront = true;
      }
    }
  }

  void behaviorFlee()
  {
    // stay away from these other mice
    avoidLikeObjects();

    for (int i = 0; i < cats.length; i++)
    {
      // saw cat, flee linearly (eventually it'll be away from cats)
      // calculate distance to cat
      float distToCat = distanceToCat(cats[i]);
      heading += random (-DELTA_ANGLE, DELTA_ANGLE);
      PVector targetLocation = new PVector(cats[i].location.x, cats[i].location.y);

      // the direction is towards the target
      direction = PVector.sub(location, targetLocation);
      direction.normalize();
      direction.mult(speed);

      // acceleration is determined here
      acceleration = direction;

      // velocity changes by acceleration
      velocity.add(acceleration);
      velocity.limit(topSpeed);

      // location changes by velocity
      location.add(velocity);

      // check to see if we have escaped the cat
      if (distanceToCat(cats[i]) > safeDistance)
      {
        // the cat is gone
        catIsGone = true;
      }
    }
  }

  void behaviorHide()
  {
    // check all of the cats in the sketch
    for (int i = 0; i < cats.length; i++)
    {
      // calculate distance to cat
      float distToCat = distanceToCat(cats[i]);
      // once far enough away from cats, stop moving
      if (distToCat >= dangerDistance)
      {
        // start spinning
        heading += random(radians(20));
        //println("heading: " + heading);

        // update velocity
        dx = speed * cos(heading);
        dy = speed * sin(heading);
        velocity = new PVector(dx, dy);
        // location changes by velocity
        location.add(velocity);

        // Calculate how much time has passed
        int passedTime = millis() - savedTime;

        // if enough time has passed, go to roam
        if (passedTime > totalTime)
        {
          // we are done hiding!
          doneHiding = true;
          // println( " 5 seconds have passed! " );
          savedTime = millis(); // Save the current time to restart the timer!
        }
      }
      else
      {
        doneHiding = false;
        savedTime = millis(); // Save the current time to restart the timer!
      }

      if (distanceToCat(cats[i]) <= dangerDistance)
      {
        // println("cat is close again");
        catIsClose = true;
      }
    }
  }

  boolean touching(Tom other)
  {
    // returns true if the distance between two objects is less than
    // the sum of their radii, which means they are touching
    return (distanceToCat(other) < radius + other.radius);
  }

  boolean touchingMouse(Jerry other)
  {
    // returns true if the distance between two objects is less than
    // the sum of their radii, which means they are touching
    return (distanceToMouse(other) < radius + other.radius);
  }

  float distanceToCat(Tom other)
  {
    // returns the distance between two circles
    return dist(location.x + radius, location.y + radius, other.location.x + other.radius, other.location.y + other.radius);
  }

  float distanceToMouse(Jerry other)
  {
    // returns the distance between two circles
    return dist(location.x + radius, location.y + radius, other.location.x + other.radius, other.location.y + other.radius);
  }

  void targeted()
  {
    targeted = true;
  }

  void unTargeted()
  {
    targeted = false;
  }

  void orientTowardsLikeObjects() {
    // Orient toward the direction of an Element that is touching 
    for (int j = 0; j < mice.size(); j++)
    {
      if (mice.get(j) != this)
      {
        if (touchingMouse(mice.get(j)))
        {
          Jerry jerry = mice.get(j);
          //spawnChild = true;
          //mice.add(new Jerry(location.x, location.y, radius));


          // Calculate the direction towards the other circle using the atan2() function
          float influence = atan2(jerry.location.y - location.y, jerry.location.x - location.x);          
          // Calculate the difference between the current heading and the direction towards
          // the other mouse
          float delta = influence - heading;
          // Check to see which way would be shorter to turn
          if (delta > PI) delta -= TWO_PI;
          if (delta < -PI) delta += TWO_PI;
          // Update the heading by moving 1% of the way towards the other element
          heading += delta * 0.1;
        }
      }
    }
  }

  void avoidLikeObjects() {
    // While touching another, move away from its centre
    for (int i = 0; i < mice.size(); i++)
    {
      if (mice.get(i) != this) 
      {
        if (touchingMouse(mice.get(i))) 
        {
          Jerry jerry = mice.get(i);
          float d = distanceToMouse(jerry);
          float dx = (jerry.location.x - location.x)/d;
          float dy = (jerry.location.y - location.y)/d;
          location.x -= speed * dx;
          location.y -= speed * dy;
        }
      }
    }
  }

  void findClosestMouse()
  {
    // reset the closest distance to the cat's search range
    distClosest = 999999;
    // loop through all the mice
    for (int i = 0; i < mice.size(); i++)
    {
      // if the mouse is null
      if (mice.get(i) == null) 
      {
        println("err, mouse is null");
      }
      // if not null
      else if (mice.get(i) != null && mice.get(i) != this)
      {
        // get distance to mouse
        float distToMouse = distanceToMouse(mice.get(i));

        // if the mouse is closer than the previously closest one
        if (distToMouse < distClosest)
        {
          // update the closest distance
          distClosest = distToMouse;
          // remember the closest mouse
          targetMouse = mice.get(i);
          // look towards target
          //tHeading  = atan2(targetMouse.x - location.x, targetMouse.y - location.y)*(radians(180)/PI - radians(90));
        }
      }
    }
  }

  void wrapAround()
  {
    location.x = (location.x + width) % width;
    location.y = (location.y + height) % height;
  }

  void stayOnCanvas()
  {
    // Constrain to surface
    if (location.x < radius) location.x = radius;
    if (location.y < radius) location.y = radius;
    if (location.x > width - radius) location.x = width - radius;
    if (location.y > height - radius) location.y = height - radius;
  }

  void turnAround()
  {
    if (location.x <= radius || location.y <= radius || location.x >= width - radius || location.y >= height - radius)
    {
      //println("turning");
      heading -= radians(180);
    }
  }
} // END CLASS

class Tom
{
  // Tom's behavior is to find the nearest mouse, and chase after it. If it catches it,
  // it kills it, and naps for a few seconds.Then it'll grow slightly bigger and become slower.

  // data
  float radius;
  float speed = 1;
  float slowDown = .9;
  float speedUp = 1.1; 
  float angle, arcangle;
  //
  color catColor = color(0, 0, 0);

  float tChaseSpeed = 1;
  // some impossibly high distance (ie something is always closer)
  float distClosest = 99999;
  // the closest mouse
  Jerry targetMouse;
  // location represents this objects x,y
  PVector location;
  // velocity represents where this object is moving (xspeed, yspeed)
  PVector velocity;
  // acceleration represents the rate of change of velocity
  PVector acceleration;
  // direction represents the direction to the target
  PVector direction;
  // the horizontal axis
  PVector horizontalAxis;
  // top speed
  float topSpeed = 15;
  //
  float dx;
  float dy;
  // vectors to hold targetMouse's location and velocity
  PVector targetLocation;
  PVector targetVelocity;
  //
  boolean catIsFull = false;
  boolean catIsHungry = true;
  boolean noMoreMice = false;
  float weightGain = .05;
  float weightLoss = .1;

  // create a var for each state
  final int tStateChase = 0;
  final int tStateNap = 1;
  final int tStateDone = 2;

  // holds the current state id
  int _state;

  // time
  int savedTime; // used to save a time at a certain point
  int totalTime = 5000; // we compare savedTime with the current time (millis())
  // and when it equals totalTime, our timer is done

  // constructor
  Tom(float _x, float _y, float _radius)
  {
    // set our PVector to the arguments passed in
    location = new PVector(_x, _y);
    velocity = new PVector(0, 0);
    dx = 0;
    dy = 0;
    targetLocation = new PVector(dx, dy);
    angle = 0;
    direction = PVector.sub(targetLocation, location);
    horizontalAxis = new PVector(100, 0);
    radius = _radius;
    // set the initial state
    switchState(tStateChase);
  }

  void draw()
  {
    pushStyle(); // Remember current drawing style

      fill(catColor); // black fill
    noStroke(); // no stroke
    strokeWeight(1); // Set the stroke weight to 1 pixel
    ellipseMode(RADIUS); // Set the ellipse drawing mode using radius

    pushMatrix(); // Remember current drawing transformation

    translate(location.x, location.y); // Translate to the position of the circle
    if (dy > location.y)
    {
      rotate(angle);
    }
    else
    {
      rotate(-angle);
    }
    ellipse(0, 0, radius, radius); // Draw the circle
    ellipse(radius, 0, 5, 5); // draw nose
    line(-radius, 0, radius, 0); // draw x axis
    line(0, -radius, 0, radius); // draw y axis
    //text(int(degrees(angle)), 0, 100);

    popMatrix(); // Restore previous drawing transformation

    popStyle(); // Restore previous drawing style

      // draw line between target and cat
    if (_state == tStateChase)
    {
      line(location.x, location.y, targetMouse.location.x, targetMouse.location.y);
      // make target's color different
      targetMouse.targeted();
    }
  }

  void update()
  {
    // check if there are mice
    if (mice.size() <= 0)
    {
      println("no mice");
      noMoreMice = true;
    }
    else
    {
      noMoreMice = false;
    }
    // update the state of this cat
    updateState();

    wrapAround();
    // stayOnCanvas
    //stayOnCanvas();
  }

  // this function will initialize any variables when we switch states
  // and call the behavior function we want
  void switchState(int state)
  {
    switch(state)
    {
    case tStateChase:
      catIsFull = false;
      //speed = tChaseSpeed;
      behaviorChase();
      break;
    case tStateNap:
      catIsHungry = false;
      speed *= slowDown;
      behaviorNap();
      break;
    case tStateDone:
      behaviorDone();
    }
    _state = state;
  }

  void updateState()
  {
    switch(_state)
    {
    case tStateChase:
      // keep hiding
      behaviorChase();
      // Did we catch a mouse?
      if (catIsFull)
      {
        switchState(tStateNap);
      }
      if (noMoreMice)
      {
        switchState(tStateDone);
      }
      break;
    case tStateNap:
      // keep roaming
      behaviorNap();
      // Am I done napping?
      if (catIsHungry)
      {
        switchState(tStateChase);
      }
      break;
    case tStateDone:
      // if there are mice
      if (noMoreMice == false)
      {
        // go to chase
        switchState(tStateChase);
      }
      break;
    }
  }

  void behaviorChase()
  {
    if (radius >= 15)
    {
      radius -= weightLoss;
    }
    // Find the nearest Jerry
    findClosestMouse();

    if (targetMouse != null)
    {
      // chase after the target

      // set dx and dy to the target's location
      dx = targetMouse.location.x;
      dy = targetMouse.location.y;
      targetLocation = new PVector(dx, dy);

      // the direction is towards the target
      direction = PVector.sub(targetLocation, location);
      direction.normalize();
      direction.mult(speed);

      // acceleration is determined here
      acceleration = direction;

      // velocity changes by acceleration
      velocity.add(acceleration);
      velocity.limit(topSpeed);

      // location changes by velocity
      location.add(velocity);

      // get the angle between this and the target
      angle = PVector.angleBetween(direction, horizontalAxis);


      if (touching(targetMouse))
      {
        mice.remove(targetMouse);
        catIsFull = true;
      }
    }
  }

  void behaviorNap()
  {
    radius += weightGain;
    catColor = color(150, 0, 0);

    // Calculate how much time has passed
    int passedTime = millis() - savedTime;

    // if enough time has passed, wake up
    if (passedTime > totalTime)
    {
      // we are hungry again!
      catIsHungry = true;
      // println( " 5 seconds have passed! " );
      savedTime = millis(); // Save the current time to restart the timer!
    }
  }

  void behaviorDone()
  {
    // cat just stays here;
  }



  void findClosestMouse()
  {
    // reset the closest distance to the cat's search range
    distClosest = 999999;
    // loop through all the mice
    for (int i = 0; i < mice.size(); i++)
    {
      // if the mouse is null
      if (mice.get(i) == null) 
      {
        println("err, mouse is null");
      }
      // if not null
      else if (mice.get(i) != null)
      {
        // untarget the mouse
        mice.get(i).unTargeted();

        // get distance to mouse
        float distToMouse = distanceToMouse(mice.get(i));

        // if the mouse is closer than the previously closest one
        if (distToMouse < distClosest)
        {
          // update the closest distance
          distClosest = distToMouse;
          // remember the closest mouse
          targetMouse = mice.get(i);
          // look towards target
          //tHeading  = atan2(targetMouse.x - location.x, targetMouse.y - location.y)*(radians(180)/PI - radians(90));
        }
      }
    }
  }

  void stayOnCanvas()
  {
    // Constrain to surface
    if (location.x < radius) location.x = radius;
    if (location.y < radius) location.y = radius;
    if (location.x > width - radius) location.x = width - radius;
    if (location.y > height - radius) location.y = height - radius;
  }

  void turnAround()
  {
    if (location.x <= radius || location.y <= radius || location.x >= width - radius || location.y >= height - radius)
    {
      println("cat is turning");
    }
  }

  void wrapAround()
  {
    location.x = (location.x + width) % width;
    location.y = (location.y + height) % height;
  }

  boolean touching(Jerry other)
  {
    // returns true if the distance between two objects is less than
    // the sum of their radii, which means they are touching
    return (distanceToMouse(other) < radius + other.radius);
  }

  float distanceToMouse(Jerry other)
  {
    // returns the distance between two objects
    return dist(location.x, location.y, other.location.x, other.location.y);
  }
} // END CLASS



