
float robotX;
float robotY;
float startSpeed = 3;
float endSpeed = 10;
float startSpeed2 = 5;
float endSpeed2 = 15;
float speed = -random(startSpeed, endSpeed);
float speed2 = -random(startSpeed2, endSpeed2);

void setup(){
  size(600, 400);
  robotX = width/2;
  robotY = height + 100;
  frameRate(30);
  smooth();
  }

void draw() {  
  //background colors
  if (robotX ==0 || robotX == width ||robotY ==0 ||robotY == height +100) {
  background(0);
  } else {
  background(255);
  } 
  //ROBOT HEAD
  //coloring the head
  strokeWeight (3);
  stroke(174, 223, 228); 
  fill(174, 223, 228);
  rect (robotX-60, robotY-150, 120, 120);
  rect (robotX-80, robotY-130, 160, 80); 
  //antennae
  stroke(0);
  line (robotX, robotY-150, robotX + speed2-10, robotY-170);
  line (robotX, robotY-150, robotX + speed2+10, robotY-170);
  //head border lines
  line (robotX-60, robotY-150, robotX+60, robotY-150);
  line (robotX-60, robotY-30, robotX+60, robotY-30);
  line (robotX-80, robotY-130, robotX-80, robotY-50);
  line (robotX+80, robotY-130, robotX+80, robotY-50);
  //head's corners
  ellipseMode(CORNER);
  arc(robotX-80, robotY-150, 40, 40, PI, TWO_PI-PI/2);
  arc(robotX+40, robotY-150, 40, 40, TWO_PI-PI/2, TWO_PI);
  arc(robotX+40, robotY-70, 40, 40, 0, PI/2);
  arc(robotX-80, robotY-70, 40, 40, PI/2, PI);
  //blush
  ellipseMode(CENTER);
  stroke(247, 165, 170);
  fill(247, 165, 170); 
  ellipse(robotX-50, robotY-100, 10, 10);
  ellipse(robotX+50, robotY-100, 10, 10);
  //eyes
  stroke(0);
  fill(0);
  if (robotX <= 80 || robotX>=width-80 || robotY>= height+20 ||robotY<=80) { 
    //emotional eyes
    line(robotX-40, robotY-120, robotX-60, robotY-125);
    line(robotX-40, robotY-120, robotX-60, robotY-115);
    line(robotX+40, robotY-120, robotX+60, robotY-125);
    line(robotX+40, robotY-120, robotX+60, robotY-115);
  } else {
    //smiling eyes
    fill(174, 223, 228);
    arc(robotX-40, robotY-115, 20, 20, PI, TWO_PI-PI/2);
    arc(robotX-40, robotY-115, 20, 20, TWO_PI-PI/2, TWO_PI);
    arc(robotX+40, robotY-115, 20, 20, PI, TWO_PI-PI/2);
    arc(robotX+40, robotY-115, 20, 20, TWO_PI-PI/2, TWO_PI);
  }
  //mouth
  if (robotX <= 80 || robotX>=width-80 || robotY>= height+20 ||robotY<=80) { 
    fill(174, 223, 228);
    rect(robotX-20, robotY-100, 40, 20);
  } else { 
    line (robotX-20, robotY-100, robotX+20, robotY-100);
  }

  //ROBOT BODY
  fill(174, 223, 228);
  //body
  rect (robotX-25, robotY-30, 50, 50);
  //button
  ellipse (robotX, robotY-5, 30, 30);
  line (robotX-5, robotY-10, robotX-5, robotY);
  line (robotX+5, robotY-10, robotX+5, robotY);
  //hands
  line (robotX-25, robotY-30, robotX + speed2-35, robotY+5);
  line (robotX+25, robotY-30, robotX + speed2+35, robotY+5);
  //legs
  line (robotX-15, robotY+20, robotX + speed2-15, robotY+45);
  line (robotX+15, robotY+20, robotX + speed2+15, robotY+45);
  //move
    if (robotY >= height+100 || robotY <= 0) {
      speed = speed * -1;
    } 
    if (robotX >= width || robotX <= 0) {
      speed2 = speed2 * -1;
    }   
  robotY = robotY + speed ;
  robotX = robotX + speed2;
  robotY = constrain(robotY, 0, height+100);
  robotX = constrain(robotX, 0, width+0);
  }

void mousePressed() {
  //say hello
  println("I can't stop!");
  }


