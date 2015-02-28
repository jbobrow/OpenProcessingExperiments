

class UFO { // the UFO object

  int UFODiam;
  PVector UFOPos;
  PVector UFOVel;
  PVector UFOAcceleration;

  float velLimit = 5; // variable to limit velocity

  float asteroidProximityLimit = 25; // variable to limit proximity to asteroids
  float UFOProximityLimit = 15; // variable to limit proximity to other UFOs

  float asteroidAvoidStrength = 1; // variable to control asteroid avidance speed
  float UFOAvoidStrength = 1; // variable to control UFO avidance speed

  float cohereProximity = 25; // variable to control cohere sight
  float cohereStrength = 0.1; // variable to control cohere strength

  float alignProximity = 25; // variable to control align sight
  float alignStrength = 0.1; // variable to control align strength

  float wayPointStrength = 0.25;


  UFO(PVector _UFOPos, int _UFODiam) { // constructor - name matches class - makes a new UFO object
    // this function runs once. the objects own setup()
    UFOPos = _UFOPos; // pass position value from function so that UFO object can use it
    UFODiam = _UFODiam; // pass diameter value from function so that UFO object can use it
    UFOVel = new PVector(random(-1, 1), random(-1, 1)); // initial UFO velocity
    UFOAcceleration = new PVector(0, 0);
  }

  void renderUFO() { // draw the Asteroid object on the screen
    int side = round(random(1));
    if (side == 1) {
      fill(255, 0, 0);
    } 
    else {
      fill(0, 255, 0);
    }
    ellipse(UFOPos.x, UFOPos.y, UFODiam, UFODiam);
    //  an attemp to add a trailing tail
    //    for (int tail = 5; tail>0; tail--){
    //    fill(255,255,0,100/tail+1);
    //    ellipse(UFOPos.x-tail*4, UFOPos.y-tail*4, UFODiam/(tail+1), UFODiam/(tail+1));
    //    }
  }

  void moveUFO() { // move the Asteroid object
    UFOVel.add(UFOAcceleration); //
    UFOVel.limit(velLimit); // limit the UFO's velocity
    UFOPos.add(UFOVel);  // add the Asteroid's velocity to its position
    UFOAcceleration.mult(0); // reset Acceleration
  }

  void limitUFORange() { // stop the asteroid from traveling too far off screen
    if ((UFOPos.x < 0) || (UFOPos.x > width-0)) { // if asteroid is too far left or right, reverse it's direction
      UFOVel.x *= -1;
      //   failed attempt to ease of the edge...
      //      PVector leftedge = new PVector(20,0,0);
      //      PVector push = PVector.sub(UFOPos, leftedge);
      //      println(UFOPos);
      //      push.mult(0.25);
      //      push.normalize();
      //      UFOVel.add(push);
    }
    if ((UFOPos.y < 0) || (UFOPos.y > height-0)) { // if asteroid is too high or low, reverse asteroid direction
      UFOVel.y *= -1;
    }
  }

  void UFOAvoid () { // check for asteroid collision and change direction accordingly
    for (int asteroidCount = 0; asteroidCount < field.size(); asteroidCount++) { // check each Asteroid one at a time
      Asteroid neighbour = (Asteroid) field.get(asteroidCount); // get out Asteroid and store it in neighbour variable
      float distance = UFOPos.dist(neighbour.asteroidPos); // check how far the Asteroid is from the active UFO
      if (distance < asteroidProximityLimit) { // if it's less than the asteroidProximityLimit...
        PVector push = PVector.sub(UFOPos, neighbour.asteroidPos); // ...subtract the positions and assign the value to PVector push
        push.normalize(); // normalise PVector push
        push.mult(asteroidAvoidStrength); // scale down the push
        UFOAcceleration.add(push); // add push to UFO velocity
      }
      // check for UFO collision and change direction accordingly
      for (int UFOnumber=0; UFOnumber<UFOs.size(); UFOnumber++) { // check each UFO one at a time
        UFO wingman = (UFO) UFOs.get(UFOnumber); // get out UFO and store it in wingman variable
        float wingmanDistance = UFOPos.dist(wingman.UFOPos); // check how far the UFO is from the active UFO
        if (wingmanDistance < UFOProximityLimit) { // if it's less than the UFOProximityLimit...
          PVector push = PVector.sub(UFOPos, wingman.UFOPos); // ...subtract the positions and assign the value to PVector push
          push.normalize(); // normalise PVector push
          push.mult(UFOAvoidStrength); // scale down the push
          UFOAcceleration.add(push); // add push to UFO velocity
        }
      }
    }
  }

  void UFOCohere() { // fly towards each other
    PVector midPos = new PVector(); // new PVector to calculate the midpoint
    int wingmanCount = 0; // variable to count how many wingman are close

    for (int UFOnumber=0; UFOnumber<UFOs.size(); UFOnumber++) { // check each UFO one at a time
      UFO wingman = (UFO) UFOs.get(UFOnumber); // get out UFO and store it in wingman variable
      float wingmanDistance = UFOPos.dist(wingman.UFOPos); // check how far the UFO is from the active UFO
      if (wingmanDistance < cohereProximity) { // if it's less than the 5 times the UFO radius...
        midPos.add(wingman.UFOPos); // add my neighbour position to the average
        wingmanCount++; // add 1 to the neighbour count
      }
    }
    midPos.div(wingmanCount); // divide the total position value by the number of wingman
    PVector pull = PVector.sub(midPos, UFOPos); // pull towards the average point
    pull.normalize(); // normalise the pull
    pull.mult(cohereStrength); // scale down the pull
    UFOAcceleration.add(pull); // add the pull to UFO velocity
  }

  void UFOAlign() { // fly in the same direction

      PVector groupVel = new PVector(); // new PVector to calculate the group velocity
    int wingmanCount = 0; // variable to count how many wingman are close

    for (int UFOnumber=0; UFOnumber<UFOs.size(); UFOnumber++) { // check each UFO one at a time
      UFO wingman = (UFO) UFOs.get(UFOnumber); // get out UFO and store it in wingman variable
      float wingmanDistance = UFOPos.dist(wingman.UFOPos); // check how far the UFO is from the active UFO
      if (wingmanDistance < alignProximity) { // if it's less than the 2.5 times the UFO radius...
        groupVel.add(wingman.UFOPos); // add my neighbour position to the average
        wingmanCount++; // add 1 to the neighbour count
      }
    }
    groupVel.div(wingmanCount); // divide the total position value by the number of wingman
    PVector pull = PVector.sub(groupVel, UFOPos); // pull towards the average point
    pull.normalize(); // normalise the pull
    pull.mult(alignStrength); // scale down the pull
    UFOAcceleration.add(pull); // add the direction to the UFO velocity
  }

  void UFOCohereWayPoint() { // fly towards active waypoint
    PVector pull = PVector.sub(liveWayPoint, UFOPos); // pull towards the live way point
    pull.normalize(); // normalise the pull
    pull.mult(wayPointStrength); // scale down the pull
    UFOAcceleration.add(pull); // add the pull to UFO velocity
  }
}


