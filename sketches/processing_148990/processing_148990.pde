
 /* Konkuk University
 Department of Dynamic Media
 SOS iDesign
 Name: JEONG Eunyeah
 ID: 201420106
 */
 
boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;

float x, y;

// -------------------------------------------- 
void setup() {
  size(600, 600);
  //size(displayWidth, displayHeight);
  background(#eeeeee);
  smooth();
  fill(random(width), mouseY, 0, 50);
  
}

// -------------------------------------------- 
void draw() {
  if (mouseX<width*0.05) {
    noStroke();
    fill(255, 0, 0, 30);
    rectMode(CORNER);
    rect(0, 0, width, height);
  }
  if (mouseX>width*0.95) {
    noStroke();
    fill(255, 0, 0, 30);
    rectMode(CORNER);
    rect(0, 0, width, height);
  }
  if (mouseY<height*0.05) {
    noStroke();
    fill(255, 0, 0, 30);
    rectMode(CORNER);
    rect(0, 0, width, height);
  }
    if (mouseY>height*0.95) {
    noStroke();
    fill(255, 0, 0, 30);
    rectMode(CORNER);
    rect(0, 0, width, height);
  }
  if (mouseX>width*0.05 && mouseX<width*0.95 && mouseY>height*0.05 && mouseY<height*0.95) {
    background(#eeeeee);
  }

  stroke(#eeeeee);
  strokeWeight(50);

  rectMode(CENTER);
  rect(x, y, pmouseX, pmouseY);
  rect(width-x, y, pmouseX, pmouseY);
  rect(x, height-y, pmouseX, pmouseY);
  rect(width-x, height-y, pmouseX, pmouseY);

  x = lerp(x, mouseX, 0.05);
  y = lerp(y, mouseY, 0.05);

  //title();
}

void title() { 
  pushStyle();
  fill(0);
  textAlign(RIGHT);
  text("JEONG Eunyeah, randomcolor, Dynamic Media, 2014", width-50, height-20);
  popStyle();
}

// -------------------------------------------- 

void keyPressed() {
  if  (keyPressed) {
    fill(random(width), mouseY, 0, 50);
    if (key=='s') saveFrame("Images/####.jpg");
  }
}


