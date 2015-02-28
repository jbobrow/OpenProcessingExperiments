
float creatureX;
float creatureY;

float eyeR;
float eyeG;
float eyeB;

void setup() {
  size(400, 400);
  creatureX = width/2;
  creatureY = height + 200;
  smooth();
}

void draw() {
  background(255);
  
  //draw creature's body
  strokeWeight(3);
  stroke(50, 190, 40);
  fill(70, 250, 55); 
  //set rects to CENTER mode
  rectMode(CENTER);
  rect(creatureX, creatureY, 150, 100);
  
  //draw mouth
  rectMode(CENTER);
  rect(creatureX, creatureY+50, 150, 30);
  
  //draw teeth
  fill(255);
  triangle(creatureX-40, creatureY+35, creatureX-60, creatureY+35, creatureX-50, creatureY+55); 
  triangle(creatureX+40, creatureY+35, creatureX+60, creatureY+35, creatureX+50, creatureY+55); 
  
  //draw eyes
  fill(255);
  //left eye
  ellipse(creatureX-25, creatureY, 40, 40);
  //right eye
  ellipse(creatureX+30, creatureY, 50, 50);
  
  //draw eyeballs
  eyeR = random(255);
  eyeG = random(255);
  eyeB = random(255);
  fill(eyeR, eyeG, eyeB);
  
  noStroke();
  ellipse(creatureX-20, creatureY+5, 25, 25);
  ellipse(creatureX+30, creatureY-7, 30, 30);
  
  //draw legs
  strokeWeight(5);
  stroke(50, 190, 40);
  
  //left leg
  line(creatureX-40, creatureY+66, creatureX-40, height);
  
  //right leg
  line(creatureX+40, creatureY+66, creatureX+40, height);

  //creature rocket
  creatureY = creatureY - 1;
  
  creatureX = creatureX + random(-5, 5);
  
}

void mousePressed() {
   //creature comment
  println("Hello World!");
}

