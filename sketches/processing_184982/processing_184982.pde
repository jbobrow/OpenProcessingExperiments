
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/112388*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

Skin bubble;
Mug mug;
boolean visible, mouseMoving;

void setup() {
  size(1000, 700);
  visible = true;
  mouseMoving = true;
  bubble = new Skin();
  mug = new Mug();
}

void draw() {
  background(#466D8E);
  stroke(0);
  line(0, 634, width, 634);
  bubble.display();
  mug.move();
  fill(255);
  textSize(20);
  text("Press ' v ' key to toggle the vector display.", 10, height-5);
  mouseMoving = false;
}

void mouseMoved() {
  mouseMoving = true;
}
void keyPressed() {
  if (key == 'v') visible = !visible;
}

class Fluid {
  float x, y, m, k, comp, pressure;
  PVector f, fPress, v;
  Fluid prev;
  Fluid next;

  Fluid(float xin, float yin) {
    x      = xin; // the vertices'
    y      = yin; // positions
    // vars for movement behaviour
    f      = new PVector(0, 0); 
    fPress = new PVector(0, 0);
    v      = new PVector(0, 0);
    k      = 3;     
    m      = 30;   
    comp   = .1;
    pressure =  40;
  }


  void update(PVector center, PVector vel) {
    f.set(0, 0);
    if (prev != null) {
      f.x += k*(prev.x-x);
      f.y += k*(prev.y-y);
    }
    if (next != null) {
      f.x += k*(next.x-x);
      f.y += k*(next.y-y);
    }
    // include response to mouse movement
    vel.mult(.8); // but not too much
    fPress.x = (x - center.x+vel.x);
    fPress.y = (y - center.y+vel.y);

    fPress.normalize();
    fPress.mult(pressure);

    v.x += (f.x+comp*fPress.x)/m;
    v.y += (f.y+comp*fPress.y)/m;

    v.mult(.9 );

    x += v.x;
    y += v.y;
  }

  void vectorDraw() {
    stroke(0);
    fill(255, 0, 0);
    ellipse(x, y, 10, 10);
    stroke(0, 0, 255);
    line(x, y, x+5*f.x, y+5*f.y);
    stroke(0, 255, 0);
    line(x, y, x+comp*5*fPress.x, y+comp*5*fPress.y);
  }
}


class Skin {
  int numVerts ;
  Fluid[] fluid;
  PVector center, vel;
  float  ang, rad, x, y, yPos;

  Skin() {
    x = width/2.0 ;
    y = height/2.0;
    numVerts = 40;
    center = new PVector();
    vel = new PVector();
    rad = 60;
    ang = radians(178);  // 178 in JavaScript Mode.  JavaMode 188  why???

    // set starting vertices
    fluid = new Fluid[numVerts];
    for (int i = 0; i < numVerts; i++) {
      ang += radians(180/numVerts);
      fluid[i] = new Fluid(x-rad*cos(ang), y+rad*sin(ang));
    }
    // collect adjacent vertices
    for (int i=0; i<numVerts-1; i++) {
      fluid[i].next = fluid[i+1];
    }
    for (int i=1; i<numVerts; i++) {
      fluid[i].prev = fluid[i-1];
    }
  }  

  void display() { // move and draw
  
    yPos = mouseY ; // in JavaScript mode
    if (yPos > 508) yPos = 508; // table top
    
   // yPos = mouseY +10 ; // in Java mode
   // if (yPos > 518) yPos = 518; // table top
    
    pushMatrix();
    translate(mouseX-x, yPos-y);
    
    if (mouseMoving)vel.set(mouseX-x, yPos-y);
    else vel.set(0, 0); // no effect when mouse stops
   
    fill(255, 0, 0);
    stroke(255);
    strokeWeight(2);
    beginShape();
    for (int i=0; i<numVerts; i++) {
      vertex(fluid[i].x, fluid[i].y);
    }
    endShape();
    
    for (int i=0; i<numVerts; i++) {
      if (visible)fluid[i].vectorDraw();
    }
    popMatrix();

    // calc new center and pass to 
    // fluid update() along with velocity vector
    updateCenter();
    for (int i=1; i<numVerts-1; i++) {
      fluid[i].update(center, vel);
    }
  }

  // average  the vertex positions
  void updateCenter() {
    center.set(0, 0);
    for (int i=0; i<numVerts; i++) {
      center.x += fluid[i].x;
      center.y += fluid[i].y;
    }
    center.x /= numVerts;
    center.y /= numVerts;
  }
}

class Mug {
  int x, y;
  void move() {
    x = mouseX-55;
    y = mouseY;
    if (y > 508) y = 508; // table top
    stroke(0);
    strokeWeight(15);
    noFill();
    ellipse(x+120, y+65, 40, 60);
    fill(204);
    strokeWeight(5);
    rect(x, y, 110, 125, 10);
    fill(0);
    rect(x+30, y + 35, 50, 55, 10);
    stroke(255);
    arc(x+55, y+57, 20, 20, radians(-90), radians(90));
    noStroke();
    fill(255);
    rect(x+45, y+45, 5, 40);
    rect(x+42, y+80, 11, 5);
    rect(x+45, y+65, 10, 5);
    rect(x+42, y+45, 13, 5);
  }
}


