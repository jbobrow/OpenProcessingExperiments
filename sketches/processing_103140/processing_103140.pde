
//first look at 3-d
//copyright barry li july 3013

float x, y, z, xrot, yrot, zrot, vel;
boolean[] keyRoster = {false, false, false, false, false};
ArrayList<SuperCube> cubes;
void setup()
{
  size(800, 800, OPENGL);
  vel = 20;
  cubes = new ArrayList<SuperCube>();
}

void draw()
{
  background(255);
  fill(0);
  text("barry li july 2013", 10, height-10);
  lights();
  pushMatrix();
  //allows rotation via mouse
  yrot -= radians(mouseX-pmouseX)*.25;
  xrot -= radians(mouseY-pmouseY)*.25;
  
  //allows movement through keyboard
  if (keyRoster[0]) {
    z+=vel;
  }
  if (keyRoster[1]) {
    x+=vel;
  }
  if (keyRoster[2]) {
    x-=vel;
  }
  if (keyRoster[3]) {
    z-=vel;
  }
  if (keyRoster[4]) {
    cubes.clear();
  }
  translate(x, y, z);
  rotateX(xrot);
  rotateY(yrot);
  
  //applies gravity to all cubes and displays them
  for (int i = cubes.size()-1; i >=0; i--) {
    SuperCube cube = cubes.get(i);
    for (int j = cubes.size()-1; j>=0; j--) {
      SuperCube cube2 = cubes.get(j);
      if (i!=j) {
        cube.gravitate(cube2);
        cube.update();
      }
    }
    cube.display();
  }
  popMatrix();
}

void mousePressed() {
  cubes.add(new SuperCube(random(width)*2-width, random(height)*2-height, random(width)*2-width, random(3), random(3), random(3), int(random(100)), int(random(100)), int(random(100)), int(random(100, 255)), int(random(1, 3))));
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    keyRoster[0] = true;
  }
  if (key == 'a' || key == 'A') {
    keyRoster[1] = true;
  }
  if (key == 'd' || key == 'D') {
    keyRoster[2] = true;
  }
  if (key == 's' || key == 'S') {
    keyRoster[3] = true;
  }
  if (key == 'r' || key == 'R') {
    keyRoster[4] = true;
  }
}
void keyReleased() {
  if (key == 'w' || key == 'W') {
    keyRoster[0] = false;
  }
  if (key == 'a' || key == 'A') {
    keyRoster[1] = false;
  }
  if (key == 'd' || key == 'D') {
    keyRoster[2] = false;
  }
  if (key == 's' || key == 'S') {
    keyRoster[3] = false;
  }
  if (key == 'r' || key == 'R') {
    keyRoster[4] = false;
  }
}

class SuperCube {
  float gravConstant, x, y, z, xrot, yrot, zrot, xvel, yvel, zvel, xacc, yacc, zacc;
  int xDim, yDim, zDim, colour, mass;
  SuperCube(float tempx, float tempy, float tempz, float tempxrot, float tempyrot, float tempzrot, int tempxDim, int tempyDim, int tempzDim, int tempc, int tempmass) {
    x = tempx;
    y = tempy;
    z = tempz;
    xrot = tempxrot;
    yrot = tempyrot;
    zrot = tempzrot;
    xDim = tempxDim;
    yDim = tempyDim;
    zDim = tempzDim;
    colour = tempc;
    mass = tempmass;
    gravConstant = .2;
  }
  
  void display() {
    fill(colour);
    pushMatrix();
    translate(x, y, z);
    rotateX(xrot);
    rotateY(yrot);
    rotateZ(zrot);
    box(xDim, yDim, zDim);
    popMatrix();
  }
  void gravitate(SuperCube cube) {
    float distance = (cube.x-x)*(cube.x-x)+(cube.y-y)*(cube.y-y)+(cube.z-z)*(cube.z-z); //this distance squared
    xacc = (cube.x-x)*gravConstant*cube.mass/distance;
    yacc = (cube.y-y)*gravConstant*cube.mass/distance;
    zacc = (cube.z-z)*gravConstant*cube.mass/distance;
  }
  void update() {
    x+=xvel;
    y+=yvel;
    z+=zvel;
    xvel+=xacc;
    yvel+=yacc;
    zvel+=zacc;
  }
}
class SuperCube {
  float gravConstant, x, y, z, xrot, yrot, zrot, xvel, yvel, zvel, xacc, yacc, zacc;
  int xDim, yDim, zDim, colour, mass;
  SuperCube(float tempx, float tempy, float tempz, float tempxrot, float tempyrot, float tempzrot, int tempxDim, int tempyDim, int tempzDim, int tempc, int tempmass) {
    x = tempx;
    y = tempy;
    z = tempz;
    xrot = tempxrot;
    yrot = tempyrot;
    zrot = tempzrot;
    xDim = tempxDim;
    yDim = tempyDim;
    zDim = tempzDim;
    colour = tempc;
    mass = tempmass;
    gravConstant = .2;
  }
  
  void display() {
    fill(colour);
    pushMatrix();
    translate(x, y, z);
    rotateX(xrot);
    rotateY(yrot);
    rotateZ(zrot);
    box(xDim, yDim, zDim);
    popMatrix();
  }
  void gravitate(SuperCube cube) {
    float distance = (cube.x-x)*(cube.x-x)+(cube.y-y)*(cube.y-y)+(cube.z-z)*(cube.z-z); //this distance squared
    xacc = (cube.x-x)*gravConstant*cube.mass/distance;
    yacc = (cube.y-y)*gravConstant*cube.mass/distance;
    zacc = (cube.z-z)*gravConstant*cube.mass/distance;
  }
  void update() {
    x+=xvel;
    y+=yvel;
    z+=zvel;
    xvel+=xacc;
    yvel+=yacc;
    zvel+=zacc;
  }
}

