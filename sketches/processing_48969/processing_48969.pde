
import game2dai.utils.*;
import game2dai.steering.*;
import game2dai.maths.*;
import game2dai.fsm.*;
import game2dai.entityshapes.*;
import game2dai.entities.*;
import game2dai.graph.*;
import game2dai.*;

import java.awt.Point;

World world;
Domain wd;

Building[] buildings;
Obstacle[] stalls;
Vehicle[] tourists;
Vehicle[] patrol;
Graph routes;
GraphNode[] nodes;
GraphNode dest = null;
int[] stallCol1, stallCol2;
StopWatch watch;

int partSize = 200, partOverlap = 40;

void setup() {
  size(700, 600);
  cursor(CROSS);
  stallCol1 = new int[] { 
    color(174, 44, 79), color(255, 227, 40)
  };
  stallCol2 = new int[] { 
    color(1, 8, 99), color(251, 190, 37), color(228, 4, 4), color(14, 143, 86)
  };

  world = new World(width, height, partSize, partOverlap);
  world.setNoOverlap(true);

  wd = new Domain(0, 0, width, height);
  // Get the navigation map
  routes = Graph.makeFromXML(this, "d001_graph.xml");
  nodes = routes.getNodeArray();
  // Create the buildings
  buildings = Building.makeFromXML(this, "d001_buildings.xml");
  for (Building b : buildings) {
    BuildingPic bpic = new BuildingPic(this, color(200, 96, 96), color(0), 2.0f);
    b.setRenderer(bpic);
    world.addBuilding(b);
  }
  // Create the market stalls (round bits)
  stalls = Obstacle.makeFromXML(this, "d001_obstacles.xml");
  for (Obstacle stall : stalls) {
    StallPic opic = new StallPic(this, stall.getColRadius(), stallCol2);
    stall.setRenderer(opic);
    world.addObstacle(stall);
  }
  // Create all the moving objects - start with the patrol
  SB sb = new SB();	// steering behaviour used as base for others
  sb.setWallAvoidDetails(3, 2.8, 20);
  sb.enableBehaviours(SBF.WALL_AVOID | SBF.OBSTACLE_AVOID);
  // Create the patrol
  patrol = Vehicle.makeFromXML(this, "d001_patrol.xml");
  for (int i = 0;  i < patrol.length; i++) {
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
      patrolSB.setPursuitOffset(Vector2D.sub(patrol[i].getPos(), patrol[0].getPos()));
      patrolSB.setAgent(SBF.AGENT_TO_PURSUE, patrol[0]);
    }
    patrol[i].setSB(patrolSB);
    patrol[i].setRenderer(apic);
    patrol[i].setWorldDomain(wd);
    world.addMover(patrol[i]);
  }
  // Now create the tourist
  sb.setWanderDetails(10, 10, 70);
  SB touristSB = (SB) sb.clone();
  touristSB.enableBehaviours(SBF.WANDER);
  touristSB.setWanderDetails(100, 10, 70);
  touristSB.setWallAvoidDetails(3, 2.8, 20);
  tourists = Vehicle.makeFromXML(this, "d001_people.xml");
  for (Vehicle tourist : tourists) {
    PersonPic apic = new PersonPic(this, 10, color(255, 160, 255), color(145, 64, 47), color(0), 1);
    tourist.setSB((SB) touristSB.clone());
    tourist.setRenderer(apic);
    tourist.setWorldDomain(wd);
    world.addMover(tourist);
  }
  watch = new StopWatch(); // last thing to be done in setup
}

public void draw() {
  float deltaTime = (float) watch.getElapsedTime();
  background(220);
  showNodes();
  world.update(deltaTime);
  if (!patrol[0].getSB().isBehaviourOn(SBF.PATH))
    patrol[0].setVelocity(new Vector2D());
  world.draw();
}

public void mouseMoved() {
  dest = routes.getNodeNear(mouseX, mouseY, 0, 10);
}

public void mouseClicked() {
  if (dest != null)
    patrol[0].getSB().addToPath(routes, dest);
}

public void showNodes() {
  pushStyle();
  fill(200, 128);
  noStroke();
  int r;
  ellipseMode(CENTER);
  for (GraphNode node : nodes) {
    if (dest == null || dest != node) {
      r = 8;
      fill(0, 200, 0);
    }
    else {
      r = 24;
      fill(0, 128, 0);
    }
    ellipse(node.xf(), node.yf(), r, r);
  }
  popStyle();
}



