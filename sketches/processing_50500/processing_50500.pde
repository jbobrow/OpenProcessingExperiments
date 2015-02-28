
import guicomponents.*;

import game2dai.utils.*;
import game2dai.steering.*;
import game2dai.maths.*;
import game2dai.fsm.*;
import game2dai.entityshapes.*;
import game2dai.entities.*;
import game2dai.graph.*;
import game2dai.*;

import java.awt.Point;
import java.awt.Rectangle;

Domain wd;
World world;
Building[] buildings;
Obstacle[] stalls;
Vehicle[] tourists, patrolLeader;

Graph routes;
GraphNode[] nodes;
GraphNode dest = null;
GraphEdge[] edges;

StopWatch watch;

int partSize = 200, partOverlap = 80;
int nbrTourists = 1000;
int nbrPatrols = 9;
int followPatrol = -1;
int displayBorderX = 80, displayBorderY = 80;
Rectangle displayArea;
int count = 0;
float HALF_CITY_SIZE = 4000;
boolean draggable = true;

void setup() {
  size(640, 480);
  cursor(CROSS);
  displayArea = new Rectangle(0, 0, 480, 480);

  world = new World(480, height, partSize, partOverlap);
  world.panPixelX(width/2);
  world.panPixelY(height/2);
  world.setScale(0.9f);
  world.setNoOverlap(true);

  wd = new Domain(-HALF_CITY_SIZE-80, -HALF_CITY_SIZE-80, HALF_CITY_SIZE+80, HALF_CITY_SIZE+80);
  // Get the navigation map
  routes = Graph.makeFromXML(this, "d002_graph.xml");
  nodes = routes.getNodeArray();
  edges = routes.getAllEdgeArray();

  // Create the buildings
  buildings = Building.makeFromXML(this, "d002_building.xml");
  int bcol = 0;
  for (Building b : buildings) {
    bcol = color(random(160, 200), random(160, 200), random(160, 200));
    BuildingPic bpic = new BuildingPic(this, bcol, color(0), 4.0f);
    b.setRenderer(bpic);
    world.addBuilding(b);
  }

  // Create all the moving objects - start with the patrol
  SB sb = new SB();	// steering behaviour used as base for others
  sb.setWallAvoidDetails(3, 2.8, 20);
  sb.enableBehaviours(SBF.WALL_AVOID);
  // Create the patrols
  patrolLeader = new Vehicle[nbrPatrols];
  for (int i = 0; i < patrolLeader.length; i++) {
    makePatrol(i);
  }

  // Now create the tourists
  sb.setWanderDetails(12, 10, 100);
  SB touristSB = (SB) sb.clone();
  touristSB.enableBehaviours(SBF.WANDER | SBF.WALL_AVOID);
  touristSB.setWanderDetails(300, 20, 80);
  touristSB.setWallAvoidDetails(3, 2.8, 20);
  tourists = new Vehicle[nbrTourists];
  for (int i = 0; i < tourists.length; i++) {
    tourists[i] = new Vehicle( new Vector2D(random(-HALF_CITY_SIZE, HALF_CITY_SIZE), random(-HALF_CITY_SIZE, HALF_CITY_SIZE)), 8, 
    new Vector2D(40 * (random(1.0f) - 0.5f), 40 * (random(1.0f) - 0.5)), 40 + 28 * random(1.0f), 
    new Vector2D(random(1.0f) - 0.5f, random(1.0f) - 0.5f), 1, 1, 700);
    PersonPic apic = new PersonPic(this, 10, color(255, 160, 255), color(145, 64, 47), color(0), 1);
    tourists[i].setSB((SB) touristSB.clone());
    tourists[i].setRenderer(apic);
    tourists[i].setWorldDomain(wd);
    world.addMover(tourists[i]);
  }
  createGUI();
  customGUI();
  frameRate(200);
  watch = new StopWatch(); // last thing to be done in setup
}

void customGUI() {
  sdrScale.setBorder(1);
  label1.setTextAlign(GAlign.CENTER);
  label2.setTextAlign(GAlign.CENTER);
  lblBuildings.setText("" + world.nbr_buildings);
  lblWalls.setText("" + world.nbr_walls);
  lblPeople.setText("" + world.nbr_movers);
  lblNodes.setText("" + routes.getNbrNodes());
  lblEdges.setText("" + routes.getNbrEdges());
}

