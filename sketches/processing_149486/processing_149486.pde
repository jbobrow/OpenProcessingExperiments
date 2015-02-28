
int hp = 450;
int moonhp = 270;
boolean startGame = false;
PVector moonLoc = new PVector(300, 50);
PVector lunatic1Loc = new PVector(-100, 280);
PVector lunatic2Loc = new PVector(650, 280);
PVector lunatic3Loc = new PVector(-200, 280);
PVector lunatic4Loc = new PVector(650, 280);
PVector center = new PVector(170, 250);
PVector center2 = new PVector(200, 260);
PVector center3 = new PVector(160, 260);
PVector center4 = new PVector(350, 260);
int L1hp = 10;
int L2hp = 20;
int L3hp = 20;
int L4hp = 3;
int L1att = 50;
int L2att = 75;
int L3att = 300;
int L4att = 300;
boolean L1Alive = true;
boolean L2Alive = true;
boolean L3Alive = true;
boolean L4Alive = true;
float radius = 35;
float headbox = 52.5;
PFont f;
PImage lunatic1;
PImage lunatic2;
PImage lunatic3;
PImage lunatic4;
PImage ihatemondays;
float timer = 35.0;
float time = 0.0;
final float MAX_TIME = 35.0;
float oneFourth = MAX_TIME*.25;
float twoFourth = MAX_TIME*.5;
float threeFourth = MAX_TIME*.75;
boolean s1p = false;
boolean s2p = false;
boolean s3p = false;
boolean s4p = false;
void setup() {  
  lunatic1 = loadImage("http://i1054.photobucket.com/albums/s492/cmaung09/apcsprite1_zps4673ec57.png");
  lunatic2 = loadImage("http://i1054.photobucket.com/albums/s492/cmaung09/apcsprite2_zpscf827a76.png");
  lunatic3 = loadImage("http://i1054.photobucket.com/albums/s492/cmaung09/apcsprite3_zpsd69bf80a.png");
  lunatic4 = loadImage("http://i1054.photobucket.com/albums/s492/cmaung09/apcsprite4_zpsd8a73c6d.png");
  ihatemondays = loadImage("http://i1054.photobucket.com/albums/s492/cmaung09/UNOFFICIALapcsprite_zps4449a7e6.png");
  size(600, 500);
  background(15);
  fill(255, 10, 0);
  stroke(2);
  ellipse(moonLoc.x, moonLoc.y, radius*2, radius*2);
  noCursor();
  f = createFont("Impact", 18, true);
  textFont(f);
  fill(225);
  int hpline = hp-150;
  stroke(0, 100, 0);
  line(150, 450, hpline, 450);
 
}

