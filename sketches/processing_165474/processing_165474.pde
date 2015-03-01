
float soupX;
float soupY;
float stewX;
float stewY;
 
float eyeR;
float eyeG;
float eyeB;
 
void setup() {
  size(200,200);        // Set the size of the window

  soupX = width*2/3;     
  soupY = height-200; 
  stewX = width*1/3;
  stewY = height+200;
  smooth();
}
 
void draw() {
 
  background(255);  // Draw a white background
 
  // Set ellipses and rects to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
 
  // Draw soup's body
  stroke(0);
  fill(150);
  // Feature #1.  zoogX and zoogY are used for the shape locations.
  rect(soupX,soupY,20,100);
 
  // Draw soup's head
  stroke(0);
  fill(255);
  ellipse(soupX,soupY-30,60,60);
 
  // Draw soup's eyes
  // Feature #2.  eyeR, eyeG, and eyeB are given random values and used in the fill() function.
  eyeR = random(255);
  eyeG = random(255);
  eyeB = random(255);
  fill(eyeR,eyeG,eyeB);
 
  ellipse(soupX-19,soupY-30,10,10);
  ellipse(soupX+15,soupY-30,20,20);
 
  // Draw soup's legs
  stroke(150);
  line(soupX-10,soupY+50,soupX-10,height);
  line(soupX+10,soupY+50,soupX+10,height);
  
  // soup moves down
  soupY = soupY + 1;
  

  // Draw stew's body
  stroke(0);
  fill(150);
  // Feature #1.  stewX and stewY are used for the shape locations.
  rect(stewX,stewY,20,100);
 
  // Draw soup's head
  stroke(0);
  fill(255);
  ellipse(stewX,stewY-30,50,50);
 
  // Draw stew's eyes
  // Feature #2.  eyeR, eyeG, and eyeB are given random values and used in the fill() function.
  eyeR = random(255);
  eyeG = random(255);
  eyeB = random(255);
  fill(eyeR,eyeG,eyeB);
 
  triangle(stewX-20,stewY-30,stewX-6,stewY-20,stewX-2,stewY-30);
  triangle(stewX+20,stewY-30,stewX+6,stewY-20,stewX+2,stewY-30);
 
  // Draw stew's legs
  stroke(150);
  line(stewX-10,stewY+50,stewX-10,height);
  line(stewX+10,stewY+50,stewX+10,height);
  
  // stew moves down
  stewY = stewY - 1;
}


