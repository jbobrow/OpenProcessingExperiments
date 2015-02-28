
//*******************************************************
// Example for the course "Human-Computer Interactions"
// NCTU-Architecture
// Prepared by June-Hao Hou
// March 23, 2010
//*******************************************************

// Declare global variables
//
Homosapien[] people;
PFont fontA;

// Popular boy and girl names. There are only 20 names so if total number
// of people exceed 20 some of them will be reused.
//
String[] boyNames = { "Stanley", "Johnny", "Joshua", "Philips", "Aaron",
                    "Jack", "Thomas", "William", "Daniel", "Matthew"};
String[] girlNames = { "Emily", "Chloe", "Megan", "Jessica", "Emma",
                    "Sarah", "Elizabeth", "Sophie", "Olivia", "Lauren" };

// Initial setup
//
void setup() {
  size(400, 400);
  //frameRate(30);
  randomSeed(millis());

  int numPeople = 20;
  people = new Homosapien[numPeople];
  int nameIndex;
  String name;
  char sex;

  // Construct people object list  
  for (int i = 0; i < people.length; i++) {
    nameIndex = floor(random(10));
    // even number -> male, odd number -> female
    if (i % 2 == 0) {
      name = boyNames[nameIndex];
      sex = 'M';
    } else {
      name = girlNames[nameIndex];
      sex = 'F';
    }
    // (int) age: 10~60, (float) height: 110~180; (float) weight: 35~100
    people[i] = new Homosapien( name, floor(random(10, 60)), sex, random(110, 180), random(35, 100) );
    people[i].setLocation( random((width/2)-100, (width/2)+100), random((height/2)-100, (height/2)+100) );
    people[i].setVelocity( random(-0.5, 0.5), random(-0.5, 0.5) );
  }
  
  smooth();
  
  fontA = loadFont("ArialMT-48.vlw");
  textFont(fontA, 12);

} // end of setup


void draw() {
  background(255);
  
  for (int i = 0; i < people.length; i++) {
    people[i].display(people);
  }

  textAlign(LEFT);
  fill(100);
  text("FPS="+frameRate, 5, height - 3);

  delay(10);
  
  for (int i = 0; i < people.length; i++) {
    people[i].move();
  }

} // end of draw


//=====================================================
// Definition of class Homosapien
//
class Homosapien {

  // Properties
  String name;
  int age;
  char gender;
  float h;  // to differ from the system variable height.
  float w;  // weight.
  PVector bbox, loc, vel; // bounding box, location and velocity.
  
  //---------------------------------------------------
  // Constructor
  //
  Homosapien(String n, int a, char g, float h, float w) {
    this.name = n;
    this.age = a;
    this.gender = g;
    this.h = h;  // by using 'this.' the class won't get confused with the system variable 'height'.
    this.w = w;
    
    this.bbox = new PVector(this.w/2, this.w/2);  // width and height of the bounding box.
    
    this.loc = new PVector(0, 0);
    this.vel = new PVector(0, 0);     // value range is -1.0 to 1.0.
  }

  //---------------------------------------------------
  // Methods
  
  //---------------------------------------------------
  // Greet another people in a conversation bubble
  //
  void greet(Homosapien p) {
    String msg = "Hi, "+p.name+".";
    float tw = textWidth(msg); // calculate text width

    fill(255);
    stroke(50);
    rect(this.loc.x, this.loc.y-20, tw + 4, 16); // draw bubble
    fill(50);
    noStroke();
    textAlign(LEFT);
    text(msg, this.loc.x+2, this.loc.y-16, tw, 14); // draw name
  }
  
  // Greet a list of people by names
  void greet(String[] names) {
    String msg = "Hi, ";
    msg += join(names, ", \n");
    msg += ".";
    float tw = textWidth(msg);

    fill(255);
    stroke(50);
    rect(this.loc.x, this.loc.y-20, tw + 4, 14*names.length+4); // draw bubble
    fill(50);
    noStroke();
    textAlign(LEFT);
    text(msg, this.loc.x+2, this.loc.y-16, tw, 14*names.length); // draw name
  }
  
  //---------------------------------------------------
  // Set current location: x, y
  //
  void setLocation(float lx, float ly) {
    this.loc.set(lx, ly, 0);
  }

  //---------------------------------------------------
  // Set current velocity: x, y
  //
  void setVelocity(float vx, float vy) {
    this.vel.set(vx, vy, 0);
  }

  //---------------------------------------------------
  // Draw graphic entities onto the screen
  //
  void display(Homosapien[] p) {
    ArrayList encounters = new ArrayList();
    
    if (this.gender == 'M') {
      fill(150, 150, 230);
    } else {
      fill(230, 150, 150);
    }
    noStroke();
    ellipse(this.loc.x, this.loc.y, this.bbox.x, this.bbox.y);
    
    fill(50);
    textAlign(CENTER);
    text(this.name, this.loc.x, this.loc.y);
    
    // Check all on-stage people, if collision happened then show a greeting message.
    for (int i = 0; i < p.length; i++) {
      if (this == p[i]) {   // skip myself
        continue;
      } else {
        float d = this.loc.dist(p[i].loc);
        // if distance between two people is smaller than the sum of their radius -> collision happened!
        if (d <= (this.bbox.x/2 + p[i].bbox.x/2)) {
          //greet(p[i]);
          //return;
          encounters.add(p[i].name);
        }
      }
    }
    if (encounters.size() > 0) {
      String[] encounteredNames = new String[encounters.size()];
      encounters.toArray(encounteredNames);
      greet(encounteredNames);
    }
        
    
  } // end of display()
  
  //---------------------------------------------------
  // Update location and do boundary checking
  //
  void move() {
    this.loc.add(this.vel);
    if (this.loc.x < this.bbox.x/2 || this.loc.x > width-(this.bbox.x/2)) {
      this.vel.x = -this.vel.x;
    }
    if (this.loc.y < this.bbox.y/2 || this.loc.y > height-(this.bbox.y/2)) {
      this.vel.y = -this.vel.y;
    }
  }

} // end of class

