
class Cluster {
  public PVector clusterCenter;
  public PVector oldCenter;
  public ArrayList<PVector> clusterPoints;
  public int cColor;
  public Cluster() {
    clusterCenter = new PVector();
    clusterPoints = new ArrayList<PVector>();
    cColor = color(random(255), random(255),random(255));  
  }
}

ArrayList<PVector> points;
ArrayList<Cluster> clusters;
int k = 5;
float easing = 0.05;

void setup() {
  size(600,600);
  background(0);
  points = new ArrayList<PVector>();
  clusters = new ArrayList<Cluster>();
  
  kMeansStandardSeed(k);
}

void mouseClicked() {
  points.add(new PVector(mouseX,mouseY));  
}

void mouseDragged() {
  int j = 20;
  points.add(new PVector(mouseX + random(-j,j),mouseY + random(-j,j)));  
}

void keyPressed() {
  switch(key) {
    case 'p': for(int i = 0; i < 20; ++i) { points.add(new PVector(random(width), random(height)));} return;
    case 'c': points.clear(); clusters.clear(); break;
  }
  
  if(clusters.isEmpty()) {
      kMeansStandardSeed(k);
  }
  
  kMeans();
}

void kMeansStandardSeed(int k) {
  if(points.isEmpty()) { return; }
    
  /* choose k centers, randomly */
  for(int i = 0; i < k; ++i) {
    Cluster c = new Cluster();
    //c.clusterCenter = points.get((int) random(0, points.size())).get();
    c.clusterCenter = points.get(i).get();
    clusters.add(c);  
  }  
}

void kMeansPlusPlusSeed(int k) {
    Cluster c = new Cluster();
    c.clusterCenter = points.get((int) random(0, points.size())).get();
    clusters.add(c);
    
    for(int i = 1; i < k; ++i) {
      c = new Cluster();
      for(PVector v : points) {
        /* get proba */
        c.clusterCenter = points.get((int) random(0, points.size())).get();
      }
      clusters.add(c);  
  } 
  
}

Cluster getClosest(PVector point) {
  float distance;
  float minDistance = width * height;
  Cluster closest = clusters.get(0);
  for(Cluster ci : clusters) {
       distance = point.dist(ci.clusterCenter);
       if(distance <= minDistance) {
          closest = ci;
          minDistance = distance;
       }
  }
  return closest;
}

void kMeans() {
  if(points.isEmpty()) { return; }
  
  /* put points into cluster which is the closest */
  float distance = 0;
  float minDistance;
  
  /* clean previous clusters */
  for(Cluster c : clusters) {
    c.clusterPoints.clear();  
  }
  
  for(PVector v : points) {    
    minDistance = width * height * width;
    Cluster closest = clusters.get(0);  
    for(Cluster ci : clusters) {
       distance = v.dist(ci.clusterCenter);
       if(distance <= minDistance) {
          closest = ci;
          minDistance = distance;
       }
    }
    //println(i + " " + clusters.indexOf(closest) + " " + distance);
    closest.clusterPoints.add(v);
  }
  
  /* Update cluster center */
  for(Cluster ci : clusters) {
    ci.oldCenter = ci.clusterCenter;
    PVector newCenter = new PVector();
    for(PVector point : ci.clusterPoints) {
      newCenter.add(point);
    }
    newCenter.div(ci.clusterPoints.size());
    ci.clusterCenter = newCenter;
  }
}

void draw() {
  background(0);
  for(PVector v : points) {
    //fill(color(random(255), random(255),random(255)));
    fill(255);
    ellipse(v.x, v.y, 5, 5);  
  }
  
  for(Cluster c : clusters) {
    PVector target = c.clusterCenter;
    c.oldCenter.add(PVector.mult(
        PVector.sub(target, c.oldCenter), easing
        )
    );
    fill(c.cColor, 127);
    stroke(c.cColor, 127);
    for(PVector p : c.clusterPoints) {
      line(c.oldCenter.x, c.oldCenter.y, p.x, p.y);
    }
    fill(c.cColor);
    ellipse(c.oldCenter.x, c.oldCenter.y, 10, 10);
  }
  
}




