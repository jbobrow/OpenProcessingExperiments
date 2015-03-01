
void setup() {
  size(400, 400);
  background(255, 255, 255);
}

void draw() {
    if (mousePressed) {
    background(0);
    }
    else {
    background(255,255,255);
    }

  stroke(0);
  strokeWeight(4);
  fill(228, 50, 50);
  ellipse(200, 200, 320, 300); //Head
  
  stroke(0);
  strokeWeight(3);
  fill(255, 255, 255);
  ellipse(150, 90, 90, 90); //Left eye
  
  fill(0);
  ellipse(160, 90, 30, 30); //Left pupil
  
  stroke(0);
  strokeWeight(3);
  fill(255, 255, 255);
  ellipse(250, 90, 90, 90); //Right eye
  
  fill(0);
  ellipse(240, 90, 30, 30); //Left pupil
  
  stroke(0);
  strokeWeight(3);
  fill(240, 170, 54);
  ellipse(200, 150, 90, 100); //Nose
  
  fill(0);
  arc(200, 240, 190, 140, 0, PI);
  
}


