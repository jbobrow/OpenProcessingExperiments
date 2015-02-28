
//Screen Studio Assignment 1a
//Name
//Ben Chen
//Login
//bche6577
//SID
//311254969
//
//Description:
//A simple animated exercise using the random() function and drawing of shapes.

// Declare variables
String[] logo = {"VICTORY!"};
int num = 0;
float y = -50; 
 
void setup() {
  size(500, 400); // Window size
  smooth(); // Smooth edges of shapes
}
 
void draw() {
  background(0); //Background color.
  
  //Drawing groups of ovals with random color & sizes.
  //Group 1
  fill(random(240),random(240),random(240));
  ellipse(random(500), y, 10, 20);
  fill(random(240),random(240),random(240));
  ellipse(random(500), y+random(500), 40, 30);
  fill(random(240),random(240),random(240));
  ellipse(random(500), y+random(500), 10, 40);
  fill(random(240),random(240),random(240));
  ellipse(random(500), y+random(500), 10, 50);
  fill(random(240),random(240),random(240));
  ellipse(random(500), y+random(800), 100, 60);
  fill(random(240),random(240),random(240));
  ellipse(random(500), y+random(800), random(50), 70);
//Group 2
  fill(random(240),random(240),random(240));
  ellipse(random(500), y, 10, 20);
  fill(random(240),random(240),random(240));
  ellipse(random(500), y+random(500), 40, 30);
  fill(random(240),random(240),random(240));
  ellipse(random(500), y+random(500), 40, 40);
  fill(random(240),random(240),random(240));
  ellipse(random(500), y+random(500), 50, 50);
  fill(random(240),random(240),random(240));
  ellipse(random(500), y+random(800), 100, 60);
  fill(random(240),random(240),random(240));
  ellipse(random(500), y+random(800), random(50), 70);
//Group 3
  ellipse(random(500), y, 10, 20);
  fill(random(240),random(240),random(240));
  ellipse(random(500), y+random(500), 40, 30);
  fill(random(240),random(240),random(240));
  ellipse(random(500), y+random(500), 10, 40);
  fill(random(240),random(240),random(240));
  ellipse(random(500), y+random(500), 10, 50);
  fill(random(240),random(240),random(240));
  ellipse(random(500), y+random(800), 200, 200);
  fill(random(240),random(240),random(240));
  ellipse(random(500), y+random(800), random(50), 70);

 //Logo drawing
  circle();
  bluRing();
  blkRing();
  redRing();
  ylwRing();
  greRing();
 
//Text drawing
  frameRate(15); //Execution speed
  textAlign(CENTER); //Text center
  fill(random(255), random(232), random(0));//Assign random colors 
  textSize (70);
  text(logo[num], 250, 370);//Size and location
}

void circle() {
  fill(57, 210, 255); 
  strokeWeight(5);
  ellipse (246, 160, 300, 300);
}

void bluRing() {
  noFill(); 
  stroke(0, 119, 255);
  strokeWeight(10);
  ellipse(150, 150, 80, 80);
}

void blkRing() {
  noFill(); 
  stroke(0); 
  strokeWeight(10); 
  ellipse(245, 150, 80, 80); 
}

void redRing() {
  noFill(); 
  stroke(245, 38, 38); 
  strokeWeight(10); 
  ellipse(340, 150, 80, 80); 
}
 
void ylwRing() {
  noFill(); 
  stroke(233, 185, 31); 
  strokeWeight(10); 
  ellipse(197, 190, 80, 80); 
}

void greRing() {
  noFill(); 
  stroke(65, 164, 68); 
  strokeWeight(10); 
  ellipse(293, 190, 80, 80); 
}

