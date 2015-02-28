
float SPHERE_RADIUS_OUTER;
int numOfOrbs = 200;
Orb[] orbs = new Orb[numOfOrbs];
float angleX;
float angleY;
boolean showGrid = true;
boolean showPoints = true;
float z;
float angleSpeed = 0.1;


void setup() {
  size(600, 400, P3D);
  SPHERE_RADIUS_OUTER = 200;
  for (int i = 0;i<numOfOrbs;i++) {
    orbs[i] = new Orb(random(SPHERE_RADIUS_OUTER*2), random(SPHERE_RADIUS_OUTER*2), SPHERE_RADIUS_OUTER, width/2, height/2);
  }
  z = -100;
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2, z);
  rotateY(angleY);
  // rotateX(angleX);
  fill(0);
  noStroke();
  sphere(190);
  for (int i = 0;i<orbs.length;i++) {
    stroke(255);
    if (showPoints) {
      orbs[i].display();
    }
    if (showGrid) {
      for (int j = 0;j<orbs.length;j++) {
        if (dist(orbs[i].pX, orbs[i].pY, orbs[i].pZ, orbs[j].pX, orbs[j].pY, orbs[j].pZ) < 100) {
          stroke(255);
          line(orbs[i].pX, orbs[i].pY, orbs[i].pZ, orbs[j].pX, orbs[j].pY, orbs[j].pZ);
        }
      }
    }
  }  
  popMatrix();
  // angle = map(mouseX,0,width,0,TWO_PI);
  angleY += angleSpeed;

} 

void mouseDragged(){
angleY = map(mouseX,0,width,0,TWO_PI);
angleX = map(mouseY,0,height,0,TWO_PI);
}


void keyPressed() {
  if (key == 'g') {
    if (showGrid) {
      showGrid = false;
    }
    else {
      showGrid = true;
    }
  }
  if (key == 'p') {
    if (showPoints) {
      showPoints = false;
    }
    else {
      showPoints = true;
    }
  }
  if (keyCode == UP) {
    z--;
  }
  if (keyCode == DOWN) {
    z++;
  }
}


class Orb {
  float lat;
  float lon;
  float pX;
  float pY;
  float pZ;
  float thisRadius;

  Orb(float _lat, float _lon, float _radius, float _midX, float _midY) {
    lat = _lat * PI/180;
    lon = _lon * PI/180;
    thisRadius = _radius + random(-5, 5);
  }

  void display() {
    pX =   - (thisRadius) * cos(lat) * cos(lon);
    pY =   + (thisRadius) * sin(lat);
    pZ =  + (thisRadius) * cos(lat) * sin(lon);
    point(pX, pY, pZ);
  }
}

