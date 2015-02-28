
float superProb = 0.06;
int superLength_ms = 3000;
color normBumpColor = #FF0000;
color superBumpColor = #FFFFFF;

class Bumper {
  int lane;
  boolean player1; // true if belongs to player 1
  float ypos;
  float speed;
  boolean forward;
  boolean active;
  boolean superActive;
  int t_superActive; // millis() when super bump was activated
  float superTint; // between 0 and 1, starts at 1
  
  Bumper (int lane_, boolean player1_) {
    lane = lane_;
    player1 = player1_;
    
    ypos = 0.0;
    speed = 0.0;
    active = false;
    forward = true;
    superActive = false;
    t_superActive = 0;
    superTint = 1;
  }
  
  void update() {
    if (active && !superActive) {
      // update position
      ypos = ypos + speed;
      
      int playerDirection;
      if (player1) {
        playerDirection = 1;
      } else {
        playerDirection = -1;
      }
      
      // check for puck collision
      boolean collision;
      float ranNum = random(1);
      if (player1) {
        collision = ypos >= pucks[lane].ypos - laneWidth/2;
      } else {
        collision = ypos <= pucks[lane].ypos + laneWidth/2;
      }
      if (collision && forward && ranNum <= superProb) {
        // initiate super bump
        superActive = true;
        t_superActive = millis();
        superTint = 1;
        superSound.trigger();
        pucks[lane].charging = true;
        
      } else if (collision && forward) {
        // normal bump
        pucks[lane].bump(player1);
        speed = -playerDirection * bumpSpeed;
        forward = false;
        
      } else {
      
        // check if weve reached extension limit
        if ((player1 && ypos >= goalTop + bumpLength) || (!player1 && ypos <= goalBot - bumpLength)) {
          speed = -playerDirection * bumpRetSpeed;
          forward = false;
        }
        
        // check if we've returned to home
        if ((player1 && ypos < goalTop) || (!player1 && ypos > goalBot)) {
          active = false;
          speed = 0.0;
        }
        
      }
           
    } // end if (active)
    
    if (superActive) {
      superBumpUpdate();
    }
    
  }
  
  void bump() {
    if (!active) {
      active = true;
      forward = true;
      if (player1) {
        speed = bumpSpeed;
        ypos = goalTop;
      } else {
        speed = -bumpSpeed;
        ypos = goalBot;
      }
      bumpSound.trigger();
    }
  }
  
  void superBumpUpdate() {
    if (millis() - t_superActive >= superLength_ms) {
      // release!
      blastSound.trigger();
      int playerDirection;
      if (player1) {
        playerDirection = 1;
      } else {
        playerDirection = -1;
      }
      superActive = false;
      pucks[lane].charging = false;
      pucks[lane].bump(player1);
      pucks[lane].speed = pucks[lane].direction * puckSpeedMax;
      speed = -playerDirection * bumpSpeed;
      forward = false;
        
    } else {
      // charging up
      float phase = (millis() - float(t_superActive))/float(superLength_ms);
      superTint = sin(2*PI*7*phase*phase*phase);
    }
  }
  
  void drawBumper() {
    if (active) {
        
      float bumpHeight, bumpMid;
      if (player1) {
        bumpHeight = ypos - goalTop-4;
        bumpMid = (ypos + goalTop+4)/2;
      } else {
        bumpHeight = goalBot-3 - ypos;
        bumpMid = (ypos + goalBot-3)/2;
      }
      
      noStroke();
      if (forward) {
        if (superActive) {
          fill(avgColor(normBumpColor,superBumpColor,superTint));
        } else {
          fill(normBumpColor);
        }
      } else {
        fill(#FFB8A0);
      }
      rectMode(CENTER);
      
      rect(lanePos[lane], bumpMid, laneWidth, bumpHeight);
      
    }
  }
  
}

