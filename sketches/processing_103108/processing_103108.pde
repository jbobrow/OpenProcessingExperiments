
ArrayList<Body> bodies;
float G = 1;
float TIMEFACTOR = .5;
long lastTic = 0;
int NUM_BODIES = 20;
Body sun;
Body selected;
int selectedIndex = 0;

PFont font;
PFont smallFont;
int creationNumber=1;

void setup() {
  size(1000,600,OPENGL);
  camera(0, 0, 5000, 0, 0, 0, 0, 1, 0);
  
  font = createFont("Georgia", 128);
  smallFont = createFont("Georgia", 12);
  textFont(font);
  
  //size(1000,600,OPENGL);
  //frameRate(15);
  
  background(0);
  
  ellipseMode(CENTER);
  sun = new Body(
      500000,                           //mass
      100,                           //radius
      new PVector(.011,    .011),    //position
      new PVector(0,    0),         //inertia
      creationNumber
    );
  creationNumber++;
  bodies = new ArrayList<Body>();
  bodies.add(sun);
  
 

  
  lastTic = millis();
}

void makeBodies() {
  if (bodies.size() < NUM_BODIES) {
    float s = random(.000001,1);
    bodies.add(
      new Body(
        s, 
        Math.max(10,s), 
        new PVector(random(10000)-5000,  random(10000)-5000),  //position
        new PVector(random(10)-5,  random(10)-5),      //inertia
        creationNumber
      )
    );
    creationNumber++;
    //println(millis() + " creating body.");
  }
}

void draw() {
  long now = millis();
  long tDiff = now - lastTic;
  
  makeBodies();
  
  for (Body actor : bodies) {
    for (Body actee : bodies) {
      actor.exertForceUpon(actee, tDiff);
    }
  }
  for (int i = bodies.size()-1; i >= 0; i--) {
    bodies.get(i).move(tDiff);
    if (Math.abs(bodies.get(i).distanceFromCenter()) > 100000) {
      bodies.remove(i);
      //println("removed");
    } else {
      if (i == selectedIndex) selected = bodies.get(i);
    }
  }
  
  /*
  for (Body body : bodies) {
    body.move(tDiff);
    if (body.distanceFromCenter() > 100000) {
      bodies.remove(body);
      println("removed");
    }
  }
  */
  background(0);
  
  
  
  int y=-2600;
    //translate(0, 0, -100);
  
  for (Body body : bodies) {
    textAlign(CENTER, CENTER);
    textFont(font);
    body.draw();
    
    textAlign(LEFT);
    //textFont(smallFont);
    if (selected != null && selected.id == body.id) fill(255,0,0);
    else fill(255,255,255);
    
    text("mass: " + body.mass + " num: " + body.creationNumber + " age: " + body.age(), -4500, y); y+=150;
  }  
  
  lastTic = now;
  
}

void keyPressed() {
  if (keyCode == UP) {
    selectedIndex++;
    if (selectedIndex >= bodies.size()) selectedIndex = 0;
    selected = bodies.get(selectedIndex);
    println("selected: " + selectedIndex);
  } else if (keyCode == DOWN) {
    selectedIndex--;
    if (selectedIndex < 0) selectedIndex = bodies.size()-1;
    selected = bodies.get(selectedIndex);
    println("selected: " + selectedIndex);
  }
}
class Body implements Comparable<Body> {
  float mass;
  float radius;
  PVector velocity;
  PVector inertia;
  PVector position;
  float id;
  long startTime;
  int creationNumber;
  
  Body(float mass_, float radius_, PVector position_, PVector inertia_, int creationNumber_) {
    mass = mass_;
    radius = radius_;
    position = new PVector(position_.x, position_.y);
    inertia = new PVector(inertia_.x, inertia_.y);
    id = random(1);
    startTime = millis();
    creationNumber = creationNumber_;
  }
  
  long age() {
    return (long) Math.floor((float)(millis() - startTime) / 1000);
  }
  
  void draw() {
    pushMatrix();
      translate(position.x, position.y, 0);
      stroke(255);
      fill(255);
      ellipse(0, 0, radius, radius);
      
      if (selected != null && selected.id == id) {
        noFill();
        stroke(255,0,0);
        ellipse(0, 0, 500, 500);
      
        fill(255,255,255);
        text("dist: " + Math.floor(distanceFromCenter()), 0,300);
        text("mass: " + mass, 0,450);
        text("age: " + age(), 0, 600);
      }
    popMatrix();
  }
  
  float distanceFromCenter() {
    return dist(position.x, position.y, 0, 0);
  }
  void exertForceUpon(Body b, long time) {
    if (b.id == id) return;

    float angle = atan2(
                        b.position.y - position.y,
                        b.position.x - position.x
                        );
    
    float dist = dist(position.x, position.y,
      b.position.x, b.position.y);
    
    //float newForce = (float) G * b.mass * mass / (dist * dist);
    float newForce = (float) G * mass / (dist * dist);
    
    PVector newInertia = new PVector();
    
    newInertia.x = -cos(angle) * (newForce * time * TIMEFACTOR);
    newInertia.y = -sin(angle) * (newForce * time * TIMEFACTOR);
    
    
    
    b.inertia.x += newInertia.x;
    b.inertia.y += newInertia.y;
    
    if (b.mass == 2444)
    { 
      println("mass=" + b.mass);
      println("\tdist=" + dist);
      println("\tangle=" + angle);
      println("\tnewInertia= " + newInertia.x + "," + newInertia.y);
      println("\ttotInertia= " + b.inertia.x + "," + b.inertia.y);
      println("");
    }  
    
  }
  
  void move(long time) {
    velocity = new PVector();
    velocity.x = inertia.x * time * TIMEFACTOR;
    velocity.y = inertia.y * time * TIMEFACTOR;
    
    if ( id != sun.id) {
      position.x += velocity.x;
      position.y += velocity.y;
    }
    
    if (mass == 110) 
      println("pos= " + position.x + "," + position.y);
    
  }
  
  int compareTo(Body c2) {
    return (age() < c2.age()) ? -1 : (age() == c2.age()) ? 0 : 1;
  }
}


