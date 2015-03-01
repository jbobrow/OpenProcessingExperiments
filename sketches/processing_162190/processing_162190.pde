
ArrayList<Vehicle> vehicles;
int[] list;
PFont font;
char typedKey = 'H';

void setup() {
  size(600,800);
  frameRate(30);
  stroke(0,128);
  strokeWeight(2);
  vehicles = new ArrayList<Vehicle>();
  
  font = createFont("FreeSansBold.ttf", 420);
  textFont(font);
  fill(0);
  textAlign(CENTER,CENTER);
  text(typedKey, width/2, height/2-50);
  list = new int[width*height];
  loadPixels();
  for(int y = 0; y<=height-1; y++){
    for(int x = 0; x<=width-1; x++){
      color pb = pixels[y*width+x];
      if(red(pb)<5){  list[y*width+x]=0;  }
      else {  list[y*width+x]=1;  }}}
  updatePixels();
  for (int x=100; x<width-100; x++){
    for (int y=100; y<height-100; y++){
      if (list[int(y)*width+int(x)]==0 && random(10)<0.19){
        vehicles.add(new Vehicle(x,y));
      }}}
  noFill();
  background(#FFFAF5);
}

void draw() {
  background(#FFFAF5);
  for (Vehicle v : vehicles) {
    v.applyBehaviors(vehicles);
    v.update();
  }
}

void keyReleased(){
      if (key != CODED && key != ' ' && key != TAB && key != ENTER && key != RETURN) {
      background(#FFFFFF);
      typedKey = key;
      setup();
    }
}
class Vehicle {

  PVector location, velocity, acceleration;
  float maxforce, maxspeed;
  float seekX, seekY;
  float separationRate;
  float px,py;

  Vehicle(float x, float y) {
    location = new PVector(random(150,180),random(150,180));
    px=location.x;
    py=location.y;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    separationRate = 6;
    maxspeed = 3.3;
    maxforce = 0.3;
    seekX = x;
    seekY = y;
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void applyBehaviors(ArrayList<Vehicle> vehicles) {
    PVector separateForce = separate(vehicles);
    PVector seekForce = seek(new PVector(seekX,seekY));
    separateForce.mult(2);
    seekForce.mult(2);
    applyForce(separateForce);
    applyForce(seekForce); 
  }

  PVector separate (ArrayList<Vehicle> vehicles) {
    float desiredseparation = separationRate;
    PVector sum = new PVector();
    int count = 0;
    for (Vehicle other : vehicles) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d); 
        sum.add(diff);
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(maxspeed);
      sum.sub(velocity);
      sum.limit(maxforce);
    }
    return sum;
  }
  
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target,location);
    desired.normalize();
    desired.mult(maxspeed);
    desired.sub(velocity);
    desired.limit(maxforce);
    return desired;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    line(location.x,location.y,px,py);
    px=location.x;
    py=location.y;
  }
}


