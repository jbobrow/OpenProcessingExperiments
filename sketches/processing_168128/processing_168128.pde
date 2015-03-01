
boolean isGoingWhite = true;
color c_bg = color(255);
Corona c;
CelestialSphere cs;
Asteroid []as = new Asteroid[100];
float delta = 1;

int numAs = 0, numAsAlive=0;
void setup() {
  size(800, 800, P3D);
  noiseDetail(8);
  c = new Corona();
  cs = new CelestialSphere();
}

void draw() {
  background(c_bg, 10);

  translate(width/2, height/2, 0);
  fill(255, 255, 0);
  cs.show();

  //sphere(100);
  c.update();
  c.show();

  for (int i=0; i<numAs; i++) {
    as[i].show();
    c.grow(as[i]);
  }
  pushMatrix();
  stroke(255);
  noFill();
  rotateX(radians(++delta));
  rotateY(radians(delta));
  box(100);
  makeFoggy(50,50,50);
  popMatrix();

  lights();
  
}

void mousePressed() {

  if (numAs<100) {
    as[numAs++] = new Asteroid();
    numAsAlive++;
  } else {
    for ( Asteroid t : as) {
      if (!t.isAlive) {
        t = new Asteroid();
        numAsAlive++;
        return;
      }
    }
    numAs =0;
  }
}

color getComplementaryColor(color c) {
  float R = red(c), G = green(c), B = blue(c);
  return color(255-R, 255-G, 255-B);
}

void makeFoggy(float ox, float oy, float oz){
  
  float lx=0, ly=0, lz =1, unitSize= 50;
 
  float rx = random(0, unitSize);
  float ry = random(0, unitSize);
  float rz = random(0, unitSize);
 
  float sx = random(0, unitSize);
  float sy = random(0, unitSize);
  float sz = random(0, unitSize);
 
  float cx = ry*sz-ry*sy;
  float cy =  rx*sz-rz*sx;
  float cz =  rx*sy-ry*sx;
 
  float size = sqrt(cx*cx+ cy*cy + cz*cz);
  cx = cx/size;
  cy = cy/size;
  cz = cz/size;
 
 
  float brightness = abs(cx*lx + cy*ly + cz*lz) ;
 
  fill(brightness * 255, brightness * 255);
  noStroke();
  beginShape();
  vertex(ox, oy, oz);
  vertex(ox+rx, oy+ry, oz+rz);
  vertex(ox+sx+rx, oy+sy+ry, oz+sz+rz);
  vertex(ox+sx, oy+sy, oz+sz);
  endShape();

}

//
// Corona
//

class Corona {

  float resolution = 260; // how many points in the circle
  float radius = 150, targetRadius=0;
  float x = 1;
  float y = 1;
  float v = 1;

  float t = 0; // time passed
  float tChange = 0.02; // how quick time flies

  float nVal; // noise value
  float nInt = 1; // noise intensity
  float nAmp = 1; // noise amplitude
  float deltaColor = 200;

  color c_corona;
  color c_temp = color(0);

  boolean colorChanged = false;

