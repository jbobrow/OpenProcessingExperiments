
/*
Assignment <<<HW3>>>
 Zachary Amador
 CSC 103 - Creative Computing - Fall 2014
 Submitted: 16 September 2014
 
 This file makes a cityscape at night, with lights flashing on and off in the buildings.
 This isn't any particualar city, but if it was, it would be a constantly changing one.
 There is also a moon in the top left corner.
 */

float buildingHeight1 = random(100, 150);
float buildingHeight2 = random(150, 175);
float buildingHeight3 = random(25, 50);
float buildingHeight4 = random(250, 300);
float buildingHeight5 = random(200, 225);
boolean lightsOut1 = false;
boolean lightsOut2 = false;
boolean lightsOut3 = false;
boolean lightsOut4 = false;
boolean lightsOut5 = false;

void setup() {

  size(500, 500);
  background(0, 0, 100);
}

void draw() {

  fill(0);
  //buildings from left to right
  rect(0, buildingHeight1, 120, 400);
  rect(120, buildingHeight2, 100, 350);
  rect(220, buildingHeight3, 80, 475);
  rect(300, buildingHeight4, 120, 200);
  rect(420, buildingHeight5, 80, 300);

  
  
  //window lights from left to right
  
  if (lightsOut1) {
    fill(0);
  } else {
    fill(200, 200, 0);
  }
  
  if (random(100) < 1) {
    lightsOut1 = ! lightsOut1; 
  }
  
  //first building
  rect(20, 320, 20, 40);
  rect(60, 160, 20, 40);

 if (lightsOut2) {
    fill(0);
  } else {
    fill(200, 200, 0);
  }
  
  if (random(100) < 1) {
    lightsOut2 = ! lightsOut2; 
  }
  //second building
  rect(140, 300, 20, 40);

 if (lightsOut3) {
    fill(0);
  } else {
    fill(200, 200, 0);
  }
  
  if (random(100) < 1) {
    lightsOut3 = ! lightsOut3; 
  }
  //third building
  rect(220, 180, 20, 40);
  rect(240, 65, 20, 40);
  rect(280, 280, 20, 40);

  if (lightsOut4) {
    fill(0);
  } else {
    fill(200, 200, 0);
  }
  
  if (random(100) < 1) {
    lightsOut4 = ! lightsOut4; 
  }
  //fourth building
  rect(340, 340, 20, 40);
  rect(400, 300, 20, 40);

  if (lightsOut5) {
    fill(0);
  } else {
    fill(200, 200, 0);
  }
  
  if (random(100) < 1) {
    lightsOut5 = ! lightsOut5; 
  }
  //fifth building
  rect(440, 240, 20, 40);
  rect(480, 340, 20, 40);

  //moon
  fill(220);
  ellipse(10, 0, 75, 75);

  //sidewalk
  fill(80);
  rect(0, 400, 500, 100);
}


