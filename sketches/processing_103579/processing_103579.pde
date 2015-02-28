
// Jefferson Lam
// November 2012

// ball variables
float X, Y, Xspeed, Yspeed, d, r;
// environment variables
float gravity, stopSpeed, dissipation, friction, airResist, airStopSpeed;
//portal variables
float xorng, yorng, xbl, ybl, xorngGhost, yorngGhost, xblGhost, yblGhost;
boolean orngToggle, blToggle, orngPortal, blPortal, orngPossible, blPossible, orngDraw, blDraw, orangeToBlue, blueToOrange;

void setup() {
  size(1000, 500);
  smooth();
  noCursor();
  // initialize ball variables
  d = 100;
  r = d/2;
  X = width/2.5;
  Y = height/1.5;
  Xspeed = -1.5;
  Yspeed = 0.8;

  // initialize environment variables
  gravity = 0.6;
  stopSpeed = 0.0;
  dissipation = 0.2;
  friction = 0.96;
  airResist = 0.0004;
  airStopSpeed = 0.0001;

  // initialize portal variables
  orngDraw = true;
  blDraw = true;
  orangeToBlue = false;
  blueToOrange = false;
  xorng = width/4;
  yorng = height;
  xbl = width/1.3;
  ybl = 0;
}

void draw() {
  background(255, 255, 255);
  displayBall();
  portalCheck();
  portalGhost();
  drawPortals();
  mouseOverlay();
  ballPortal();
  if (mousePressed && mouseOnBall() && orngToggle == false && blToggle == false) {
    holdBall();
  }
  else {
    moveBall();
    updateSpeed();
  }
//  debugger();
}

void keyPressed() {
  if (key == 'z') {
    orngToggle = !orngToggle;
    blToggle = false;
  } 
  else if (key == 'x') {
    blToggle = !blToggle;
    orngToggle = false;
  }
}

void mousePressed() {
  portalLocation();
}

boolean mouseOnBall() {
  if ( dist(X,Y,mouseX,mouseY)<50 ) {
    return true;
  } else {
    return false;
  }
}

boolean ballNearPortal() {
  if (dist(X,Y,xorng,yorng)<80 || dist(X,Y,xbl,ybl)<80) {
    return true;
  } else {
    return false;
  }
}

boolean ballNearOrange() {
  if (ballNearPortal() && dist(X,Y,xorng,yorng)<80) {
    return true;
  } else {
    return false;
  }
}

boolean ballNearBlue() {
  if (ballNearPortal() && dist(X,Y,xbl,ybl)<80) {
    return true;
  } else {
    return false;
  }
}


//draw the ball and constrain coordinates within window
void displayBall() {
  if ( ballNearPortal()==false ) {
    Y = constrain(Y, r, height-r);
//    print("constrained" + " ");
  } else {
//    print("not cnstrnd" + " ");
  }
  //X = constrain(X, r, width-r);
  ellipseMode(CENTER);
  //noStroke();
  stroke(0);
  strokeWeight(8);
  fill(255, 0, 0);
  ellipse(X, Y, d, d);
}



//have ball follow cursor and change 
//the ball's speed according to cursor speed
void holdBall() {
    X = mouseX;
    Y = mouseY;
    Yspeed = mouseY - pmouseY;
    Xspeed = mouseX - pmouseX;
}



//move the ball's X and Y coordinates according
//to the (changing) speed
void moveBall() {
  Y += Yspeed;
  X += Xspeed;
}

//gotta work out how the hell i'm gonna get these portals to actually transport the ball properly
//BUG: ball will sometimes bounce right out of the portal rather than teleporting to other portal
void ballPortal() {
  //orange on ground, blue on ceiling
  //ball goes through orange
  if (ballNearOrange() && yorng==height && ybl==0 && Y>height+50 && blueToOrange==false) { 
    X = xbl;
    Y = ybl;
    orangeToBlue = true;
    blueToOrange = false;
  } 
  //blue on ground, orange on ceiling
  //ball goes through blue
  if (ballNearBlue() && ybl==height && yorng==0 && Y>height+50 && orangeToBlue==false) {
    X = xorng;
    Y = yorng;
    blueToOrange = true;
    orangeToBlue = false;
  }
  //orange and blue both on ground
  //BUG: need to prevent ball from speeding up on each pass
    if (ballNearOrange() && yorng==height && ybl==height && Y>height+50 && blueToOrange==false) { 
    X = xbl;
    Y = ybl;
    Yspeed *= -0.82;
    orangeToBlue = true;
    blueToOrange = false;
  }
  if (ballNearBlue() && ybl==height && yorng==height && Y>height+50 && orangeToBlue==false) {
    X = xorng;
    Y = yorng;
    Yspeed *= -0.82;
    blueToOrange = true;
    orangeToBlue = false;
  }
  
  orangeToBlue = false;
  blueToOrange = false;
  //println("orangeToBlue = " + orangeToBlue + "   blueToOrange = " + blueToOrange);
}

