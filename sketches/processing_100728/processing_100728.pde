
import processing.video.*;

int numPixels;
int[] previousFrame;
Capture video;
int movementSum;

// A path object (series of connected points)
Path path;

// Two boids
ArrayList boids;

void setup() {
  background(0);
  size(1200, 742, P2D); // Change size to 320 x 240 if too slow at 640 x 480
  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height);

  numPixels = video.width * video.height;
  // Create an array to store the previously captured frame
  previousFrame = new int[numPixels];
  loadPixels();
  smooth();

  // Call a function to generate new Path object
  newPath();

  // We are now making random boids and storing them in an ArrayList
  boids = new ArrayList();
  for (int i = 0; i < 1; i++) {
    newBoid(1200,742,0);
  }
}

void draw() {


  if (video.available()) {
    // When using video to manipulate the screen, use video.available() and
    // video.read() inside the draw() method so that it's safe to draw to the screen
    video.read(); // Read the new frame from the camera
    video.loadPixels(); // Make its pixels[] array available
    movementSum = 0;

    for (int i = 0; i < numPixels; i++) { // For each pixel in the video frame...
      color currColor = video.pixels[i];
      color prevColor = previousFrame[i];
      // Extract the red, green, and blue components from current pixel
      int currR = (currColor >> 16) & 0xFF; // Like red(), but faster
      int currG = (currColor >> 8) & 0xFF;
      int currB = currColor & 0xFF;
      // Extract red, green, and blue components from previous pixel
      int prevR = (prevColor >> 16) & 0xFF;
      int prevG = (prevColor >> 8) & 0xFF;
      int prevB = prevColor & 0xFF;
      // Compute the difference of the red, green, and blue values
      int diffR = abs(currR - prevR);
      int diffG = abs(currG - prevG);
      int diffB = abs(currB - prevB);
      // Add these differences to the running tally
      movementSum += diffR + diffG + diffB;
      // Render the difference image to the screen
      pixels[i] = color(diffR, diffG, diffB);
      // The following line is much faster, but more confusing to read
      //pixels[i] = 0xff000000 | (diffR << 16) | (diffG << 8) | diffB;
      // Save the current color into the 'previous' buffer
      previousFrame[i] = currColor;
    }
    // To prevent flicker from frames that are all black (no movement),
    // only update the screen if the image has changed.
    if (movementSum > 0) {
      println(movementSum);
      updatePixels();
      if (movementSum > 12000000) {
        if (movementSum < 100000000)
          newBoid (1195, 720, movementSum);
      }
      // Print the total amount of movement to the console


      if(boids.size() > 300) {
        boids.remove(0);
        //for(int i=1; i < boids.size(; i++){
        //boids.get(i-1) = boids.get(i); 
        //}
      }


      // Display the path
      path.display();

      for (int i = 0; i < boids.size(); i++) {
        Boid boid = (Boid) boids.get(i);
        // Path following and separation are worked on in this function
        boid.applyForces(boids,path);
        // Call the generic run method (update, borders, display, etc.)
        boid.run();
      }
    }
  }
}
void newPath() {
  // A path is a series of connected points
  // A more sophisticated path might be a curve
  path = new Path();
  float offset = 60;
  path = new Path();

  path.addPoint(1200,742);
  path.addPoint(1199,712);
  path.addPoint(1197,682);
  path.addPoint(1195,653);
  path.addPoint(1190,623);
  path.addPoint(1185,594);
  path.addPoint(1178,564);
  path.addPoint(1171,536);
  path.addPoint(1162,507);
  path.addPoint(1152,479);
  path.addPoint(1141,451);
  path.addPoint(1128,424);
  path.addPoint(1115,397);
  path.addPoint(1101,371);
  path.addPoint(1085,345);
  path.addPoint(1069,321);
  path.addPoint(1051,296);
  path.addPoint(1033,273);
  path.addPoint(1013,250);
  path.addPoint(993,228);
  path.addPoint(972,207);
  path.addPoint(950,187);
  path.addPoint(927,167);
  path.addPoint(904,149);
  path.addPoint(880,131);
  path.addPoint(855,115);
  path.addPoint(829,99);
  path.addPoint(803,85);
  path.addPoint(776,72);
  path.addPoint(749,59);
  path.addPoint(721,48);
  path.addPoint(693,38);
  path.addPoint(664,29);
  path.addPoint(636,22);
  path.addPoint(606,15);
  path.addPoint(577,10);
  path.addPoint(547,5);
  path.addPoint(518,2.4);
  path.addPoint(488,1);
  path.addPoint(458,0);
  //second square
  path.addPoint(433,2);
  path.addPoint(408,4);
  path.addPoint(384,7);
  path.addPoint(360,12);
  path.addPoint(335,18);
  path.addPoint(312,25);
  path.addPoint(288,34);
  path.addPoint(266,43);
  path.addPoint(243,54);
  path.addPoint(222,67);
  path.addPoint(201,80);
  path.addPoint(181,94);
  path.addPoint(161,110);
  path.addPoint(143,126); 
  path.addPoint(125,144); 
  path.addPoint(109,162); 
  path.addPoint(93,182);
  path.addPoint(79,202); 
  path.addPoint(66,223); 
  path.addPoint(53,244); 
  path.addPoint(42,267);
  path.addPoint(33,289); 
  path.addPoint(24,313); 
  path.addPoint(17,336); 
  path.addPoint(11,361);
  path.addPoint(6,385); 
  path.addPoint(3,409); 
  path.addPoint(1,434); 
  path.addPoint(0,459);
  //third square
  path.addPoint(1,474); 
  path.addPoint(2,490); 
  path.addPoint(4,505); 
  path.addPoint(7,520);
  path.addPoint(10,535); 
  path.addPoint(15,549); 
  path.addPoint(20,564); 
  path.addPoint(26,578);
  path.addPoint(33,592); 
  path.addPoint(41,605); 
  path.addPoint(49,618); 
  path.addPoint(58,630);
  path.addPoint(67,642); 
  path.addPoint(78,654); 
  path.addPoint(88,664); 
  path.addPoint(100,675);
  path.addPoint(112,684); 
  path.addPoint(124,693); 
  path.addPoint(137,701); 
  path.addPoint(150,709);
  path.addPoint(164,716); 
  path.addPoint(178,722); 
  path.addPoint(193,727); 
  path.addPoint(207,732);
  path.addPoint(222,735); 
  path.addPoint(237,738); 
  path.addPoint(252,740); 
  path.addPoint(268,742); 
  path.addPoint(283,742);
  //fourth square
  path.addPoint(297,741); 
  path.addPoint(312,740); 
  path.addPoint(326,737);
  path.addPoint(340,733); 
  path.addPoint(353,727); 
  path.addPoint(366,721); 
  path.addPoint(379,714);
  path.addPoint(390,705); 
  path.addPoint(402,696); 
  path.addPoint(412,686); 
  path.addPoint(421,675);
  path.addPoint(430,663); 
  path.addPoint(437,650); 
  path.addPoint(443,637); 
  path.addPoint(449,624);
  path.addPoint(453,610); 
  path.addPoint(456,596); 
  path.addPoint(457,581); 
  path.addPoint(458,567);
  //fifth square
  path.addPoint(457,556); 
  path.addPoint(456,546); 
  path.addPoint(453,536); 
  path.addPoint(449,526);
  path.addPoint(445,516); 
  path.addPoint(440,507); 
  path.addPoint(433,498); 
  path.addPoint(426,491);
  path.addPoint(419,484); 
  path.addPoint(410,477); 
  path.addPoint(401,472); 
  path.addPoint(391,467);
  path.addPoint(381,464); 
  path.addPoint(371,461); 
  path.addPoint(361,460); 
  path.addPoint(350,459);
  //sixth square
  path.addPoint(342,459); 
  path.addPoint(335,461);
  path.addPoint(328,463); 
  path.addPoint(321,466); 
  path.addPoint(314,469); 
  path.addPoint(308,474);
  path.addPoint(303,479); 
  path.addPoint(298,484); 
  path.addPoint(293,490); 
  path.addPoint(290,497);
  path.addPoint(287,504); 
  path.addPoint(285,511); 
  path.addPoint(283,518); 
  path.addPoint(283,526);
  //seventh square
  path.addPoint(283,531); 
  path.addPoint(284,535);
  path.addPoint(285,540); 
  path.addPoint(287,544); 
  path.addPoint(289,548); 
  path.addPoint(292,552);
  path.addPoint(295,555); 
  path.addPoint(298,558); 
  path.addPoint(302,561); 
  path.addPoint(306,563);
  path.addPoint(310,565); 
  path.addPoint(315,566); 
  path.addPoint(319,567); 
  path.addPoint(324,567);
  //eighth square
  path.addPoint(327,567); 
  path.addPoint(330,566);
  path.addPoint(333,566); 
  path.addPoint(335,564); 
  path.addPoint(338,563); 
  path.addPoint(340,561);
  path.addPoint(342,559); 
  path.addPoint(344,557); 
  path.addPoint(346,555); 
  path.addPoint(347,552); 
  path.addPoint(349,550); 
  path.addPoint(349,547); 
  path.addPoint(350,544); 
  path.addPoint(350,541);
  //ninth square
  path.addPoint(350,539); 
  path.addPoint(349,538);
  path.addPoint(349,536); 
  path.addPoint(348,534); 
  path.addPoint(348,533); 
  path.addPoint(347,532);
  path.addPoint(346,530); 
  path.addPoint(344,529); 
  path.addPoint(343,528); 
  path.addPoint(342,527);
  path.addPoint(340,527); 
  path.addPoint(338,526); 
  path.addPoint(337,526); 
  path.addPoint(335,526);
}
void newBoid(float x, float y, float z) {
  float maxspeed = 10;
  float maxforce = .3;
  boids.add(new Boid(new PVector(x,y),maxspeed, maxforce, z));
}






