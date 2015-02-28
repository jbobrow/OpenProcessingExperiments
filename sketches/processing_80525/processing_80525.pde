
City[] cities;
int g = 600;  // grid size
int n = 15;   // number of cities
int time;
int fr = 24;  // frame rate
float r = 170; // link radius
PVector pv, m;
int from, to;
boolean mouseRel, route, printRoute, printRoutes; // mouse released?, a route calculated?
ArrayList<Route> routes; // for recording successful routes to destination
float minDistance, x, y;
int quickestRoute; // -1 an initial value to represent empty list
int prcount;
Search seekem;
boolean firstrun = true;

//import processing.video.*;
//MovieMaker mm;

void setup() {
  size(640, 480);
  frameRate(fr);
  rectMode(CENTER);
  fill(0);
  from = -1;
  to = -1;
  route = false;
  printRoute = false;
  printRoutes = false;
  minDistance = 10000;
  quickestRoute = -1;
  textSize(18);
  smooth();

  float w = width/n;
  float h = height/n;
  cities = new City[n];

  for (int i=0; i<n; i++) cities[i] = new City(new PVector(int(random(width)), int(random(100, height))), i);

  for (City c:cities) {
    for (int i=0; i<n; i++) {
      if (c.id != i) {
        pv = PVector.sub(c.p, cities[i].p);
        if (pv.mag() < r) c.links.add(new L(i, pv.mag()));
      }
    }
  }
  routes = new ArrayList<Route>();
}

void draw() {
  background(20);
  m = new PVector(mouseX, mouseY);

  stroke(150);
  for (City c:cities) c.drawLinks();

  for (City c:cities) {
    c.mouse();
    c.draw();
  }

  if (!route && from > -1 && to > -1) calcRoute();
  //else printRoute

    if (mouseRel) mouseRel = false;
  if (routes.size()>0) {
    if (printRoute && !printRoutes) {
      stroke(255, 0, 0);
      strokeWeight(2);
      for (int i=0; i<routes.get(quickestRoute).cities.size(); i++) {
        if (i>0) {
          int a = routes.get(quickestRoute).cities.get(i-1);
          int b = routes.get(quickestRoute).cities.get(i);
          line(cities[a].p.x, cities[a].p.y, cities[b].p.x, cities[b].p.y);
        }
      }
      strokeWeight(1);
    }
    if (printRoutes && printRoute) {
      if (prcount >= routes.size()) printRoutes = false;
      else {
        strokeWeight(2);
        stroke(0, 0, 200);
        for (int i=0; i<routes.get(prcount).cities.size(); i++) {
          if (i>0) {
            int a = routes.get(prcount).cities.get(i-1);
            int b = routes.get(prcount).cities.get(i);
            line(cities[a].p.x, cities[a].p.y, cities[b].p.x, cities[b].p.y);
          }
        }
        fill(0,0,255);
        text("Displaying route " + prcount, 10, 60);
        strokeWeight(1);
      }
      prcount++;
    }
    fill(172, 51, 54);
    text(routes.size() + " possible routes", 10, 20);
    text("(" + time + " milliseconds)", 10, 40);
  }
  fill(59, 134, 214);
  textAlign(RIGHT);
  text("Quickest network path finder", width-10, 20);
  text("Click on 2 connected points", width-10, 40);
  text("'r' to reset", width-10, 60);
  text("'p' to play routes", width-10, 80);
  textAlign(LEFT);

  fill(40, 57, 96);
  text("geotheory", 10, height-15);

  // draw mouse!
  stroke(59, 134, 214);
  noFill();
  x = mouseX;
  y = mouseY;
  line(x, y+4, x, y+10);
  line(x, y-4, x, y-10);
  line(x+4, y, x+10, y);
  line(x-4, y, x-10, y);

  //  mm.addFrame();
}

void calcRoute() {
  ArrayList<Integer> newList = new ArrayList();
  time = millis();
  seekem = new Search(from, to, newList, -1, -1, 0.0);
  time = millis() - time;
  route = true;
  //println(routes.size() + " possible routes");
  for (int i=0; i<routes.size(); i++) {
    //println(routes.get(i).cities);
    if (routes.get(i).distance < minDistance) {
      minDistance = routes.get(i).distance;
      quickestRoute = i;
    }
  }
  printRoute = true;
}



class City {
  int id, rad;
  PVector p;
  ArrayList<L> links;
  boolean selected, routeSearched; // selected from/to?, already used in routing?

  City(PVector P, int ID) {
    p = new PVector(P.x, P.y);
    id = ID;
    links = new ArrayList<L>(n);
    selected = false;
    routeSearched = false;
  }

  void draw() {
    if (selected) {
      rad = 8;
      fill(255, 0, 0); 
      stroke(255, 0, 0);
    }
    else {
      rad = 6;
      fill(255); 
      stroke(255);
    }
    ellipse(p.x, p.y, rad, rad);
  }

  void drawLinks() {
    if (links.size() > 0) {
      for (int i=0; i<links.size(); i++) {
        line(p.x, p.y, cities[links.get(i).id].p.x, cities[links.get(i).id].p.y);
      }
    }
  }

  void mouse() {
    pv = PVector.sub(p, m);
    if (pv.mag() < 7 && mouseRel) {
      if (!selected) {
        if (from > -1 && to > -1) println("Too many selected " + frameCount);
        else {
          selected = true;
          if (from == -1) from = id;
          else to = id;
        }
      }
      else {
        selected = false;
        if (from == id) from = -1;
        if (to == id) to = -1;
      }
    }
  }
}

class L { // class for links
  int id;  // id of linked city
  float d; // distance to city

  L(int ID, float D) {
    id = ID;
    d = D;
  }
}

class Search {
  int id; // city ID
  int goal; // destination
  int parentRef; // parent's link index for this city
  int parent;  // parent's ID
  ArrayList<Integer> parents; // cities of origin
  ArrayList<Search> children; // cities to search
  float travelled;   // total distance of route so far

  Search(int ID, int GOAL, ArrayList PARENTS, int PARENT, int PARENTREF, float TRAVELLED) {
    id = ID;
    goal = GOAL;
    parentRef = PARENTREF;
    parent = PARENT;
    parents = new ArrayList<Integer>();
    parents.addAll(PARENTS);
    parents.add(id);
    travelled = TRAVELLED;
    children = new ArrayList();
    float totalDist;

    //println("CITY " + id);
    //for (int i=0; i<parents.size(); i++) println("parent " + i + " = " + parents.get(i));

    if (id == goal) { // route target reached
      //println("Target reached!!");
      routes.add( new Route( parents, travelled) );
    }
    else {
      int s = cities[id].links.size();
      //println("Links size: " + s);
      if (s > 0) {
        for (int i=0; i<s; i++) { // iterate through city's links
          int dest = cities[id].links.get(i).id;         // link's city ID
          //println("Link from " + id + " to " + dest);
          if (!parents.contains(dest)) {
            //println(dest + " is new");
            totalDist = travelled + cities[id].links.get(i).d; // distance to child
            children.add( new Search(dest, goal, parents, id, i, totalDist) );
          }
          //else println(dest + " is NOT new");
        }
      }
    }
  }
}

class Route {
  ArrayList<Integer> cities;
  float distance;

  Route(ArrayList CITIES, float DISTANCE) {
    cities = CITIES;
    distance = DISTANCE;
  }
}



void keyPressed() {
  if (key=='r') setup();
  if (key=='p') {
    printRoutes = !printRoutes;
    prcount = 0;
  }
  //  if (key=='f') mm.finish();
}

void mouseReleased() {
  mouseRel = true;
}

