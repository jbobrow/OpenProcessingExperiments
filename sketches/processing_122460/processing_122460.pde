
import controlP5.*;

PImage vectorMap;

int zone1_r = 80;
int zone2_r = 160;
int zone3_r = 300;
int zone4_r = 500;
int zone5_r = 850;
int zone6_r = 1200;

int sliderValue;

int jagX = 380;
int jagY = 260;
int daiX = 678;
int daiY = 440;
int comX = 780;
int comY = 510;
int morX = 820;
int morY = 285;
int humX = 735;
int humY = 460;
int alvX = 545;
int alvY = 425;
int w =6;
int h =6;

ControlP5 timeline, buttonRun, buttonStop, label, area; //slider control

Textlabel myTextlabelA;
Textarea myTextarea;

void setup() {
  size(1280, 800);
  noStroke();
  smooth();
  //slider:
  timeline = new ControlP5(this);
  timeline.addSlider("Year")
    .setPosition(50, 700)
      .setSize(400, 20)
        .setRange(1885, 2013)
          .setValue(1942)
            .setNumberOfTickMarks(128)
              .setSliderMode(Slider.FLEXIBLE)
                .setDecimalPrecision(0);
  // end of slider setup

  //button setup:
  buttonRun = new ControlP5(this);
  buttonRun.addButton("Run Timeline")
    .setValue(0)
      .setPosition(50, 675)
        .setSize(100, 20);

  buttonStop = new ControlP5(this);
  buttonStop.addButton("Stop Timeline")
    .setValue(100)
      .setPosition(170, 675)
        .setSize(100, 20);

  label = new ControlP5(this);

  myTextlabelA = label.addTextlabel("label")
    .setText("Use timeline slider to chose a year hit run to begin simulation. Use the mouse to drop factories across the city")
      .setPosition (50, 650)
        .setColorValue(#0FE5FF)
          .setFont(createFont("Georgia", 8));
}

void draw() {
  // load vector map png image ----------------------------
  vectorMap = loadImage("Vector Map_BP.png");
  vectorMap.resize(1280, 800);
  image(vectorMap, 0, 0);

  //The big 6 plants ---------------------------------------

  //zoning circles (x6) ------------------------------------
  fill(255, 15, 216, 15);
  ellipse(678, 480, zone1_r, zone1_r);
  fill(255, 15, 216, 15);
  ellipse(678, 480, zone2_r, zone2_r);
  fill(255, 15, 216, 15);
  ellipse(678, 480, zone3_r, zone3_r);
  fill(255, 15, 216, 15);
  ellipse(678, 480, zone4_r, zone4_r);
  fill(255, 15, 216, 15);
  ellipse(678, 480, zone5_r, zone5_r);
  fill(255, 15, 216, 15);
  ellipse(678, 480, zone6_r, zone6_r);
  fill(255, 15, 216, 15);

  //slider functions -------------------------------------
  sliderValue = int(timeline.getController("Year").getValue());

  //Brown's Lane Jaguar
  if ((sliderValue > 1945) && (sliderValue < 2005)) {
    fill(#FF8400);
    rect(jagX, jagY, w, h);
  }
  //Daimler The Motor Mills
  if ((sliderValue > 1896) && ( sliderValue < 1990)) {
    fill(#FF8400);
    rect(daiX, daiY, w, h);
  }
  //Commer Humber Road
  if ((sliderValue > 1905) && (sliderValue < 1968)) {
    fill(#FF8400);
    rect(comX, comY, w, h);
  }
  //Morris Courthouse Green
  if ((sliderValue > 1912) && (sliderValue < 1982)) {
    fill(#FF8400);
    rect(morX, morY, w, h);
  }
  //Humber Lower Ford Road
  if ((sliderValue > 1896) && (sliderValue < 1968)) {
    fill(#FF8400);
    rect(humX, humY, w, h);
  }
  //Alvis Holyhead Road
  if ((sliderValue > 1920) && (sliderValue < 1967)) {
    fill(#FF8400);
    rect(alvX, alvY, w, h);
  }
  //Jaguar Rollover --------------------------------------
  if (mouseX>jagX && mouseX<jagX+w && mouseY > jagY && mouseY < jagY+h) {
    area = new ControlP5(this);
    myTextarea = area.addTextarea("Jaguar")
      .setPosition(50, 50)
        .setSize(200, 50)
          .setFont(createFont("Georgia-Italic", 9))
            .setLineHeight(12)
              .setColor(color(#0FE5FF))
                .setColorBackground(color(150, 100))
                  .setColorForeground(color(150, 100));

    myTextarea.setText("MANUFACTURER: Jaguar              "
      +"LOCATION: Brown's Lane - Coventry            "
      +"OPENED IN: 1945        "
      +"CLOSED IN: 2005");
  }
  else {
    point(0, 0);
  }
  //Daimler Rollover ----------------------------------------
  if (mouseX>daiX && mouseX<daiX+w && mouseY > daiY && mouseY < daiY+h) {
    area = new ControlP5(this);
    myTextarea = area.addTextarea("Daimler")
      .setPosition(50, 50)
        .setSize(200, 50)
          .setFont(createFont("Georgia-Italic", 9))
            .setLineHeight(12)
              .setColor(color(#0FE5FF))
                .setColorBackground(color(150, 100))
                  .setColorForeground(color(150, 100));

    myTextarea.setText("MANUFACTURER: Daimler              "
      +"LOCATION: The Motor Mills - Coventry            "
      +"OPENED IN: 1896        "
      +"CLOSED IN: 1990");
  }
  else {
    point(0, 0);
  }
//Commer Rollover
  if (mouseX>comX && mouseX<comX+w && mouseY > comY && mouseY < comY+h) {
    area = new ControlP5(this);
    myTextarea = area.addTextarea("Commer")
      .setPosition(50, 50)
        .setSize(200, 50)
          .setFont(createFont("Georgia-Italic", 9))
            .setLineHeight(12)
              .setColor(color(#0FE5FF))
                .setColorBackground(color(150, 100))
                  .setColorForeground(color(150, 100));

    myTextarea.setText("MANUFACTURER: Commer              "
      +"LOCATION: Humber Road - Coventry            "
      +"OPENED IN: 1905        "
      +"CLOSED IN: 1968");
  }
  else {
   point(0,0); 
  }
  //Morris Rollover
  if (mouseX>morX && mouseX<morX+w && mouseY > morY && mouseY < morY+h) {
    area = new ControlP5(this);
    myTextarea = area.addTextarea("Jaguar")
      .setPosition(50, 50)
        .setSize(200, 50)
          .setFont(createFont("Georgia-Italic", 9))
            .setLineHeight(12)
              .setColor(color(#0FE5FF))
                .setColorBackground(color(150, 100))
                  .setColorForeground(color(150, 100));

    myTextarea.setText("MANUFACTURER: Morris              "
      +"LOCATION: Courthouse Green - Coventry            "
      +"OPENED IN: 1912        "
      +"CLOSED IN: 1982");
  }
  else {
   point(0,0); 
  }
  //Humber Rollover
  if (mouseX>humX && mouseX<humX+w && mouseY > humY && mouseY < humY+h) {
    area = new ControlP5(this);
    myTextarea = area.addTextarea("Morris")
      .setPosition(50, 50)
        .setSize(200, 50)
          .setFont(createFont("Georgia-Italic", 9))
            .setLineHeight(12)
              .setColor(color(#0FE5FF))
                .setColorBackground(color(150, 100))
                  .setColorForeground(color(150, 100));

    myTextarea.setText("MANUFACTURER: Humber              "
      +"LOCATION: Lower FOrd Road - Coventry            "
      +"OPENED IN: 1986        "
      +"CLOSED IN: 1968");
  }
  else {
   point(0,0); 
  }
  //Alvis Rollover
  if (mouseX>alvX && mouseX<alvX+w && mouseY > alvY && mouseY < alvY+h) {
    area = new ControlP5(this);
    myTextarea = area.addTextarea("Alvis")
      .setPosition(50, 50)
        .setSize(200, 50)
          .setFont(createFont("Georgia-Italic", 9))
            .setLineHeight(12)
              .setColor(color(#0FE5FF))
                .setColorBackground(color(150, 100))
                  .setColorForeground(color(150, 100));

    myTextarea.setText("MANUFACTURER: Alvis              "
      +"LOCATION: Holyhead Road - Coventry            "
      +"OPENED IN: 1920        "
      +"CLOSED IN: 1967");
  }
  else {
   point(0,0); 
  }
}

class Attractor {
  float mass;
  PVector location;
  float G;
 
 
  Attractor(float x, float y, float mass_) {
    location = new PVector (x, y);
    mass = mass_;
    G = 0.4;
  }
 
  PVector attract(Mover m) {
 
 
    PVector force = PVector.sub(location, m.location); //whats the force direction?
    float distance = force.mag();
    distance = constrain(distance, 5, 25); //constraint distance
    force.normalize();
    float strength = (G*mass*m.mass) / (distance * distance);
    force.mult(strength); // whats the force magnitude?
    return force; // return force so it can be ap`plied!
  }
 
 
  void display() {
    noStroke();
    fill(#FF8400);
    ellipse(location.x, location.y, 6, 6);
  }
}
class Mover {
 
  // location, velocity, and acceleration
  PVector location;
  PVector velocity;
  PVector acceleration;
   
  // Mass is tied to size
  float mass;
 
  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
 
  // Newton's 2nd law: F = M * A
  // or A = F / M
  void applyForce(PVector force) {
    // Divide by mass
    PVector f = PVector.div(force, mass);
    // Accumulate all forces in acceleration
    acceleration.add(f);
  }
 
  void update() {
     
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Location changes by velocity
    location.add(velocity);
    // We must clear acceleration each frame
    acceleration.mult(0);
  }
   
  // Draw Mover
  void display() {
    noStroke();
    fill(#B200FF);
    ellipse(location.x, location.y, mass*2, mass*2);
  }
   
  // Bounce off bottom of window
  void checkEdges() {
    if (location.y > height) {
      velocity.y *= -0.9;  // A little dampening when hitting the bottom
      location.y = height;
    }
  }
}



