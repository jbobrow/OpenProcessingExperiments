
import processing.video.*;

// Variable for capture device
Capture video;

// A variable for the color we are searching for.
color trackColor; 

ParticleSystem ps;

void setup() {
  size(640,480);
  video = new Capture(this,width,height,15);
  // Start off tracking for red
  trackColor = color(255,0,0);
  smooth();
  ps = new ParticleSystem(new PVector(width/2,50));
}

void draw() {
  // Capture and display the video
  if (video.available()) {
    video.read();
  }
  video.loadPixels();
  image(video,0,0);

  // Before we begin searching, the "world record" for closest color is set to a high number that is easy for the first pixel to beat.
  float worldRecord = 500; 

  // XY coordinate of closest color
  int closestX = 0;
  int closestY = 0;

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      // Using euclidean distance to compare colors
      float d = dist(r1,g1,b1,r2,g2,b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }
    }
  }

  // We only consider the color found if its color distance is less than 10. 
  // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
  if (worldRecord < 5) { 
    // Draw a circle at the tracked pixel
    //fill(trackColor);
    strokeWeight(4.0);
    //stroke(0);
    //ellipse(closestX,closestY,16,16);
     ps.addParticle();
     ps.origin = new PVector(closestX,closestY);
    ps.run();
  }
    //ellipse(mouseX, mouseY, 10,10); 
}

void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}




class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    float n = noise(lifespan) * 255.0;
    //stroke(143,102,0,map(lifespan, 255.0, -0.1, 70.0, 0.0));
    stroke(143,102,0,n*0.9);
    fill(242,222,107,lifespan*(n*0.9));
    //float ellipseSize = map(n, 1, 0, 0.5,1.0);
    ellipse(location.x,location.y,n*0.09,n*0.09);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}





class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    
    for(int i=0; i < particles.size(); i++){
      Particle p = (Particle) particles.get(i);
      p.run(); // not p.run(particles)
      if(p.isDead()){
      
      }
    
    }
    
   //old code
//    Iterator<Particle> it = particles.iterator();
//    while (it.hasNext()) {
//      Particle p = it.next();
//      p.run();
//      if (p.isDead()) {
//        it.remove(); 
//      }
//    }
    //end of the old code
  }
}
