
import controlP5.*;

Behaviour behaviour;
//boolean debug = true;
//boolean pause = true;
float d = 25;
int no_of_agents = 10;
int no_of_obstacles =50;


void setup() {
  size(1900, 1000);//size of the window
  smooth();// smooth methods used to make object appear with smooth edges

  behaviour = new Behaviour();

  obstacles = new ArrayList();//adding obstacle
  for (int i = 0; i < no_of_obstacles; i++) {   
    Obstacle obstacle = new Obstacle(random(1, width)*0.9, random(1, height), 50, 50);
    obstacles.add(obstacle);
  }

  controlsInit();
}


void draw() {
  PVector mouse = new PVector(mouseX, mouseY);

  if (pause) {// if statement used to pause the sketch
    background(254); //setting the background color


    for (Obstacle obs : obstacles) { //rendering obstacles on the screen
      obs.display2();
    }

    targetArea.display(); //rendering target area
    behaviour.run(); // renderin agents and applying thier behaviors 

    fill(200);
    stroke(0);
    strokeWeight(2);
    ellipse(mouse.x, mouse.y, 20, 20);
    // agents.arrive(mouse);
  }//end of if statment
}//end of draw method



void mousePressed() {

  debug = !debug;
}


void keyReleased() {
  if (key == 'p'|| key =='P') {
    pause = !pause;
  }
  if (key=='r'|| key == 'R') {
    setup();
  }
}

// The "Agent" class
PVector mouse = new PVector(mouseX, mouseY);
ArrayList <Obstacle> obstacles; 
//int OBSTACLE_DISTANCE =15;
TargetArea targetArea = new TargetArea();
int type;
class Agent {


  ArrayList<PVector> history = new ArrayList<PVector>();//Vector for trail line of agents
  float swt = 25.0;     //sep.mult(25.0f);
  float awt = 4.0;      //ali.mult(4.0f);
  float cwt = 5.0;      //coh.mult(5.0f);


  String value = " ";
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector targetLocation = new PVector(1800, 900);
  float r;
  float FIELD_OF_VIEW = 120;//Angle in degress

  float maxspeed;
  float maxforce;
  int agentRadius =25;

  boolean goToExit = true;
  boolean wanderAround = true;


  Vector v = new Vector();



