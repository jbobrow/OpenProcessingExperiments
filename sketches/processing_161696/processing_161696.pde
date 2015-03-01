
// Cody Parker
// It was a real challenge making the squares rotate and positions correctly
//would like to keep expanding on this and make it a full menu
float angle1;

void setup() {
  size(500, 500);
  
  angle1 = 0;
  
  background(0, 0, 0, 255);
  fill(0, 255, 0, 255);
  frameRate(30);
}

// Loading 
void draw() {
  fill(255, 255, 255);
  textSize(45);
  text("Loading", 115, 250);

  fill(255, 255, 255);

  rotateRect(300, 235, angle1);
  angle1 = angle1 + 4.5;
  
  rotateRect(350, 235, angle1);
  angle1 = angle1 + 4.5;
  
  rotateRect(400, 235, angle1);
  angle1 = angle1 + 4.5;
  
 

}


void rotateRect(float x, float y, float angle) {

  pushMatrix();
  translate(x, y);
  rotate(radians(angle));
  rectMode(CENTER);
  rect(0, 0, 15, 15, 1);
  popMatrix();
}



