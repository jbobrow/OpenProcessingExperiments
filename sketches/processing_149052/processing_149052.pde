
/*
 Konkuk University
 Department of Dynamic Media
 SOS iDesign
 Name: CHOI Seung-hwan
 ID: 201420112
 */

void setup() {
  size (600, 600);
  background(0);
  smooth();
  title();
  frameRate(20);
}


void title() { 
  fill(255); 
  textAlign(CENTER); 
  text("Spacebar press = Clean", width-87, height-40);
  text("CHOI Seung-hwan, Interactive Drawing with mouse, Dynamic Media, 2014", width-230, height-20);
}

void draw() {

  if (mousePressed) {
    strokeWeight(1);
    noStroke();
    fill(255, 5);
    bezier(mouseX, mouseY, pmouseX, pmouseY, random(width), random(height), width-mouseX, height-mouseY);
  }

  if (keyPressed) {
    if (key == ' ') {
      setup();
    }
  }
}

