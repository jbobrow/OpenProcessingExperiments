
float cloudX = random(0,400);
float cloudY = random(0,200);
void setup() {
  size(400,400); //Makes the window
  background(97, 199, 203); //Makes the sky
}

void draw() {

  drawBackstuff();
  drawClouds();
  drawBuildings();

}




//======================Background and Sun=================================
void drawBackstuff() {
  if (mouseY < 140) {
    background(97, 199, 203);
  } else if ((mouseY >= 140) && (mouseY < 300)) {
    background(19, 154, 160);
  } else {
    background(0, 74, 77);
  }

  fill(255,187,0); // Orange
  ellipse(mouseX, mouseY, 50, 50); //Makes the Sun
  
  fill(50); // Grey
  rect(0, 340, width, 60); //Makes the Floor
  
  noStroke(); //Gets rid of outline.
  fill(100); //Lighter grey
  rect(0, 300, width, 40); //Skyline
}



//===================Clouds===================================================
void drawClouds() {
  fill(216);
  ellipse( cloudX, cloudY, 200, 50);
  if (cloudX < width + 200) {
    cloudX = cloudX + 1;
  } else if (cloudX >= (width + 200)) {
    cloudX = -200;
    cloudY = random(0, 200);
  }
}


//=========================Buildings===========================================
void drawBuildings() {
  stroke(0); //Puts outline back.
  fill(20); //Dark Grey
  rect(40, 80, 50, 300); //Left tower
  rect(90, 110, 50, 270); //Middle Left Tower
  rect(175, 80, 50, 300); //Middle Right Tower
  rect(340, 95, 50, 285); //Right Tower
}
  