class Boid {

  // All the usual stuff
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float boidMovementSum;

  // Constructor initialize all values
  Boid( PVector l, float ms, float mf, float bm) {
    loc = l.get();
    r = 12;
    maxspeed = ms;
    maxforce = mf;
    boidMovementSum = bm;
    acc = new PVector(0,0);
    vel = new PVector(maxspeed,0);
  }

  // A function to deal with path following and separation
  void applyForces(ArrayList boids, Path path) {
    // Follow path force
    PVector f = follow(path);
    // Separate from other boids force
    PVector s = separate(boids);
    // Arbitrary weighting
    f.mult(3);
    s.mult(1);
    // Accumulate in acceleration
    acc.add(f);
    acc.add(s);

    if (loc.x < 458) {
      if (loc.y < 458)
        vel.mult(.618);
    }
    if (loc.y > 458) {
      if (loc.x < 283)
        vel.mult(.618*.618);
    }
    if (loc.x > 260) {
      if (loc.y > 567) 
        if (loc.y > 475)
          if (loc.x < 475)
            vel.mult(.618*.618*.618);
    }
    if (loc.y < 567) {
      if (loc.x > 350)
        if (loc.y > 458)
          if (loc.x < 475)
            vel.mult(.618*.618*.618*.618);
    }
    if (loc.y < 526) {
      if (loc.x > 260)
        if (loc.y > 475)
          if (loc.x < 350)
            vel.mult(.618*.618*.618*.618*.618);
    }
    if (loc.y < 567) {
      if (loc.x > 260)
        if (loc.y > 526)
          if (loc.x < 324)
            vel.mult(.618*.618*.618*.618*.618*.618);
    }
    if (loc.y < 567) {
      if (loc.x > 324)
        if (loc.y > 541)
          if (loc.x < 350)
            vel.mult(.618*.618*.618*.618*.618*.618*.618);
    }
  }


