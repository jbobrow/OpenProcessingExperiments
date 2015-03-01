
PVector geoP, helioP;   //centre-points of the two systems
float t = 0;            //time
float[] orbits;         //8 radii orbits, earth has index 2
float[] speeds;         //8 planet speeds
int[] radii;            //9 radii, planets + sun radii, sun has index 0
int penR = 1;           // radius of the pen drawing the orbits
PGraphics pg;           // store the orbits on pg

void setup() {
  size(650, 500, P2D);
  smooth();
  geoP = new PVector(width/4-10, height/2);
  helioP = new PVector(width*0.75-10, height/2);
  orbits = new float[8];
  float maxRadius = width*0.2;
  for (int i = 0; i<orbits.length; i++) {
    orbits[i] = (i+1)*maxRadius/orbits.length;
  }
  speeds = new float[] {15, 10, 7, 5.5, 4.5, 3.5, 2.5, 1.5};
  radii = new int[] {11, 3, 3, 5, 3, 7, 7, 5, 5};
  pg = createGraphics(width, height, P2D);
  pg.beginDraw();
  pg.background(0);
  pg.noStroke();
  drawText();
  pg.endDraw();
  background(0);
  ellipseMode(RADIUS);
}

void draw() {
  //the position of the sun in the geocentric model
  PVector geoSun = new PVector(helioP.x - orbits[2]*cos(speeds[2]*t), helioP.y-orbits[2]*sin(speeds[2]*t));
  drawOrbits(geoSun);
  image(pg, 0, 0);
  drawPlanets(geoSun);
  
   t += 0.003;
  if (mousePressed ) {
    pg.beginDraw();
    pg.background(0);
    drawText();
    pg.endDraw();
  }
}

//draw text on pg
void drawText() { 
  PFont myFont;
  myFont = createFont("Helvetica", 32);
  pg.textFont(myFont);
  pg.textAlign(CENTER, CENTER);
  pg.fill(230);
  pg.text("Heliocentrism", width/4, 30);
  pg.text("Geocentrism", width*0.75, 30);
}

//draw orbits on pg
void drawOrbits(PVector geoSun) {
  pg.beginDraw();
  pg.fill(255, 204, 0);
  pg.ellipse(geoSun.x, geoSun.y, penR, penR); //draw orbit of sun
  pg.fill(153, 0, 0);
  for (int i = 0; i<orbits.length; i++) { 
    if (i!=2) {
      pg.ellipse(geoSun.x + orbits[i]*cos(speeds[i]*t), geoSun.y + orbits[i]*sin(speeds[i]*t), penR, penR);
    }
  }
  for (int i = 0; i<orbits.length; i++) {
    if (i==2) {
      pg.fill(0, 0, 153);
    } else {
      pg.fill(153, 0, 0);
    }
    pg.ellipse(geoP.x + orbits[i]*cos(speeds[i]*t), geoP.y + orbits[i]*sin(speeds[i]*t), penR, penR);
  }
  pg.endDraw();
}

void drawPlanets(PVector geoSun) {
  fill(255, 204, 0);
  ellipse(geoP.x, geoP.y, radii[0], radii[0]);
  ellipse(geoSun.x, geoSun.y, radii[0], radii[0]);
  fill(153, 0, 0);
  for (int i = 0; i<orbits.length; i++) {
    if (i!=2) {
      ellipse(geoSun.x + orbits[i]*cos(speeds[i]*t), geoSun.y + orbits[i]*sin(speeds[i]*t), radii[i+1], radii[i+1]);
    }
  }
  fill(0, 0, 153);
  ellipse(helioP.x, helioP.y, radii[3], radii[3]);
  for (int i = 0; i<orbits.length; i++) {
    if (i==2) {
      fill(0, 0, 153);
    } else {
      fill(153, 0, 0);
    }
    ellipse(geoP.x + orbits[i]*cos(speeds[i]*t), geoP.y + orbits[i]*sin(speeds[i]*t), radii[i+1], radii[i+1]);
  }
}


