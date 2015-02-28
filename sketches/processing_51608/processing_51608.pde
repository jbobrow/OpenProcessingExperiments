
int numberOfParticles = 1024;
int numberOfCentroids = 12;


int counter = 0;

ArrayList particles, centroids;

void setup() {

  size(900, 450);
  background(255);
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

  if (counter > 300) { 
    
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

    //curCentroid.drawCentroid();
  }
}



void TickSim() {

  for (int i = 0; i < particles.size(); i++) {

    c_Particle curParticle = (c_Particle) particles.get(i);
    

    curParticle.FindClosestCentroid(centroids);
    curParticle.tick();
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

    position = new PVector(450+random(-1,1), 225+random(-1,1));
    velocity = new PVector(0.0, 0.0);
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

  void tick(){
    
     velocity.x += noise(position.y, velocity.y, frameCount);
     velocity.y += noise(position.x, velocity.x, frameCount);
     velocity.x -= noise(position.x, position.y, frameCount);
     velocity.y -= noise(position.y, position.x, frameCount);
     
     velocity.x *= 0.99;
     velocity.y *= 0.99;
     
     position.add(velocity);
     
     if(position.x > 900) { position.x = position.x - 900; }
     if(position.y > 450) { position.y = position.y - 450; }
     if(position.x < 0) { position.x = 900 + position.x; }
     if(position.y < 0) { position.y = 450 + position.y; }
          
    
  }

  void drawParticle() {

    pushMatrix();
      translate(position.x, position.y);
      noStroke();    
      fill(colorR, colorG, colorB, 128);
      ellipse(0, 0, 4, 4);
    popMatrix();
  }
}


class c_Centroid {

  PVector position;
  float colorR, colorG, colorB;
  int internalIndex;

  c_Centroid(int _internalIndex, float _r, float _g, float _b) {

    position = new PVector(random(400,500), random(150,300));
    colorR = _r;
    colorG = _g;
    colorB = _b;
    internalIndex = _internalIndex;
  }

  void Tick(ArrayList _particles) {

    //println("-----------------------");
    //println("K-Means Centroid Tick");

    // move the centroid to its new position

    PVector newPosition = new PVector(450.0, 225.0);

    float numberOfAssociatedParticles = 0;

    for (int i = 0; i < _particles.size(); i++) {

      c_Particle curParticle = (c_Particle) _particles.get(i);

      if (curParticle.centroidIndex == internalIndex) {
        newPosition.add(curParticle.position); 
        numberOfAssociatedParticles++;
      }
    }

    if(numberOfAssociatedParticles > 2){
      newPosition.div(numberOfAssociatedParticles);
      position = newPosition;
    }
    else { position.set(450.0, 225.0, 0.0); }
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
                                                                