  Agent(float x, float y, int t) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-2, 1), random(-2, 1));
    //velocity.mult(5);
    location = new PVector(x, y);
    r = 6;
    maxspeed = 1;
    maxforce = 0.02;
    agentRadius =25;
    type = t;
  }
  //updates agents at every step
  void run(ArrayList<Agent>agents) {
    for (Agent v: agents) {
      //velocity.limit(maxspeed);
      //location.add(velocity);
      // keyPressed();
      boundaries();
      behaviours(agents);
      avoidAgent(agents);

      collisionDetection(agents);
      avoidObstacle(obstacles);
      update();

      //mousePressed();
      //display();
    }
  }

  // Method to update location
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    location.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
    arrive(mouse);

    history.add(location.get());
    if (history.size() > 500) {
      history.remove(0);
    }
  }




  void avoidObstacle(ArrayList<Obstacle> obstacles) {
    for (Obstacle obstacle: obstacles) {
      float d = PVector.dist(location, obstacle.location);

      if (d <= obstacle.aura) {
        velocity.add(PVector.mult(avoidElement(obstacle.location), 7));
        velocity.normalize();
        // location.sub(velocity);
      }
      if ((d <=obstacle.aura) &&(d<=5)) {

        PVector newdirection =  PVector.add(obstacle.location, location);
        newdirection.normalize();
        location.sub(newdirection);
        // velocity.div(maxspeed);

        location.add(newdirection);
      }
      else
        if ((d <=obstacle.aura) &&(d<=5)) {

          if (location.x <= d+2) {
            PVector desired = new PVector(-velocity.y, -maxspeed);
            desired.limit(maxspeed);
            desired.normalize();
            location.add(desired);
          }
          else {

            if (location.y <= d+2) {
              PVector desired = new PVector(-velocity.x, -maxspeed);
              desired.limit(maxspeed);
              desired.normalize();
              location.add(desired);
            } 
            else {
              PVector newdirection =  PVector.sub(obstacle.location, location);
              newdirection.normalize();
              location.mult(newdirection);
            }
          }
        }
    }
  }






  PVector avoidElement(PVector objPos) {
    PVector sepPV = new PVector(0, 0);
    PVector pulse;

    pulse = PVector.sub(getPosition(), objPos);
    pulse.normalize();
    pulse.div(PVector.dist(getPosition(), objPos));
    sepPV.add(pulse);
    return sepPV;
  }

  PVector getPosition() {
    return location;
  }




  void avoidAgent(ArrayList<Agent> agent) {
    PVector newDirection =  new PVector(0, 0);
    float count = 0;
    int step = 0;
    int neighbordist = 50;
    float avoidanceMultiplier=0;



    for (Agent other : agent) {
      float d = PVector.dist(location, other.location);
      PVector newVelocity = null;

      if ((step < d)&& (d < 40)) {
        velocity.limit(maxspeed);
        if ((d >40)&&(d<50)) {
          avoidanceMultiplier = 0.7;
        }

        if (d <30) {
          avoidanceMultiplier = 0.9;
        }

        if (d < agentRadius+agentRadius) {


          if (( d > 26)&&(d<40)) {
            // Greating code from June-Hao Hou http://www.openprocessing.org/sketch/8507*@* 
            // I will tweak the code so the agents generate random words as the meet with each other
            String msg = ("hi there");
            float tw = textWidth(msg); // calculate text width
            fill(255);
            stroke(50);
            rectMode(CORNER);
            rect(location.x, location.y-20, tw + 4, 16); // draw bubble
            fill(50);
            noStroke();
            textAlign(LEFT );
            text((msg), location.x+2, location.y-8); // draw name
          }
          else {
            if (( d > 20)&&(d<25)) {

              String msg = "Opps! to close";
              float tw = textWidth(msg); // calculate text width
              fill(255);
              stroke(50);
              rectMode(CORNER);
              rect(location.x, location.y-20, tw + 4, 16); // draw bubble
              fill(50);
              noStroke();
              textAlign(LEFT );
              text(msg, location.x+2, location.y-8); // draw name
            }
            else {
              if ( d < 15) {

                String msg = "watch it";
                float tw = textWidth(msg); // calculate text width
                fill(255);
                stroke(50);
                rectMode(CORNER);
                rect(location.x, location.y-20, tw + 4, 16); // draw bubble
                fill(50);
                noStroke();
                textAlign(LEFT );
                text(msg, location.x+2, location.y-8); // draw name
              }
            }


            fill(255, 0, 0, 95);
            noStroke();
            ellipse(location.x, location.y, agentRadius, agentRadius);
          }

          newDirection = PVector.sub(location, other.location);

          newDirection.normalize();
          newDirection.mult(maxspeed*avoidanceMultiplier);
          // }else 

          location.add(newDirection);
        }
      }
      step++;
    }
  }



  //makes agents stay within the boundaries
  void boundaries() {

    PVector desired = null;

    if (location.x < d) {
      desired = new PVector(maxspeed, velocity.y);
    } 
    else if (location.x > width -d) {
      desired = new PVector(-maxspeed, velocity.y);
    } 

    if (location.y < d) {
      desired = new PVector(velocity.x, maxspeed);
    } 
    else if (location.y > height-d) {
      desired = new PVector(velocity.x, -maxspeed);
    } 

    if (desired != null) {
      desired.normalize();
      desired.mult(maxspeed);
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }  




  float getDistance(PVector target, PVector location) {
    float spaceBetween = target.dist(location);
    return spaceBetween;
  }

  void collisionDetection(ArrayList<Agent>agent) {
    for (Agent other:agent) {
      float d = PVector.dist(location, other.location);
      if ((location.x<agentRadius)||(location.y<agentRadius)) {
        fill(128, 0, 0, 95);
        noStroke();
        ellipse(location.x, location.y, agentRadius, agentRadius);
      }
    }
  }






  public void step(PVector target) {
    float spaceBetween = target.dist(location);
    float angle = PVector.angleBetween(target, location);
    angle  = (degrees(angle));//converting radians to degrees
    float n = 0;
    float largestDistance = 0, smallestDistance = 100000, sum = 0;
    PVector dir = new PVector(0, 0);

    for (float d = 0; d < spaceBetween; d++) { // for each step

      for (float a = angle-0.5*FIELD_OF_VIEW ; a < angle+0.5*FIELD_OF_VIEW; a+=15) {  //for each angle

        spaceBetween = getDistance(target, location);//converts target and location vectors to a scalar value

        for (float count = 0; count <= spaceBetween; count++ ) {
          n = spaceBetween;
          if (n > largestDistance)
            largestDistance=n;
          if (n < smallestDistance && n >= 0)
            smallestDistance=n;
        }
        if (spaceBetween ==0) {
          velocity = new PVector(0, 0);
          acceleration = new PVector(0, 0);
        }


        dir.mult(spaceBetween);
        dir.normalize();


        PVector desired = PVector.sub(target, location, dir);//points the vector in the direction of the target
        float k = desired.mag(); 
        desired.normalize();

        //if statement to make the agents stop at the destination
        if (k > 0) {
          float m = map(k, 0, 10, 0, maxspeed);
          desired.mult(m);
        }
        else {
          desired.mult(maxspeed);
        }



        PVector steer = PVector.sub(desired, velocity);//

        steer.limit(maxforce);
        applyForce(steer);
      }
    }
  }







  void behaviours(ArrayList<Agent>agents) {

    boundaries();
    if (!keyPressed) {
      if (key =='e'||key=='E') {
        stopAtTarget(targetLocation);
      }
      else
        if (key=='w'||key=='W') {
          wander();
        }

      //          if(mouseButton == RIGHT){
      //      PVector mouse = new PVector(mouseX, mouseY);
      //      location.add(mouse);
      //      }
    }
  }




  void stopAtTarget(PVector target) {

    PVector desired = PVector.sub(target, location);
    float d = desired.mag();
    desired.normalize();
    if (d<20) {
      float m = map(d, 0, 100, 0, maxspeed);
      desired.mult(maxspeed);
    }
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }

  public void applyForce(PVector force) {

    acceleration.add(force);
  }


  public void wander() {
    velocity.limit(maxspeed*0.5);
    location.add(velocity);
  }



  void display() {




    if (!debug) {

      fill(127, 225, 0, 95);
      noStroke();
      ellipse(location.x, location.y, agentRadius, agentRadius);


      //fill(0);
      //text("Frame Rate" + frameRate, 15, 20);

      beginShape();
      stroke(145);
      strokeWeight(1);
      noFill();
      for (PVector v: history) {
        vertex(v.x, v.y);
      }
      endShape();
    }



    // Draw a circle rotated in the direction of velocity
    if (type==1) {
      fill(75);
      stroke(0);
      pushMatrix();
      translate(location.x, location.y);
      ellipse(0, 0, 10, 10);
      popMatrix();
    }
    else 
      if (type==2) {
      // Draw a circle rotated in the direction of velocity
      fill(175);
      stroke(0);
      pushMatrix();
      translate(location.x, location.y);
      ellipse(0, 0, 10, 10);
      popMatrix();
    }
  }//end of display method


  void keyPressed() {
    if (key == 'e'|| key == 'E') {
      goToExit = !goToExit;
    }
  }//end of keyReleased method

  void arrive(PVector target) {
    PVector desired = PVector.sub(target, location);  // A vector pointing from the location to the target
    float d = desired.mag();
    // Normalize desired and scale with arbitrary damping within 100 pixels
    desired.normalize();

    // Steering = Desired minus Velocity
    PVector steer = PVector.add(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    location.sub(steer);
  }

  //     void applyForce(PVector force) {
  //    // We could add mass here if we want A = F / M
  //    acceleration.add(force);
  //  }
}//end of Agent class

class Behaviour {
  ArrayList<Agent> agents;


  Behaviour() {
    initAgents();
  }

  void initAgents() {
    agents = new ArrayList();
    for (int i = 0; i< no_of_agents; i++) {
      Agent agent = (new Agent(random(width), random(height), 1)); //adding new agent
      agents.add(agent);
    }
  }



  void update() {


    for (Agent agent : agents) {

      agent.run(agents);
    }
  }




  void run() {
    for (Agent agent : agents) {
      agent.display();
    }
    update();
  }
}


ControlP5 controlP5;
CheckBox checkbox;
int myColor = color(255);
boolean toggleValue = false;
public int bNum = 10;
public int pNum = 2;
public int oNum = 5;

public boolean pause = true; // Bounded within world
public boolean debug = false; // Display viewing fields and more
public boolean goToExit = false;

void controlsInit() {

  controlP5 = new ControlP5(this);

  ControlGroup ui = controlP5.addGroup("Settings", 10, 10, 215);
  ui.setBackgroundColor(color(80, 200));
  ui.setBackgroundHeight(590);
  ui.mousePressed(); // Menu is hidden by default



  Slider sliderAgent = controlP5.addSlider("Number of Agents")
    .setColorLabel(myColor)
      .setValue(7)
        .setSize(120, 20)
          .setPosition(5, 10)
            .setRange(0, 50);
  ;

  Slider sliderObstacles = controlP5.addSlider("Number of Obstacles")
    .setColorLabel(myColor)
      .setValue(30)
        .setSize(120, 20)
          .setPosition(5, 50)
            ;

  Toggle togglepause = controlP5.addToggle("Pause")
    .setPosition(5, 150)
      .setSize(50, 20)
        .setValue(true)
          .setColorLabel(myColor)
            .setMode(ControlP5.SWITCH)
              ;

  Toggle reloadButton = controlP5.addToggle("Reload")
    .setPosition(5, 100)
      .setSize(50, 20)
        .setValue(true)
          .setColorLabel(myColor)
            .setMode(ControlP5.SWITCH)
              ;


  Textarea keyboardCommands = controlP5.addTextarea("Evacuate ")
    .setPosition(5, 250)
      .setSize(250, 200)
        .setFont(createFont("arial", 12))
          .setLineHeight(14)
            .setColor(myColor);

  keyboardCommands.setText("OTHER INSTRUCTIONS\n"
    +"__________________________\n\n"
    +"Press E to Evacuate agents\n"
    +"Press W for Wander state  \n"
    +"Press R to Reload sketch  \n"
    +"Press P to Pause sketch   \n"


    );





  Textarea credits = controlP5.addTextarea("Credits ")
    .setPosition(5, 490)
      .setSize(250, 200)
        .setFont(createFont("arial", 9))
          .setLineHeight(10)
            .setColor(myColor);


  credits.setText("Agent Based Crowd Modelling\n"
    +"By         \n"
    +"David Laoye  \n"
    +"The Robert Gordon University  \n"
    +"Software Technology with multimedia   \n"
    +"Supervisor  \n"
    +"Dr David Lonie  \n"
    );




  Toggle toggleDebug = controlP5.addToggle("Debug")
    .setPosition(5, 200)
      .setSize(50, 20)
        .setValue(true)
          .setColorLabel(myColor)
            .setMode(ControlP5.SWITCH)
              ;



  sliderAgent.setId(1);
  sliderObstacles.setId(2);
  togglepause.setId(3);
  reloadButton.setId(4);
  credits.setId(5);
  keyboardCommands.setId(6);
  toggleDebug.setId(7);


  sliderAgent.setGroup(ui);
  sliderObstacles.setGroup(ui);
  togglepause.setGroup(ui);
  reloadButton.setGroup(ui);
  credits.setGroup(ui);
  keyboardCommands.setGroup(ui);
  toggleDebug.setGroup(ui);
}

void updateWorld(int bn) {
  if (bn > no_of_agents) {
    no_of_agents = bn;
    while (behaviour.agents.size () < no_of_agents) {
      Agent agent = new Agent(random(width), random(height), 1);
      behaviour.agents.add(agent);
    }
  }
  else if (bn < no_of_agents) {
    no_of_agents = bn;
    while (behaviour.agents.size () > no_of_agents) {
      behaviour.agents.remove(0);
    }
  }

  if (bn > no_of_obstacles) {
    no_of_obstacles = bn;
    while (obstacles.size () < no_of_obstacles) {
      Obstacle obstacle = new Obstacle(random(width)*0.9, random(height), 50, 50);
      obstacles.add(obstacle);
    }
  }
  else if (bn < no_of_obstacles) {
    no_of_obstacles = bn;
    while (obstacles.size () >  no_of_obstacles) {
      obstacles.remove(0);
    }
  }
}


void restoredefault() {
  updateWorld(40);
  controlP5.controller("Number of Agents").setValue(7);
  controlP5.controller("Number of Obstacles").setValue(30);
}



void controlEvent(ControlEvent theEvent) {
  switch(theEvent.controller().id()) {

  case 1: 
    { 
      updateWorld(no_of_obstacles = (int)theEvent.controller().value());
      break;
    }
  case 2: 
    { 
      updateWorld(no_of_agents = (int)theEvent.controller().value());
      break;
    }
  case 3:
    {
      pause = (theEvent.controller().value() == 1.0) ? true : false;
      break;
    }



  case 4: 
    { 
      restoredefault();
      break;
    }

  case 6:
    {
      debug = (theEvent.controller().value() == 1.0) ? true : false;
      break;
    }
  }
}

public class Object {
  public float x;
  public float y;

  public Object(float x_, float y_) {
    x = x_;
    y = y_;
  }
}

class Obstacle extends Object {
  PVector location = new PVector();
  float w, h;
  float obstacleRadius;
  private float topEdge;
  private float bottomEdge;
  private float leftEdge;
  private float rightEdge;
  float aura;

  Obstacle(float x_, float y_, float w_, float h_) {
    super(x_, y_);
    this.location.x = x;
    this.location.y = y;
    w = w_;
    h = h_;
    obstacleRadius = (w_*0.5)+(h_*0.5);
    aura = obstacleRadius+10 ;
  }

  void display() {


    stroke(0);
    fill(175);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0, 0, 30, 30);
    popMatrix();

    fill(127, 225, 0, 95);
    noStroke();
    ellipse(location.x, location.y, aura, aura);
  }


  void display2() {
    stroke(0);
    fill(175);
    rectMode(CENTER);
    rect(location.x, location.y, w, h);


    noStroke();
    stroke(0);
    fill(127, 225, 0, 95);
    rectMode(CENTER);
    rect(location.x, location.y, aura, aura);
  }

  void obstacledebug() {
    noStroke();
    stroke(0);
    fill(127, 225, 0, 95);
    rectMode(CENTER);
    fill(50);
    noStroke();
    rect(location.x, location.y, aura, aura);
  }

  PVector getLocation() {
    return location;
  }
}

class TargetArea {


  PVector targetLocation;

  TargetArea() {

    targetLocation = new PVector();
  }



  void display() {
    String msg = ("SAFE AREA");

    rect(1800, 900, 200, 200); //safe zone
    textAlign(CENTER );
    text(msg, 1800, 900);
    //fill(255);
  }
}