//change the ball's speed according to gravity,
// walls, and friction
void updateSpeed() {
  //Y walls
  if ( abs(Yspeed)<stopSpeed ) {
    Yspeed = 0.0;
  } else if ( (Y>height-r || Y<r) && ballNearPortal()==false ) {
    Yspeed *= -(1-dissipation);
    Xspeed *= friction;
  }

  // X walls
  //  if ( abs(Xspeed) < stopSpeed ) {
  //   Xspeed = 0.0; 
  //  } else if (X > width-r || X < r) {
  //   Xspeed *= -(1-dissipation);
  //  }

  //make X-plane continuous
  if ( X>width+r ) X = -r;
  if ( X<-r ) X = width+r;

  Yspeed += gravity;
  //teleport between portals
  
  
  //air resistance
  if ( Yspeed > airStopSpeed) {
    Yspeed -= airResist;
  } else if ( Yspeed < -airStopSpeed) {
    Yspeed += airResist;
  } 

  if ( Xspeed > airStopSpeed) {
    Xspeed -= airResist;
  } else if ( Xspeed < -airStopSpeed) {
    Xspeed += airResist;
  } 

  if ( abs(Xspeed) < airStopSpeed && abs(Yspeed) < airStopSpeed) {
    Xspeed = 0;
    Yspeed = 0;
  }
  
  Yspeed = constrain(Yspeed, -40, 40);
}

//in draw()
//draw UI next to cursor
void mouseOverlay() {
  strokeWeight(1);
  stroke(0);
  line(mouseX-2, mouseY, mouseX+2, mouseY);
  line(mouseX, mouseY-2, mouseX, mouseY+2);
  
  if (orngToggle == true) {
    strokeWeight(3);
    stroke(255, 125, 0, 175); 
    fill(255, 125, 0, 175);
    ellipse(mouseX-15, mouseY, 8, 16);
  } else {
    strokeWeight(3);
    stroke(255, 125, 0, 175);
    fill(255, 255, 255, 175);
    ellipse(mouseX-15, mouseY, 8, 16);
  }
  if (blToggle == true) {
    strokeWeight(3);
    stroke(0, 0, 255, 175); 
    fill(0, 0, 255, 175);
    ellipse(mouseX+15, mouseY, 8, 16);
  } else {
    strokeWeight(3);
    stroke(0, 0, 255, 175);
    fill(255, 255, 255, 175);
    ellipse(mouseX+15, mouseY, 8, 16);
  }
}



//in draw()
//constantly determines whether or not the cursor is close to another portal based on if portal's (top || bottom) and x-location
void portalCheck() {
  if ( (ybl==0 && mouseTop() && mouseX>xbl-160 && mouseX<xbl+160) || (ybl==height && mouseBottom() && mouseX>xbl-160 && mouseX<xbl+160) ) {
    orngPossible = false;
  } else if (mouseBottom() || mouseTop() ) {
    orngPossible = true;
  } else {
    orngPossible = false;
  }
  
  if ( (yorng==0 && mouseTop() && mouseX>xorng-160 && mouseX<xorng+160) || (yorng==height && mouseBottom() && mouseX>xorng-160 && mouseX<xorng+160) ) {
    blPossible = false;
  } else if (mouseBottom() || mouseTop() ) {
    blPossible = true; 
  } else {
    blPossible = false;
  }
}



//in mousePress()
//sets the X and Y location of blue or orange portal on mousepress
void portalLocation() {
  if (orngToggle==true && orngPossible==true) {
    if ( mouseBottom() ) {
      yorng = height;
    } else if ( mouseTop() ) {
      yorng = 0;
    }
  xorng = mouseX;
  }
  xorng = constrain(xorng, 80, width-80);
  orngDraw = true; //boolean is only activated once per click and allows portal to be drawn
  
  if (blToggle==true && blPossible==true) {
    if ( mouseBottom() ) {
      ybl = height;
    } else if ( mouseTop() ) {
      ybl = 0;
    }
  xbl = mouseX;
  }
  xbl = constrain(xbl, 80, width-80);
  blDraw = true; //boolean is only activated once per click and allows portal to be drawn
}



//in draw()
//ghost to show where portal will be placed
void portalGhost() {
  if (orngToggle==true && orngPossible==true && (mouseBottom() || mouseTop())) {
    if( mouseBottom() ) {
      yorngGhost=height;
    } else if ( mouseTop() ) {
      yorngGhost=0;
    }
    xorngGhost=mouseX;
    rectMode(CENTER);     
    noStroke();
    fill(255, 125, 0, 100);
    rect(xorngGhost, yorngGhost, 160, 15);
  }
  
  if (blToggle==true && blPossible==true && (mouseBottom() || mouseTop())) {
    if( mouseBottom() ) {
      yblGhost=height;
    } else if ( mouseTop() ) {
      yblGhost=0;
    }
    xblGhost=mouseX;
    rectMode(CENTER);     
    noStroke();
    fill(0, 0, 255, 100);
    rect(xblGhost, yblGhost, 160, 15);
  }
}



boolean mouseTop() {
  if (mouseY<100) {
    return true;
  } else {
    return false;
  }
}
boolean mouseBottom() {
  if (mouseY>height-100) {
    return true;
  } else {
    return false;
  }
} 



//this is in draw()
//draws the portal according to where the mouse is clicked
void drawPortals() {
  if (orngDraw==true) {
    rectMode(CENTER);     
    noStroke();
    fill(255, 125, 0);
    rect(xorng, yorng, 160, 15);
  }
  if (blDraw == true) {
    rectMode(CENTER);     
    noStroke();
    fill(0, 0, 255);
    rect(xbl, ybl, 160, 15);
  }
}