void draw() {
  //redraw moon--------------------------

  if (startGame == false) {
  titleScreen();
  }
 else {
int hpline = hp-150;
  background(15);
  fill(255, 10, 0);
  stroke(2);
  ellipse(300, 50, 70, 70);
  fill(200);
  if (hp > 0) {
    strokeWeight(3);
    stroke(0, 100, 0);
    line(150, 450, hp, 450);
  }
  else if (hp <= 0) {
    stroke (15);
    line(150, 450, hp, 450);
  }
  else if (hp < 10) {
  strokeWeight(3);
    stroke(100, 0, 0);
    line(150, 450, hp, 450);
  }

  //-------------------------------------
  //scope---------------------------------
  stroke(0);
  ellipse(mouseX, mouseY, 60, 60);
  fill(20);
  ellipse(mouseX, mouseY, 50, 50);
  stroke(0);
  line(mouseX, mouseY-60, mouseX, mouseY+60);
  line(mouseX+60, mouseY, mouseX-60, mouseY);
  smooth();

  //--------------------------------------
  //HP-----------------------------
  strokeWeight(4);
  stroke(0, 100, 0);
  if (timer<10) {
    strokeWeight(4);
    stroke(100, 0, 0);
  }
  //--------------------------------------
  //HP of loons---------------------------
  if (L1hp == 0) {
    L1Alive = false;
  }
  if (L2hp == 0) {
    L2Alive = false;
  }
  if (L3hp == 0) {
    L3Alive = false;
  }
  if (L4hp == 0) {
    L4Alive = false;
  }
  //-------------------------------------
  //timer--------------------------------

  time += 0.01;
  float endOfPhaseOne = oneFourth;
  float endOfPhaseTwo = twoFourth;
  float endOfPhaseThree = threeFourth;
  float endOfPhaseFour = MAX_TIME;
 
  if (time<= endOfPhaseOne) {
    if ( L1Alive == true) {
      image(lunatic1, lunatic1Loc.x, lunatic1Loc.y);
      if (lunatic1Loc.x != center.x) {
        image(lunatic1, lunatic1Loc.x+=2, lunatic1Loc.y);
      }
      if (lunatic1Loc.x == center.x) {
        if (s1p == false) {
          s1p = true;
          hp-=L1att;
        }
      }
    }
  }

  if (time >= endOfPhaseOne && time < endOfPhaseTwo) {
    if ( L2Alive == true ) {
      if (lunatic2Loc.x != center2.x) {
        image(lunatic2, lunatic2Loc.x-=2, lunatic2Loc.y);
      }
      if (lunatic2Loc.x == center2.x) {
        image(lunatic2, lunatic2Loc.x, lunatic2Loc.y);
        if (s2p == false) {
          s2p = true;
          hp-=L2att;
        }
      }
    }
    if (L1Alive == true) {
      if (lunatic1Loc.x != center.x) {
        image(lunatic1, lunatic1Loc.x+=2, lunatic1Loc.y);
      }
      if (lunatic1Loc.x == center.x) {
        image(lunatic1, lunatic1Loc.x, lunatic1Loc.y);
        if (s1p == true) {
          s1p = false;
          hp-=L1att;
        }
      }
    }
  }

  if (time >= endOfPhaseTwo && time < endOfPhaseThree) {

    if (L3Alive == true) {
      if (lunatic3Loc.x != center3.x) {
        image(lunatic3, lunatic3Loc.x+=1, lunatic3Loc.y);
      }
      if (lunatic3Loc.x == center3.x) {
        image(lunatic3, lunatic3Loc.x, lunatic3Loc.y);
        if (s3p == false) {
          s3p = true;
          hp-=L3att;
        }
      }
    }
    if ( L2Alive == true ) {
      if (lunatic2Loc.x != center2.x) {
        image(lunatic2, lunatic2Loc.x+=2, lunatic2Loc.y);
      }
      if (lunatic2Loc.x == center2.x) {
        image(lunatic2, lunatic2Loc.x, lunatic2Loc.y);
        if (s2p == false) {
          s2p = true;
          hp-=L2att;
        }
      }
    }
    if (L1Alive == true) {
      if (lunatic1Loc.x != center.x) {
        image(lunatic1, lunatic1Loc.x+=2, lunatic1Loc.y);
      }
      if (lunatic1Loc.x == center.x) {
        image(lunatic1, lunatic1Loc.x, lunatic1Loc.y);
        if (s1p == false) {
          s1p = true;
          hp-=L1att;
        }
      }
    }
  }


  if ( time >= endOfPhaseThree && time < endOfPhaseFour) {
    if ( L4Alive == true) {
      if (lunatic4Loc.x != center4.x) {
        image(lunatic4, lunatic4Loc.x-=4, lunatic4Loc.y);
      }
      if (lunatic4Loc.x == center4.x) {
        image(lunatic4, lunatic4Loc.x, lunatic4Loc.y);
        if (s4p == false) {
          s4p = true;
          hp-=L4att;
        }
      }
    }
    if ( L3Alive == true ) {
      if (lunatic3Loc.x != center3.x) {
        image(lunatic3, lunatic3Loc.x+=1, lunatic3Loc.y);
      }
      if (lunatic3Loc.x == center3.x) {
        image(lunatic3, lunatic3Loc.x, lunatic3Loc.y);
        if (s3p == false) {
          s3p = true;
          hp-=L3att;
        }
      }
    }
    if (L2Alive == true ) {
      if (lunatic2Loc.x != center2.x) {
        image(lunatic2, lunatic2Loc.x+=2, lunatic2Loc.y);
      }
      if (lunatic2Loc.x == center2.x) {
        image(lunatic2, lunatic2Loc.x, lunatic2Loc.y);
        if (s2p == false) {
          s2p = true;
          hp-=L2att;
        }
      }
    }

    if (L1Alive == true) {
      if (lunatic1Loc.x != center.x) {
        image(lunatic1, lunatic1Loc.x+=2, lunatic1Loc.y);
      }
      if (lunatic1Loc.x == center.x) {
        image(lunatic1, lunatic1Loc.x, lunatic1Loc.y);
        if (s1p == false) {
          s1p = true;
          hp-=L1att;
        }
      }
    }
  }



  timer -= 0.01;
  if (timer < 0) {
    timer = 0;
  }
  textFont(f);
  fill(225);
  if (timer < 10 ) {
    fill(225, 0, 0);
  }
  text((int)timer, 570, 20);

  if (hp > 0) {
    strokeWeight(3);
    stroke(0, 100, 0);
    line(150, 450, hp, 450);
  }
  else if (hp <= 0) {
    stroke (15);
    line(150, 450, hp, 450);
  }
  else if (timer < 10) {
      strokeWeight(3);
    stroke(100, 0, 0);
    line(150, 450, hp, 450);
  }
    stroke(0);
  ellipse(mouseX, mouseY, 60, 60);
  fill(20);
  ellipse(mouseX, mouseY, 50, 50);
  stroke(0);
  line(mouseX, mouseY-60, mouseX, mouseY+60);
  line(mouseX+60, mouseY, mouseX-60, mouseY);
  smooth();

  //--------------------------------------
  //Outcomes-------------------------------

  if (Math.abs(time-MAX_TIME) <.1  || hp <= 150) {
    println("hp:"+ hp);
    background(180, 0, 0);
    textFont(f, 43);
    text("GAME OVER", 180, 200);
    noLoop();
  }
  else if 
    (moonhp <= 0) {
    fill(255);
    ellipse(moonLoc.x, moonLoc.y, radius*2, radius*2);
    fill(255);
    textFont(f, 43);
    text("You Win!", 180, 200);
    noLoop();
  }
 }
  //----------------------------------------
}

