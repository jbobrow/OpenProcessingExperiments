


PShape SquareQuarter;
PShape SquareQuarter2;
float angle = 0.0;
float d2Angle;
float brake = 0.95;
float d1Speed, d2Speed;
float d1InitSpeed = 0.025;
float d2InitSpeed = 0.025;
float yOffset = 0.0;
float yFreq = PI;
float scaleFactor = 1;
boolean skinToggle = false;


void setup() {
  size(480, 320);
  smooth();
  frameRate(60);
  d1Speed = d1InitSpeed;
  d2Speed = d2InitSpeed;
  d2Angle = angle;

  // Load shapes
  SquareQuarter = loadShape("Square_Quarter.svg");
  SquareQuarter2 = loadShape("Square_Quarter.svg");
}

void draw() {
  background(107, 15, 20);
  shapeMode(CENTER);
  
  yOffset = sin(yFreq);
  yFreq += 0.2;
  translate(width/2, height/2 + yOffset * scaleFactor);
  
  // Disc1
  pushMatrix();
  rotate(angle);  
  scale(0.25 * scaleFactor);
  shape(SquareQuarter);
  popMatrix();
  
  if(skinToggle == false) {    // If false, display disc2. 
    // Disc2
    pushMatrix();
    rotate(d2Angle);
    scale(0.25 * scaleFactor);
    SquareQuarter2.disableStyle();
    fill(4, 24, 24);
    shape(SquareQuarter2);
    popMatrix();
  
  } else {                     // Otherwise, create and display disc3.
    // Disc3
    noStroke();
    fill(4, 24, 24);

    pushMatrix();
    rotate(d2Angle);
    scale(0.5 * scaleFactor);
    beginShape();
    vertex(0, 72);
    bezierVertex(0, 84, 0, 96, 0, 108);       // Ending on the upper-most vertex
    bezierVertex(-49, 96, -84, 52, -72, 0);
    bezierVertex(-84, 0, -96, 0, -108, 0);    // Ending on the left-most vertex
    bezierVertex(-99, -52, -49, -90, 0, -72);
    bezierVertex(0, -84, 0, -96, 0, -108);    // Ending on the bottom-most vertex
    bezierVertex(49, -96, 84, -52, 72, 0);
    bezierVertex(84, 0, 96, 0, 108, 0);       // Ending on the right-most vertex
    bezierVertex(99, 52, 49, 90, 0, 72);
    endShape();
    popMatrix();
  }


  // Test for sync between disc1 and disc2/disk3
//  print(d1Speed + ", ");
//  println(d2Speed);

  angle += d1Speed;
  d2Angle += d2Speed;


  // Apply braking to disc1 on mouse button press
  if(mousePressed == true) {                  // If mouse button is pressed,
    if (d1Speed < 0.00001 && d1Speed != 0) {  // and, if disc1's speed is very slow, but not stopped,
      d1Speed = 0;                            // Stop disc1.
    } else {                                  // Otherwise,
      d1Speed *= brake;                       // Slow disc1 by the braking factor.
    }
  } else if (d1Speed == 0) {                   // If mouse button isn't pressed, but disc1 is stopped,
    d1Speed = 0.00001;                        // Get disc1 rotating again.
  } else if (d1Speed < d1InitSpeed) {         // If mouse button isn't pressed, and disc1's speed < initSpeed,
    d1Speed = d1Speed / brake;                // Speed up disc1 by the braking factor.
  } else {                                    // If mouse button isn't pressed, but disc1's speed > initSpeed,
    d1Speed = d1InitSpeed;                    // Set disc1's speed equal to initSpeed.
  }
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      if (scaleFactor < 2.0) {
        scaleFactor += 0.1;
      }
    } else if (keyCode == DOWN) {
      if (scaleFactor > 0.2) {
        scaleFactor -= 0.1;
      }
    }
  } else if (key == ' ') {
    if (skinToggle == false) {
      skinToggle = true;
    } else {
      skinToggle = false;
    }
  }
}



