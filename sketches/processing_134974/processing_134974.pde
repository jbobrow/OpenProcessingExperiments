
/*
* - Mouse controlled camera
*/

Building[] cityscape = new Building[100];
float ang = 0.0;
// forward, backward, left, right.
boolean f, b, l, r;
// Camera variables
PVector loc, vel, acc;
PVector centerScene;


void setup() {
  size(600, 400, OPENGL);
  int i = 0; 
  for (int x = -5000; x < 5000; x += 1000) {
    for (int z = -5000; z < 5000; z += 1000) {
      cityscape[i] = new Building(x, 0, z);
      i++;
    }
  }
  loc = new PVector(-500, -100, -500);
  vel = new PVector();
  centerScene = new PVector();
  mouseX = width/2;
  mouseY = height/2;
}

void draw() {
  background(130);
  readMouseAngle();
  move();
  setCameraPosition();
  fill(60);
  box(10000, 1, 10000);

  //lightFalloff(1.0, 0.001, 0.0);
  pointLight(255, 250, 150, 0, -800, 0);
  for (int i = 0; i < cityscape.length; i++) {
    cityscape[i].render();
  }
}
void readMouseAngle(){
  if(mouseX > 350 || mouseX < 250){
    ang += map(mouseX, 0,width, -0.05, .05);
  }
}

void move() {
  if (l)ang -= .02;
  if (r)ang += .02;

  if (f) {
    vel.x +=  cos(ang)*1;
    vel.z +=  sin(ang)*1;
  } 

  if (b) {
    vel.x -=  cos(ang)*1;
    vel.z -=  sin(ang)*1;
  }
  
  vel.mult(.95);

  float nx = vel.x + loc.x;
  float nz = vel.z + loc.z;
  if (isClearOfBuildings(nx, nz)) {
    loc.add(vel);
  }
}
void setCameraPosition() {
  centerScene.x = cos(ang)*300+loc.x;
  centerScene.y = -100;
  centerScene.z = sin(ang)*300+loc.z;

  camera(loc.x, loc.y, loc.z, centerScene.x, centerScene.y, centerScene.z, 0, 1, 0);
}

void keyPressed() {
  if (key == 'a')l = true;
  if (key == 'd')r = true;
  if (key == 'w')f = true;
  if (key == 's')b = true;
}

void keyReleased() {
  if (key == 'a')l = false;
  if (key == 'd')r = false;
  if (key == 'w')f = false;
  if (key == 's')b = false;
}

boolean isClearOfBuildings(float nx, float nz) {
  for (Building b: cityscape) {
    if (abs(b.x - nx)<b.w/2 && abs(b.z - nz)<b.d/2) {
      return false;
    }
  }
  return true;
}

class Building{
  
  float x,y,z;
  float w,h,d;
  color c;
  
  Building(float nx, float ny, float nz){
    x = nx;
    y = ny; 
    z = nz; 
    
    w = random(400,800);
    h = random(500,3000);
    d = random(400,800); 
    c = color (50);
    if(x == 4000)c = color(255,0,0);
  }
  
  void render(){
    pushMatrix();
    translate(x, -h/2, z);
    //rotate();
    fill(c);
    box(w,h,d);
    popMatrix();
  }
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