//methods
boolean clickOnMoon(PVector loc) {
  PVector clickLoc = new PVector(mouseX, mouseY);
  if ( clickLoc.dist(loc) <= radius ) {
    return true;
  }
  return false;
}
boolean clickOnEnemy(PVector loc) {
  PVector click1Loc = new PVector(mouseX, mouseY);
  if (click1Loc.dist(loc) <= headbox) {
    return true;
  }
  return false;
}

void mouseClicked() {
  if (clickOnMoon(moonLoc) == true) {
    moonhp--;
  }
  else if
    ( L1hp >= 0 && clickOnEnemy( getL1headLoc()) ) {
    L1hp--;
  }
  else if
    ( L2hp >= 0 && clickOnEnemy( getL2headLoc()) == true) {
    L2hp--;
  }
  else if
    ( L3hp >= 0 && clickOnEnemy( getL3headLoc() ) == true) {
    L3hp--;
  }
  else if
    ( L4hp >= 0 && clickOnEnemy( getL4headLoc() ) == true) {
    L4hp--;
  }
  else {
    fill(200);
    ellipse(mouseX, mouseY, 50, 50);
  }
}
PVector getL1headLoc() {
  return new PVector( lunatic1Loc.x+120, 360 );
}
PVector getL2headLoc() {
  return new PVector ( lunatic2Loc.x+76, 360 );
}
PVector getL3headLoc() {
  return new PVector ( lunatic3Loc.x+143, 360 );
}
PVector getL4headLoc() {
  return new PVector ( lunatic4Loc.x+90, 360 );
}
void titleScreen(){
background(20);
  textFont(f);
  fill(225);
  text( "SHOOT THE ", 90,90);
  ellipse (250, 80, 75,75);
  text( " <- WATCH OUT FOR ->", 150, 400);
  text( "ONLY ATTACK THE HEAD" , 300, 300);
  textFont(f, 40);
  text ("CLICK TO BEGIN", 140, 450);
  image(ihatemondays, lunatic2Loc.x-=1, lunatic2Loc.y);
 if (mousePressed == true) {
startGame = true;
 } 
}




