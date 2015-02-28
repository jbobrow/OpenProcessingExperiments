
// Pi Sectors 02
//
// Press 's' to switch between fill and stroke

int globalsize = 10;
int gd = 100/globalsize;
Quarter[] circles = new Quarter[int(sq(gd))];
boolean strokes = false;
color bgr = color(0);

void setup() {
  size(200, 200);
  background(bgr);
  ellipseMode(CENTER);

  for (int i = 0; i < gd; i++) {
    for (int u = 0; u < gd; u++) {
      circles[i+u*(gd)] = new Quarter( ((100+500%globalsize)/2)+ i*globalsize, ((100+500%globalsize)/2)+ u*globalsize);
    }
  }
}

void draw() {
  background(bgr);
  for (int i = 0; i < gd; i++) {
    for (int u = 0; u < gd; u++) {
      circles[i+u*(gd)].Show();
    }
  }
}

class Quarter {

  int x, y;
  boolean fade = false;
  float r, g, b, o=0, t;
  color c;
  int type;
  int oX, oY;

  Quarter(int p, int k) {
    oX = p; 
    oY = k;
    this.Reset();
  }

  void Reset() {
    r = random(255);
    g = random(255);
    b = random(255);
    fade = false;
    type = int(random(4));
    t = random(3, 6); 
    switch(type) {
    case 0:
      x=oX+globalsize; 
      y=oY+globalsize; 
      break; 
    case 1:
      x=oX; 
      y=oY+globalsize; 
      break; 
    case 2:
      x=oX+globalsize; 
      y=oY; 
      break;
    case 3:
      x=oX; 
      y=oY; 
      break;
    }
  }


  void Show() {
    if (strokes) { 
      stroke(255, 255, b, o); 
      noFill();
    } 
    else { 
      noStroke(); 
      fill(255, 255, b, o);
    }
    switch(type) {
    case 0:
      arc(x, y, globalsize*2, globalsize*2, PI, PI+HALF_PI); 
      break;
    case 1:
      arc(x, y, globalsize*2, globalsize*2, PI+HALF_PI, TWO_PI); 
      break;   
    case 2:
      arc(x, y, globalsize*2, globalsize*2, HALF_PI, PI); 
      break;  
    case 3:
      arc(x, y, globalsize*2, globalsize*2, 0, HALF_PI); 
      break;
    }
    if (!fade) { 
      o+=t;
    } 
    else { 
      o-=t;
    }
    if ( o >= 255 ) { 
      fade = true;
    }
    if ( o <= 0 ) { 
      this.Reset();
    }
  }
}

void keyPressed() {
  if (key == 's') { 
    strokes = !strokes;
  }
}



