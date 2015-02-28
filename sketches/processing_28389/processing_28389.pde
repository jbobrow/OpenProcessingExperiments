
PVector loc, v, a;
PVector[] whipTail;
int mostRecent, tailLength, radius;
float accMagnitude = .3; 
float bounceDampeningFactor = .8; //vel lost each wall collision
boolean loop;

void setup() {
  frameRate(30);
  size(800,600);
  ellipseMode(CENTER);
  smooth();
  colorMode(RGB,100);
  noStroke();

  tailLength = 120;
  radius = 20;
  whipTail = new PVector[tailLength];
  loc = new PVector(width/2,height/2);
  v = new PVector(0,0);
  a = new PVector(0,0);
  loop = true;

  for(int i = 0 ; i < whipTail.length ; i++) {
    whipTail[i] = loc;
  }
  mostRecent = 0;
}

void draw() {
  background(0);
  
  for(int i = 0, j = mostRecent + 1 ; i < whipTail.length ; i++, j++) {
    if ( j >= whipTail.length ) { //wrap around end of array
      j = 0;
    }

    int f = (int)((double)i/(whipTail.length-1) * 100); 
    fill( color(f,.5*f,.25*f) ); //cool orange
    PVector loc = whipTail[j];
    ellipse(loc.x,loc.y,radius*2*f/100,radius*2*f/100);
  }
  drawLegend();
  bounceCheck();
  updateAcceleration();
  advance();
}

void updateAcceleration() {
  
  /*
  //method uses center of screen as neutral acc location for mouse pointer
  //acc determined by x position
  float a_x = mouseX/(float)width * 2 * accMagnitude - accMagnitude;
  float a_y = mouseY/(float)height * 2 * accMagnitude - accMagnitude;
  a = new PVector(a_x, a_y);
  */
  
  //distance btwn comet (@ loc) and mouse pointer determines acc
  PVector loc = whipTail[mostRecent];
  a = new PVector( (mouseX - loc.x)/(float)width * accMagnitude, 
                   (mouseY - loc.y)/(float)height * accMagnitude);
}

void drawLegend() {
  String msg = "Click mouse to pause/resume";
  float vNice = (int)(10*frameRate*v.mag() + .05)/10.0;
  msg += "\n|v| = " + vNice + "px/sec";
  fill(100,0,0);
  textSize(16);
  text(msg,8,20);
}

void advance() {
  PVector currentLoc = new PVector(whipTail[mostRecent].x,whipTail[mostRecent].y);
  mostRecent++;
  if ( mostRecent >= whipTail.length ) { 
    mostRecent = 0;
  }
  v.add(a); //change vel
  currentLoc.add(v); //change position
  whipTail[mostRecent] = currentLoc;
}


void bounceCheck() {
  PVector loc = whipTail[mostRecent];

  //dragging the comet along a screen edge
  //can cause the comet to pass the edge in some
  //cases, so make sure to check each of these
  //conditions every time this method is called
  if ( loc.y + radius > height ) {  //bottom strike
    v.y = -1*bounceDampeningFactor*v.y;
  } 
  if ( loc.y < radius ) {  //top strike
    v.y = -1*bounceDampeningFactor*v.y;
  } 
  if ( loc.x < radius ) {  //left strike
    v.x = -1*bounceDampeningFactor*v.x;
  } 
  if ( loc.x + radius > width ) {  //right strike
    v.x = -1*bounceDampeningFactor*v.x;
  }
}  

void mousePressed() {
  //any click pauses or resumes comet's motion
  if ( loop ) { 
    noLoop(); 
  } else { 
    loop(); 
  }
  loop = ! loop;
}  