  // Main "run" function
  public void run() {
    update();

    render();
  }

  // This function implements Craig Reynolds' path following algorithm
  // http://www.red3d.com/cwr/steer/PathFollow.html
  PVector follow(Path p) {

    // Predict location 25 (arbitrary choice) frames ahead
    PVector predict = vel.get();
    predict.normalize();
    predict.mult(25);
    PVector predictLoc = PVector.add(loc, predict);

    // Draw the predicted location


    // Now we must find the normal to the path from the predicted location
    // We look at the normal for each line segment and pick out the closest one
    PVector target = null;
    PVector dir = null;
    float record = 1000000;  // Start with a very high record distance that can easily be beaten

    // Loop through all points of the path
    for (int i = 0; i < p.points.size()-1; i++) {

      // Look at a line segment
      PVector a = (PVector) p.points.get(i);
      PVector b = (PVector) p.points.get(i+1);  // Path wraps around

      // Get the normal point to that line
      PVector normal = getNormalPoint(predictLoc,a,b);

      // Check if normal is on line segment
      float da = PVector.dist(normal,a);
      float db = PVector.dist(normal,b);
      PVector line = PVector.sub(b,a);
      // If it's not within the line segment, consider the normal to just be the end of the line segment (point b)
      if (da + db > line.mag()+1) {
        normal = b.get();
        // If we're at the end we really want the next line segment for looking ahead
      }

      // How far away are we from the path?
      float d = PVector.dist(predictLoc,normal);
      // Did we beat the record and find the closest line segment?
      if (d < record) {
        record = d;
        // If so the target we want to steer towards is the normal
        target = normal;

        // Look at the direction of the line segment so we can seek a little bit ahead of the normal
        dir = line;
        dir.normalize();
        // This is an oversimplification
        // Should be based on distance to path & velocity
        dir.mult(25);
      }
    }



    // Only if the distance is greater than the path's radius do we bother to steer
    if (record > p.radius || vel.mag() < 10) {
      target.add(dir);
      return steer(target,false);
    } 
    else {
      return new PVector(0,0);
    }
  }

