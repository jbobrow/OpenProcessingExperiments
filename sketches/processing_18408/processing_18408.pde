

// records position and information on individual bomb

class Bomb {


  PVector loc;    // Position in space
  PVector vel;    // Velocity vector
  int hits;       // Number of times contacted


  Bomb( PVector _loc, PVector _vel ) {

    loc       = _loc;
    vel       = _vel;
    hits      = 0;
  }

  // checks to see if city is hit
  void cityhit(float hitpos) {
    
    strokeWeight(5);
    stroke(255,255,0);
    fill(255,0,0);
    ellipse(hitpos, height - 30, 80, 40);
    hitsound.trigger();
    for(int i = 0; i < cityArray.length; i++) {
      if(hitpos >= cityArray[i].left && hitpos <= cityArray[i].right) {
        cityArray[i].hits++;
      }
    }
  }

  // bomb explosion
  void explode(int _bombindex) {

    strokeWeight(5);
    stroke(255,255,0);
    fill(255,0,0);
    ellipse(loc.x, loc.y, 80, 80);
    scoresound.trigger();
    bombs.removeBomb(_bombindex);
  }

  // updates vectors and redraws
  boolean update(int bombindex) {

    vel.add( gravity );

    int nearCol = int(loc.x / (scrW-1));
    int nearRow = int(loc.y / (scrH-1));

    // if at edges set back
    if (nearCol > NCOLS - 2) {
      nearCol = NCOLS - 2;
    } 
    if (nearRow > NROWS - 2) {
      nearRow = NROWS - 2;
    }

    PVector newVelPoint = new PVector(0,0); // initialize vector

    // iterate through vectors in neighborhood and aggregate
    int changeX, changeY;
    for (int j = -1; j < 2; j++) {
      for (int q = -1; q < 2; q++) {
        if(nearRow + j < 0) {
          changeY = 0;
        }
        else {
          changeY = nearRow + j;
          if(changeY > NROWS - 2) {
            changeY = NROWS - 2;
          }
        }
        if(nearCol + q < 0) {
          changeX = 0;
        }
        else {
          changeX = nearCol + q;
          if(changeX > NCOLS - 2) {
            changeX = NCOLS - 2;
          }
        }
        PVector tempPoint = vecArray[changeY][changeX];
        newVelPoint.x += tempPoint.x;
        newVelPoint.y += tempPoint.y;
      }
    }

    newVelPoint.x = -( newVelPoint.x / 9);
    newVelPoint.y = -(newVelPoint.y / 9);

    // if contact with OF vector, record hit
    if (newVelPoint.mag() != 0.0) {
      hits++;  
    }
    
    // check for explosion
    if (hits > hitcount) {
      score++;
      explode(bombindex);
      return false;
    }

    vel.add(newVelPoint);

    loc.add(vel);

    // edge collision detection
    float lastVel=0;

    if ( loc.x < 8.0 ) {
      loc.x = 8.0;
      vel.x = -(vel.x * .75);
    }
    if ( loc.x > (width - 9) ) {
      loc.x = (width - 9);
      vel.x = -(vel.x * .75);
    }
    if ( loc.y > (height - 9) ) {
      cityhit(loc.x);
      missed++;
      bombs.removeBomb(bombindex);
      return false;
    }


    // other bomb collision detection
    for (int i = 0; i < bombs.returnSize(); i++) {
      if (i != bombindex) {
        PVector tempbomb = bombs.getBombLoc(i);
        if (abs(loc.x - tempbomb.x) < 8.0 && abs(loc.y - tempbomb.y) < 8.0) {
          if(i > bombindex) {
            bombs.removeBomb(i);
            explode(bombindex);
            score++;
            return false;
          }
          else {
            explode(bombindex);
            bombs.removeBomb(i);
            return false;
          }
        }
      }
    }
    
    // draw bomb
    if (loc.y > 8) {
      noStroke();
      fill(255, 255, map(hits, hitcount, 0, 0, 255));
      if (hits % 2 == 0) {
        ellipse( loc.x, loc.y, 16, 8);
      }
      else {
        ellipse( loc.x, loc.y, 8, 16);
      }
    }
    else {
      noFill();
      stroke(255, 255, map(hits, hitcount, 0, 0, 255));
      strokeWeight(2);
      line(loc.x, 0, loc.x, 8);
      line(loc.x, 8, loc.x-4, 4);
      line(loc.x, 8, loc.x+4, 4);
      strokeWeight(1);
    } 

    return true;
  }
}


