

int numberOfParticles = 128;
int numberOfCentroids = 6;


int counter = 0;

ArrayList particles, centroids;

void setup() {

  size(900, 450);
  background(0);
  smooth();

  particles = new ArrayList();
  centroids = new ArrayList();

  for (int i = 0; i < numberOfParticles; i++) {
    particles.add(new c_Particle());
  }

  for (int i = 0; i < numberOfCentroids; i++) {
    centroids.add(new c_Centroid(i, random(255), random(255), random(255)));
  }

  TickSim();
}

void draw() {

  background(0);

  counter++;
  
  TickSim();

  if (counter > 100) { 
    
    counter = 0;
    
    particles.clear(); centroids.clear();
    
      for (int i = 0; i < numberOfParticles; i++) {
    particles.add(new c_Particle());
  }

  for (int i = 0; i < numberOfCentroids; i++) {
    centroids.add(new c_Centroid(i, random(255), random(255), random(255)));
  }
  }

  for (int i = 0; i < particles.size(); i++) {

    c_Particle curParticle = (c_Particle) particles.get(i);

    curParticle.drawParticle();
  }  

  for (int i = 0; i < centroids.size(); i++) {

    c_Centroid curCentroid = (c_Centroid) centroids.get(i);

    curCentroid.drawCentroid();
  }
}



void TickSim() {

  for (int i = 0; i < particles.size(); i++) {

    c_Particle curParticle = (c_Particle) particles.get(i);

    curParticle.FindClosestCentroid(centroids);
  }  

  for (int i = 0; i < centroids.size(); i++) {

    c_Centroid curCentroid = (c_Centroid) centroids.get(i);

    curCentroid.Tick(particles);
  }
}


class c_Particle {

  PVector position;
  PVector velocity;
  int centroidIndex;
  float colorR, colorG, colorB;

  c_Particle() {

    position = new PVector(random(900), random(450));
  }

  void FindClosestCentroid(ArrayList _centroids) {

    int closestCentroidIndex = 0;
    float closestDistance = 100000;

    // find which centroid is the closest
    for (int i = 0; i < _centroids.size(); i++) {      
      c_Centroid curCentroid = (c_Centroid) _centroids.get(i);

      float distanceCheck = position.dist(curCentroid.position); 

      if (distanceCheck < closestDistance)
      {
        closestCentroidIndex = i;
        closestDistance = distanceCheck;
      }
    }

    // now that we have the closest centroid chosen, assign the index,
    centroidIndex = closestCentroidIndex;

    // and grab the color for the visualization    
    c_Centroid curCentroid = (c_Centroid) _centroids.get(centroidIndex);
    colorR = curCentroid.colorR;
    colorG = curCentroid.colorG;
    colorB = curCentroid.colorB;
  }

  void drawParticle() {

    pushMatrix();
      translate(position.x, position.y);
      noStroke();    
      fill(colorR, colorG, colorB, 255);
      ellipse(0, 0, 5, 5);
    popMatrix();
  }
}


class c_Centroid {

  PVector position;
  float colorR, colorG, colorB;
  int internalIndex;

  c_Centroid(int _internalIndex, float _r, float _g, float _b) {

    position = new PVector(random(900), random(450));
    colorR = _r;
    colorG = _g;
    colorB = _b;
    internalIndex = _internalIndex;
  }

  void Tick(ArrayList _particles) {

    //println("-----------------------");
    //println("K-Means Centroid Tick");

    // move the centroid to its new position

    PVector newPosition = new PVector(0.0, 0.0);

    float numberOfAssociatedParticles = 0;

    for (int i = 0; i < _particles.size(); i++) {

      c_Particle curParticle = (c_Particle) _particles.get(i);

      if (curParticle.centroidIndex == internalIndex) {
        newPosition.add(curParticle.position); 
        numberOfAssociatedParticles++;
      }
    }

    newPosition.div(numberOfAssociatedParticles);
    position = newPosition;
  }

  void drawCentroid() {

    pushMatrix();

    translate(position.x, position.y);
    noStroke();
    fill(colorR, colorG, colorB, 128);
    ellipse(0, 0, 20, 20);

    popMatrix();
  }
}