  // A function to get the normal point from a point (p) to a line segment (a-b)
  // This function could be optimized to make fewer new Vector objects
  PVector getNormalPoint(PVector p, PVector a, PVector b) {
    // Vector from a to p
    PVector ap = PVector.sub(p,a);
    // Vector from a to b
    PVector ab = PVector.sub(b,a);
    ab.normalize(); // Normalize the line
    // Project vector "diff" onto line by using the dot product
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a,ab);
    return normalPoint;
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList boids) {
    float desiredseparation = r*500;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(loc,other.loc);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }


  // Method to update location
  void update() {
    // Update velocity
    vel.add(acc);
    // Limit speed
    vel.limit(maxspeed);
    loc.add(vel);
    // Reset accelertion to 0 each cycle
    acc.mult(0);
  }

  void seek(PVector target) {
    acc.add(steer(target,false));
  }

  void arrive(PVector target) {
    acc.add(steer(target,true));
  }

  // A method that calculates a steering vector towards a target
  // Takes a second argument, if true, it slows down as it approaches the target
  PVector steer(PVector target, boolean slowdown) {
    PVector steer;  // The steering vector
    PVector desired = PVector.sub(target,loc);  // A vector pointing from the location to the target
    float d = desired.mag(); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0f)) desired.mult(maxspeed*(d/100.0f)); // This damping is somewhat arbitrary
      else desired.mult(maxspeed);
      // Steering = Desired minus Velocity
      steer = PVector.sub(desired,vel);
      steer.limit(maxforce);  // Limit to maximum steering force
    } 
    else {
      steer = new PVector(0,0);
    }
    return steer;
  }

  void render() {
    noStroke();
    // Simpler boid is just a circle
    if (this.boidMovementSum > 15000000) {
      fill(8,169,252,60);
      if (this.boidMovementSum > 20000000)
        fill (8,252,201,60);
      if (this.boidMovementSum > 25000000)
        fill(10,252,8,60);
      if (this.boidMovementSum > 30000000)
        fill(66,255,10,60);
      if (this.boidMovementSum > 35000000)
        fill(193,255,10,60);
      if (this.boidMovementSum > 40000000)
        fill(255,186,10,60);
      if (this.boidMovementSum > 45000000)
        fill(255,100,10,60);
      if (this.boidMovementSum > 50000000)
        fill(255,0,0,50);
    } 
    else { 
      fill (200,50);
    }

    pushMatrix();
    translate(loc.x,loc.y);
    ellipse(0,0,this.boidMovementSum/2500000,this.boidMovementSum/2500000);
    popMatrix();
  }
}

class Path {

  // A Path is an arraylist of points (PVector objects)
  ArrayList points;
  // A path has a radius, i.e how far is it ok for the boid to wander off
  float radius;

  Path() {
    // Arbitrary radius of 20
    radius = .5;
    points = new ArrayList();
  }

  // Add a point to the path
  void addPoint(float x, float y) {
    PVector point = new PVector(x,y);
    points.add(point);
  }

  // Draw the path
  void display() {

    // Draw the radius as thick lines and circles



    // Draw Polygon around path

    for (int i = 0; i < points.size()-1; i++) {
      PVector start = (PVector) points.get(i);
      PVector end = (PVector) points.get(i+1);
      PVector line = PVector.sub(end,start);
      PVector normal = new PVector(line.y,-line.x);
      normal.normalize();
      normal.mult(radius);

      // Polygon has four vertices
      PVector a = PVector.add(start, normal);
      PVector b = PVector.add(end, normal);
      PVector c = PVector.sub(end, normal);
      PVector d = PVector.sub(start, normal);

      fill(50);
      noStroke();
      beginShape();
      vertex(a.x,a.y);
      vertex(b.x,b.y);
      vertex(c.x,c.y);
      vertex(d.x,d.y);
      endShape();


      stroke(100);
      line(458,0,458,742);
      line(0,458,458,458);
      line(283,458,283,742);
      line(283,567,458,567);
      line(350,458,350,567);
      line(283,526,350,526);
      line(324,526,324,567);
      line(324,541,350,541);
      line(335,526,335,541);
      line(324,526,324,567);
    }
  }
}