void makePatrol(int patrolNumber) {
  // Get start and end nodes
  float x0, x1, y0, y1, dx, dy;
  GraphNode start, dest;
  Vehicle[] troop;
  troop = Vehicle.makeFromXML(this, "d002_patrol.xml");
  do {
    x0 = random(-HALF_CITY_SIZE, HALF_CITY_SIZE);
    y0 = random(-HALF_CITY_SIZE, HALF_CITY_SIZE);
    x1 = random(-HALF_CITY_SIZE, HALF_CITY_SIZE);
    y1 = random(-HALF_CITY_SIZE, HALF_CITY_SIZE);
  } 
  while (abs (x1-x0) < 500 && abs(y1-y0) < 500);
  start = routes.getNodeNearest(x0, y0, 0);
  dest = routes.getNodeNearest(x1, y1, 0);

  SB sb = new SB();	// steering behaviour used as base for others
  sb.setWallAvoidDetails(5, 2.8, 20);
  sb.enableBehaviours(SBF.WALL_AVOID);	
  for (int i = 0;  i < troop.length; i++) {
    troop[i].setPosBy(start.xf(), start.yf());
    PersonPic apic = new PersonPic(this, 10, color(160, 160, 255), color(160, 144, 70), color(0), 1);
    SB patrolSB = (SB) sb.clone();
    if (i == 0) {
      apic.setFill(color(100, 100, 255));
      patrolSB.enableBehaviours(SBF.PATH);
      patrolSB.setWeight(SBF.ARRIVE, 900);
    }
    else {
      patrolSB.enableBehaviours(SBF.OFFSET_PURSUIT);
      patrolSB.setWeight(SBF.OFFSET_PURSUIT, 30);
      patrolSB.setPursuitOffset(Vector2D.sub(troop[i].getPos(), troop[0].getPos()));
      patrolSB.setAgent(SBF.AGENT_TO_PURSUE, troop[0]);
    }
    troop[i].setSB(patrolSB);
    troop[i].setRenderer(apic);
    troop[i].setWorldDomain(wd);
    world.addMover(troop[i]);
  }
  troop[0].getSB().addToPath(routes, dest);
  patrolLeader[patrolNumber] = troop[0];
}

void draw() {
  float deltaTime = (float) watch.getElapsedTime();
  updatePatrolRoutes();
  if (followPatrol >= 0) {
    Point p = world.world2pixel(patrolLeader[followPatrol].getPos(), null);
    int dx = 0, dy = 0;
    if (p.x < displayBorderX)
      dx = displayBorderX - p.x;
    else if (p.x > displayArea.width - displayBorderX)
      dx = displayArea.width - displayBorderX - p.x;		
    if (p.y < displayBorderY)
      dy = displayBorderY - p.y;
    else if (p.y > height - displayBorderY)
      dy = height - displayBorderY - p.y;
    world.panPixelXY(dx, dy);
  }
  background(250);
  pushMatrix();
  translate((float)world.getXoffset(), (float)(world.getYoffset()));
  scale((float) world.getViewScale());
  world.update(deltaTime);
  world.draw();
  popMatrix();
  fill(255, 220, 255);
  noStroke();
  rect(displayArea.width, 0, width - displayArea.width, height);
  if (count++ % 60 == 0) {
    lblFramerate.setText(""+frameRate);
    lblUpdateTime.setText("" + (float)world.worldUpdateTime);
  }
}

void updatePatrolRoutes() {
  GraphNode dest;
  for (int i = 0; i < patrolLeader.length; i++) {
    if (patrolLeader[i].getSB().getPath().size() < 3) {
      float x = random(-HALF_CITY_SIZE, HALF_CITY_SIZE);
      float y = random(-HALF_CITY_SIZE, HALF_CITY_SIZE);
      dest = routes.getNodeNearest(x, y, 0);
      patrolLeader[i].getSB().addToPath(routes, dest);
    }
  }
}

void mousePressed() {
  draggable = (mouseX >= displayArea.x 
  && mouseY >= displayArea.y 
  && mouseX < displayArea.x + displayArea.width 
  && mouseY <= displayArea.y + displayArea.height);
}

void mouseReleased() {
  draggable = false;
}

void mouseDragged() {
  if (draggable && followPatrol < 0)
    world.panPixelXY(mouseX - pmouseX, mouseY - pmouseY);
}


