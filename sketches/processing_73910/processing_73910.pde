
//Globals
int drop = 0;
PImage spider;
PImage man;
ArrayList flies;
int countdown = -1;
int elapsed = 0;

//Setup
void setup() {
  size(272, 351);
  strokeWeight(1);
  stroke(150, 150, 150);
  smooth();
  
  //load images
  spider = loadImage("http://i263.photobucket.com/albums/ii133/kyna_/spider.png");
  man = loadImage("http://i263.photobucket.com/albums/ii133/kyna_/spiderguy.png");

  //initialize array
  flies = new ArrayList();
}

//Draw
void draw() {
  
  background(255);
  fill(0);

  imageMode(CENTER);
  image(man, width/2, height/2);
  
  //establish elapsed if countdown has begun
  if(countdown > 0) elapsed = millis() - countdown;

  //if currently running, drop the spider
  if((elapsed > 0) && (elapsed < 5000)){
    line((width/2)-8, (height/2)-5, (width/2)-8, ((height/2)+(drop/2))-6);
    image(spider, (width/2)-8, (height/2)+(drop/2)+12);
    drop++;
  }
  //at 5 seconds, begin fly dispersal
  else if (elapsed > 0){
    addFlies(0.05, 0);
    addFlies(-0.05, 1);
    line((width/2)-8, (height/2)-5, (width/2)-8, ((height/2)+(drop/2))-6);
    image(spider, (width/2)-8, (height/2)+(drop/2)+12);
  }
  //if no click, just show spider
  else image(spider, (width/2)-8, (height/2)+12);

  //if a fly leaves the screen, delete it to avoid lag, otherwise run
  for (int i = flies.size()-1; i >= 0; i--) {
    Fly f = (Fly) flies.get(i);
    if ((f.loc.x < 0)||(f.loc.y < 0)) flies.remove(i);
    f.run();
  }
}

//makes a fly dispersal point at the specified location with a drag in a specified direction
void addFlies(float sideForce, int side) {
  if (side == 1) {
    for (int i = 0; i <= 10; i++) {
      flies.add(new Fly(new PVector((width/2)-14, (height/2)-55, 0), new PVector(sideForce, -0.01, 0)));
    }
  }
  else {
    for (int i = 0; i <= 10; i++) {
      flies.add(new Fly(new PVector((width/2)+30, (height/2)-58, 0), new PVector(sideForce, -0.01, 0)));
    }
  }
}

//kill all flies on mouse click and reset variables
void mousePressed() {
  drop = 0;
  for (int i = flies.size()-1; i >= 0; i--) {
    Fly f = (Fly) flies.get(i);
    flies.remove(i);
  }
  
  countdown = millis();
}

////////////////////////////////////////////////////////////////////////

//Flies class based on basic particle (daniel shiffman)

class Fly {
  PVector loc;
  PVector vel;
  PVector acc;

  Fly(PVector l, PVector a) {
    acc = a.get();
    vel = new PVector(random(-1, 1), random(-2, 0.5), 0);
    loc = l.get();
  }

  void run() {
    update();
    render();
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
  }

  void render() {
    ellipseMode(CENTER);
    noStroke();
    fill(120);
    ellipse(loc.x, loc.y, 2, 2);
    stroke(150);
  }
}
