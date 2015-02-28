
//position, acceleration, & velocity:
PVector position, acc, vel;
int radius = 20;
boolean loop = true;

void setup() {
  frameRate(30); //call draw this many times per sec
  size(600,500);
  smooth();

  //circle's position at all times
  position = new PVector((int)(.3*width),30);
  //position.x is the x coordinate, position.y is y coordinate

  //starting velocity is 4px/frame in the +x direction
  //and zero in the y direction
  vel = new PVector(4,0);

  //accleration is 0 in x direction and .2px/frame^2 in +y dir (down)
  acc = new PVector(0,.2);
}

void draw() {
  background(0);
  noStroke();
  fill(0,255,0); //grn

  //draw circle @ current location
  ellipseMode(CENTER); //placement of ellipse based on center pt
  ellipse(position.x, position.y, 2*radius, 2*radius);

  //update the velocity by increasing v_x and v_y by 
  //a_x and a_y, respectively
  vel.add(acc);

  //use this increased velocity to update the position for the
  //next time we draw the circle
  position.add(vel);

  //if position indicates we've hit bottom, 
  //change v_y to be upward (neg y-axis)
  if ( position.y + radius >= height ) {
    vel.y = -vel.y;
  }

  //if we hit right wall, send v_x back to left
  if ( position.x + radius >= width ) {
    vel.x = -vel.x;
  }

  //if we hit left wall, send v_x back to right
  if ( position.x - radius <= 0 ) {
    vel.x = -vel.x;
  }

  textSize(12);
  fill(255,0,255);
  String legend = "";
  legend += "position: (" + position.x + ", " + position.y + ")";
  legend += "\n\nv_horiz = " + vel.x;
  legend += "\nv_vert = " + vel.y;
  legend += "\n\na_horiz = " + acc.x;
  legend += "\na_vert = " + acc.y;
  text(legend,15,height-130);
}

void mousePressed() {
  if ( loop ) { 
    noLoop(); 
    loop = false;
  } 
  else {
    loop();
    loop = true;
  }
}


