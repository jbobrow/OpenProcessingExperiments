
// I'm aware the code is a mess.
// I had modified, added and tried often until have been lost in code :)

final int MAX_VERTEX = 1000;
int drawnVertex;

final float GRAVITY =  9.80665;
final int   BURST   = 6; 
int colorChanger;

boolean lockXrot, lockYrot;

int lastX, lastY;
boolean pressed; 

float farZ, nearZ;
float camX, camY, camZ;

Vertice[] vertex;


////////////// + S E T U P + ////////////// 

void setup() {
  size (400, 400);

  drawnVertex = 1000;
  pressed = false;

  vertex = new Vertice[MAX_VERTEX];

  colorChanger = 30;

  for (int i=0; i<vertex.length;i++) {
    vertex[i] = new Vertice(0, 1000, 0, random(-10), 0, radians(random(360)), 0);
  }

  lockXrot = true;
  lockYrot = false;
}
////////////// - S E T U P - ////////////// 

////////////// + D R A W + ////////////// 
void draw() {
  background(0);
  for (int i=0; i<vertex.length;i++) {
    vertex[i].update();
  }

  for (int i=0; i<drawnVertex;i++) {
    vertex[i].draw();
  }
  //farZ  = -1000;
  //nearZ =  1000;

  if ( frameCount % BURST == 0) colorChanger++;
  if (colorChanger>360) colorChanger=0;
  fill(255);  
  text("Press SPACE key to "+((lockXrot)?"unlock":"lock"), 0, 20);
  text("X-axis rotation.", 0, 35);
  text("Press number keys ( 1 to 1000 ) for count of particles * 100", 20, height-10);

}
////////////// - D R A W - ////////////// 


/////// + R O T  A T I O N S + /////// 

////////////// +calcRotations+ ////////////// 
float[] calcRotations(float x, float y, float z, float a, float b, float c) { 
  float rx = x*cos(a)*cos(b) - y*sin(a)*cos(b) - z*sin(b);
  float ry = y*cos(a)*cos(c) + x*sin(a)*cos(c) - z*cos(b)*sin(c) - x*cos(a)*sin(b)*sin(c) + y*sin(a)*sin(b)*sin(c);
  float rz = y*cos(a)*sin(c) + x*sin(a)*sin(c) + z*cos(b)*cos(c) + x*cos(a)*sin(b)*cos(c) - y*sin(a)*sin(b)*cos(c);

  return  new float[] {
    rx, ry, rz
  };
}
////////////// -calcRotations- ////////////// 


public float[] rotObjX(float x, float y, float z, float ang) {
  float yy = y*cos(ang) - z*sin(ang);
  float zz = y*sin(ang) + z*cos(ang);
  return new float[] {
    yy, zz
  };
}

public float[] rotObjY(float x, float y, float z, float ang) {
  float zz = z*cos(ang) - x*sin(ang);
  float xx = z*sin(ang) + x*cos(ang);
  return new float[] {
    xx, zz
  };
}

public float[] rotObjZ(float x, float y, float z, float ang) {
  float xx = x*cos(ang) - y*sin(ang);
  float yy = x*sin(ang) + y*cos(ang);
  return new float[] {
    xx, yy
  };
}

////////////

public void rotCamX(float ang) {
  camX -= ang;
}
public void rotCamY(float ang) {
  camY -= ang;
}
public void rotCamZ(float ang) {
  camZ += ang;
}

/////// - R O T  A T I O N S - /////// 

///////

class Vertice {
  float x, y, z;
  float rx, ry, rz;
  float a, b, c; //total angles
  int col;

  float swivel, tilt;
  float velocity;
  float time;

  Vertice(float x, float y, float z, float velocity, float tilt, float swivel, int col) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.velocity = velocity;
    this.tilt = tilt;
    this.swivel = swivel;
    this.col = col;

    a = b = c = 0;
    time = 0;
  }

  public void update() {
    //projectile projection

    float rot[];
    rot = rotObjY(x, y, z, -swivel);
    x = rot[0];
    z = rot[1];

    float vx =  sin(tilt) * velocity;
    float vy = -1 * cos(tilt) * velocity * time + GRAVITY * time * time;

    x += vx;
    y += vy;

    rot = rotObjY(x, y, z, swivel);
    x = rot[0];
    z = rot[1];

    time += 0.005;

    if (y>150) {
      x = 0;//(random(-100,100));
      y = 150;
      z = 0;
      velocity = random(2, 10);
      tilt = radians(random(-5, 5));
      swivel = radians(random(360));
      time = 0;
      col = colorChanger;
    }

    rz = y*cos(a)*sin(c) + x*sin(a)*sin(c) + z*cos(b)*cos(c) + x*cos(a)*sin(b)*cos(c) - y*sin(a)*sin(b)*cos(c);
    if (farZ < rz) farZ = rz;
    if (nearZ > rz) nearZ = rz;
  }

  public void draw() {

    float rot[];

    rot = calcRotations(x, y, z, camX, camY, camZ);

    float proj = (1000 / (1000 - rot[2]));
    float x2d = rot[0] * proj + width/2;
    float y2d = rot[1] * proj + height/2;


    pushStyle();

    float vertSize= abs(map(rot[2], nearZ, farZ, 1, 8));
    float vertShade=abs(map(rot[2], nearZ, farZ, 1, 255));

    colorMode(HSB, 360, 100, 100);

    fill(col, 100, vertShade);
    noStroke();
    ellipse(x2d, y2d, vertSize, vertSize); 

    popStyle();
  }
}

///////////////

float xTo2D (Vertice vert) {
  return  vert.x * (1000 / (1000 - vert.z)) + width/2;
}

float yTo2D (Vertice vert) {
  return  vert.y * (1000 / (1000 - vert.z)) + height/2;
}

void mousePressed() {
  pressed = true;
  lastX = mouseX;
  lastY = mouseY;
}

void mouseDragged() {
  if (!lockXrot)
    rotCamX(radians((lastY-mouseY) % 20));
  if (!lockYrot)
    rotCamY(radians((mouseX-lastX) % 20));

  lastX = mouseX;
  lastY = mouseY;
}

void mouseReleased() {
  pressed = false;
}


void keyReleased() {

  if (keyCode>=49 && keyCode<=57) drawnVertex = (keyCode-48) * 100;
  if (keyCode==48) drawnVertex = 1000;

  // numpad keys
  if (keyCode>=97 && keyCode<=106) drawnVertex = (keyCode-96) * 100;
  if (keyCode==96) drawnVertex = 1000;

  if (key == 32) {
    if (lockXrot) lockXrot = !lockXrot;
    else {
      camX = 0;
      camY = 0;
      camZ = 0;
      lockXrot = !lockXrot;
    }
  }
}
