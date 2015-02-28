
import processing.opengl.*;

import codeanticode.glgraphics.*;

import peasy.*;

ArrayList dots;
ArrayList clust;
int nrDots = 400;
int nrClust = 50;
PFont fontA;
float rotation = 0;
boolean looping, showing;


void setup () {
  size (800, 600, OPENGL);
  fontA = loadFont("Tahoma-18.vlw");
  textFont(fontA, 14);
  background (0);
  dots = new ArrayList ();
  for (int i = 0; i< nrDots; i++) {
    dots.add (new Dott (new PVector (random (0, width/2), random (0, height/2), random (0, height/2)), 0));
  }
  clust = new ArrayList ();
  for (int i = 0; i< nrClust; i++) {
    clust.add (new Dott (new PVector (random (200, width-200), random (100, height-100), 0), i));
  }
  looping = true;
  showing = false;
  //clust =  canopy(dots);
}

void draw () {
  background (0);
  if (showing) {
    pushMatrix();
    translate(300, 200, -100);
    rotateY(radians(rotation));
    find();
    display ();
    moveit();
    popMatrix();
    rotation ++;
  }
  else {
    text ("Click screen or Refresh button to start", 300, 300);
  }
  
}

void stopShowing () {
  showing = false;
}


void mousePressed () {
  showing = true;
  initPoints();
}

void initPoints () {
  looping = true;
  showing = true;
  dots = new ArrayList ();
  for (int i = 0; i< nrDots; i++) {
    dots.add (new Dott (new PVector (random (0, width/2), random (0, height/2), random (0, height/2)), 0));
  }
  clust = new ArrayList ();
  for (int i = 0; i< nrClust; i++) {
    clust.add (new Dott (new PVector (random (200, width-200), random (100, height-100), 0), i));
  }
}

void initValues (int clusters, int points) {
  nrDots = points;
  nrClust = clusters;
  looping = true;
  showing = true;
  dots = new ArrayList ();
  for (int i = 0; i< nrDots; i++) {
    dots.add (new Dott (new PVector (random (0, width/2), random (0, height/2), random (0, height/2)), 0));
  }
  clust = new ArrayList ();
  for (int i = 0; i< nrClust; i++) {
    clust.add (new Dott (new PVector (random (200, width-200), random (100, height-100), 0), i));
  }
}


void display () {
  //println ("dots " + dots.size());
  fill (255, 255, 255);
  for (int i = 0; i< dots.size(); i++) {
    Dott dot1 = (Dott) dots.get (i);
    PVector dotte = dot1.getCoords();
    fill (map (dot1.getAss(), 0, nrClust, 100, 255), map (dot1.getAss(), 0, nrClust, 10, 255), map (dot1.getAss(), 0, nrClust, 250, 0));
    point (dotte.x, dotte.y, dotte.z);
    pushMatrix();
    translate (dotte.x, dotte.y, dotte.z);
    box(4);
    popMatrix();
    //rect (dotte.x, dotte.y, 4, 4);
    //text (dot1.getAss(), dotte.x, dotte.y);
  }  
  fill (255, 0, 0);
  for (int i = 0; i< clust.size(); i++) {
    Dott clus1 = (Dott) clust.get (i);
    PVector clusse = clus1.getCoords();
    pushMatrix();
    translate (clusse.x, clusse.y, clusse.z);
    box(8);
    popMatrix();    
    //rect (clusse.x, clusse.y, 8, 8);
    //text (clus1.getAss(), clusse.x, clusse.y);
  }
} 


void find () {
  for (int i = 0; i< dots.size(); i++) {
    Dott dot1 = (Dott) dots.get (i);
    PVector dotte = dot1.getCoords();
    int closest = -1;
    float base = 1000.0;
    for (int j = 0; j < clust.size(); j++) {
      Dott clus1 = (Dott) clust.get (j);
      PVector clusse = clus1.getCoords();
      PVector diff = PVector.sub (dotte, clusse);
      float magn = diff.mag();
      if (magn < base) {
        closest = j;
        base = magn;
      }
    }
    dot1.assigner(closest);
  }
}

float moveit () {
  float result = 0;
  ArrayList newList = new ArrayList ();
  for (int j = 0; j < clust.size(); j++) {
    Dott dot1 = new Dott();
    ;
    PVector mean = new PVector (0, 0, 0);
    int count = 0;
    for (int i = 0; i< dots.size(); i++) {
      dot1 = (Dott) dots.get (i);
      if (dot1.getAss() == j) {
        count ++;
        mean = PVector.add (mean, dot1.getCoords());
      }
    }
    mean = PVector.div (mean, (float)count);
    Dott newClu = new Dott (mean, j);
    newList.add (newClu);
  }
  for (int i = 0; i < newList.size(); i++) {
    Dott old = (Dott) clust.get(i);
    Dott newDot = (Dott) newList.get(i);
    //println (old.getCoords() + " / " +  newDot.getCoords());
    if (old.getCoords()!= null && newDot.getCoords() != null) 
      result += PVector.dist(old.getCoords(), newDot.getCoords());
    //println (">" + PVector.dist(old.getCoords(), newDot.getCoords()));
  }

  clust = newList;
  //println (result);
  return result;
}


ArrayList canopy (ArrayList input) {
  ArrayList nList = new ArrayList (input);
  ArrayList canopies = new ArrayList ();
  int t1 = 10;
  int t2 = 20;
  int counter = 0;
  int numAss = nList.size();


  while ( (nList.size () > 0) && (numAss > 0)) {
    println (numAss);
    println (canopies.size());
    int startIdx = int (random(0, nList.size() ));
    Dott starter = (Dott) nList.get (startIdx);
    PVector start = starter.getCoords();
    if (starter.getAss() == 0) {
      nList.remove (startIdx);
      canopies.add (new Dott (start, 0));
    }


    for (int i = 0; i < nList.size (); i++) {
      Dott dot1 = (Dott) nList.get (i);
      PVector dotte = dot1.getCoords(); 
      for (int j = 0; j < canopies.size(); j++) {
        Dott canope = (Dott) canopies.get(j);
        PVector canotte = canope.getCoords();
        PVector diff = PVector.sub (dotte, canotte);
        float distance = diff.mag();
        if (distance < t2) {
          dot1.assigner(j);
          numAss--;
          if (distance < t1) {
            nList.remove(i);
          }
        }
      }
    }
  }
  println (canopies.size());
  return canopies;
}

class Dott {
  PVector coords;
  int assign;
  
  Dott (PVector coo, int a) {
    coords = coo;
    assign = a;
  }
  
    Dott () {
  }
  
  void assigner (int a) {
    assign = a;
  }
  
  PVector getCoords () {
    return coords;
  }
  
  int getAss () {
    return assign;
  }
  
}
  