  public Corona() {

    c_corona = getComplementaryColor(c_bg);
    reset();
  };
  void setRadius(float radius) {
    if (radius>(width*3/2)) {  
     reset();
     } else if (radius>(width*3/2)-v) {
      this.radius = radius;
      //Change BG color in advance
      if (!colorChanged)
        changeBg();
    } else {
      this.radius = radius;
    }
  }
  void update() {
    if (!(radius<targetRadius)) return;
    
    setRadius(radius+v);
  }
  void makeBigger(float delta) {
    targetRadius = radius+delta;
  }
  void show() {
    noStroke();
    fill(c_corona);

    pushMatrix();
    nInt = map(numAs, 0, 100, 0.1, 30); // map mouseX to noise intensity
    float distance = sqrt((width/2-mouseX)*(width/2-mouseX)+(height/2-mouseY)*(height/2-mouseY));
    nAmp = map(distance, 0, sqrt((width/2)*(width/2)+(height/2)*(height/2)), 0.0, 1.0); // map mouseY to noise amplitude

    beginShape();
    for (float a=0; a<=TWO_PI; a+=TWO_PI/resolution) {

      nVal = map(noise( cos(a)*nInt+1, sin(a)*nInt+1, t ), 0.0, 1.0, nAmp, 1.0); // map noise value to match the amplitude

      x = cos(a)*radius *nVal;
      y = sin(a)*radius *nVal;

      vertex(x, y, 0);
    }
    endShape(CLOSE);

    t += tChange;
    popMatrix();
  }
  void grow(Asteroid as) {
    if (!as.isRotate()) return;

    if (isGoingWhite) {
      float red=red(c_corona)+red(as.c)/deltaColor;
      float green =green(c_corona)+ green(as.c)/deltaColor;
      float blue = blue(c_corona) + blue(as.c)/deltaColor;

      changeFill(red, green, blue);
    } else {
      float red=red(c_corona)- green(as.c)/(deltaColor*2) -blue(as.c)/(deltaColor*2);
      float green =green(c_corona)-red(as.c)/(deltaColor*2)-blue(as.c)/(deltaColor*2);
      float blue = blue(c_corona) -red(as.c)/(deltaColor*2)- green(as.c)/(deltaColor*2);

      changeFill(red, green, blue);
    }
    if (c_bg == c_corona) reset();
    makeBigger(as.getArea() );
  }
  private void changeFill(float r, float g, float b) {
    c_corona = color(r, g, b);
  }
  void reset() {
    radius = 0;
    c_corona = c_temp;
    colorChanged = false;
    isGoingWhite = !isGoingWhite;
  }


  void changeBg() {
    c_temp = getComplementaryColor(c_bg);
    c_bg = c_corona;
    colorChanged = true;
  }
}

//
// CelestialSphere
//

class CelestialSphere {
  float rX=0, rY=0, rZ=0;
  float radius;
  float delta = 15;
  public CelestialSphere() {
    radius = width/2;
  }
  void show() {
    pushMatrix();
    rotateX(radians(rX));
    rotateY(radians(rY));
    rotateZ(radians(rZ));
    for (float deg=0; deg<180; deg +=delta) {
      float theta = radians(deg);

      for (float deg2 = 0; deg2 < 360; deg2 += delta) {    
        float phi = radians(deg2);
        float x = radius * sin(phi) * cos(theta);
        float y = radius * sin(phi) * sin(theta);
        float z = radius * cos(phi);

        stroke(getComplementaryColor(c_bg));
        point(x, y, z);
      }
    }
    popMatrix();

    rX+=0.1;
    rY+=0.1;
    rZ+=0.1;
  }
}

//
// Asteroid
//

class Asteroid {
  private float x, y, z, radius, d;
  private float v;
  private float vecX, vecY, vecZ;
  private int rotatingTime;
  private color c;
  private boolean isAlive;
  private float maxRad = 50;
  public Asteroid() {
    updateMouseXY();   
    v = random(10, 100)*0.1;
    radius = random(5, maxRad);
    z = -radius;
    rotatingTime = (int)random(0, 200);
    colorMode(HSB, 360, 100, 100);
    c = (isGoingWhite)?
    color(random(0, 360), random(30, 50), random(70, 100))
    :color(random(0, 360), random(30, 50), random(30, 50));
    colorMode(RGB, 255, 255, 255);
    isAlive = true;
  }
  public void updateMouseXY() {
    x = mouseX-width/2;
    y = mouseY-height/2;
  }
  public void update() {
    if (!isAlive)
      return;
    if (z<0) { //going up
      z+=v;
      return;
    } else if (rotatingTime>0) {
      //make rotate
      d=sqrt(x*x+y*y+z*z);
      vecX = y/d;
      vecY = -x/d;
      vecZ = z/d;
      rotatingTime--;
    } else {
      z+=vecZ *v;
    }
    x+=vecX*v;
    y+=vecY*v;

    if (x>width/2+maxRad|| x<-width/2-maxRad || y>height/2+maxRad || y<-height/2-maxRad) {
      isAlive=false;
      d=0;
    }
  }
  public boolean isRotate() {
    if (rotatingTime>0) return true;
    else return false;
  }
  public void show() {
    if (!isAlive)
      return;

    this.update();
    pushMatrix();
    translate(x, y, z);
    noStroke();
    fill(c);
    sphere(radius);
    popMatrix();
  }
  public color getColor() {
    return c;
  }
  public float getArea() {
    return radius*radius;
  }
} 


