
/*
Fallen Flowers
 -background fade with time
 -flowers opacity change when falling down
 -press mouse to stop falling, release to continue
 -press s to save png
 -references:
 // Learning Processing
 // Daniel Shiffman
 // http://www.learningprocessing.com
 // Example 10-7: Drops one at a time
 
 by kokfu lok
 */
PImage img;

// An array of flower
flower[] flowers = new flower[400];
// New variable to keep track of total number of drops we want to use!
int totalflowers = 0;

void setup() {
  size(800, 800);
  smooth();
  background(255);
  // frameRate(12);
  //img=loadImage("bg.jpg");
  if (mousePressed == true){
    noLoop();}
}

void draw() {
  float aa=map(second(), 0, 59, 120, 260);
  background(aa);
  // image(img,0,0);
  // Initialize one drop
  flowers[totalflowers] = new flower();

  // Increment totalDrops
  totalflowers++ ;

  // If we hit the end of the array
  if (totalflowers >= flowers.length) {
    totalflowers = 0; //Start over
  }

  // Move and display drops
  for (int i = 0; i < totalflowers; i++ ) { 
    flowers[i].move();
    flowers[i].display();
  }
  //aa++;
  
}
void keyPressed() {
    if (key == 's' || key == 'S') {
      saveFrame("fallingFlower-##.png");
    }
}

  void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}

class flower {
  float centX;
  float centY;
  float color1;
  float speed; 
  float radius;

  flower() {
    radius = random(5, 30); 
    centX=random(width); // Start with a random x location
    centY=-radius*4; // Start a little above the window
    speed = random(1, 10); // Pick a random speed
    color1=random(255); // Color
  }


  // Move the flower down
  void move() {
    // Increment by speed
    centY += speed;
  }

  // Check if it hits the bottom
  boolean reachedBottom() {
    // If we go a little beyond the bottom
    if (centY > height + radius*4) { 
      return true;
    } 
    else {
      return false;
    }
  }

  // Display the flower
  void display() {
    float opa= map(centY, 0, height, 100, 0);
    float color2= map(centY, 0, height, 0, 255);
    fill(color2, random(25), color2, opa);
    stroke(20, random(50), 70, random(5, 30));
    strokeWeight(random(0.1, 3));

    float x, y; 
    float noiseval = random(1000);
    float radVariance, thisRadius, rad;

    beginShape();
    for (float ang=0; ang<=360; ang+=1) { 
      noiseval += 0.1; 
      radVariance=random(15, 30)*customNoise(noiseval);
      thisRadius = radius+radVariance; 
      rad = radians(ang); 
      x = centX + (thisRadius * cos(rad)); 
      y = centY + (thisRadius * sin(rad)); 
      curveVertex(x, y);
    }
    endShape(CLOSE);
  }
  float customNoise(float value) {
    int count = int(value%5);
    float retValue=pow(sin(value), count);
    return retValue;
  }
}



