

void eye( float eyex, float eyey, float eyew, float eyeh ) {
  stroke(225, 0, 255);
  fill(random(255,255));
  ellipse(eyex, eyey, eyew, eyeh);
  if (mousePressed) {
    // pupil
    noStroke();
    fill(255, 0, 0);
    ellipse(eyex, eyey, 80, 80);       
    // laser
    strokeWeight(7);
    stroke( 0, random(255), (sin(frameCount / 10.0f) * 255) + 128 );
    line(eyex, eyey, mouseX, mouseY);
  } 
  else {
    // eye whites
    noStroke();
    fill(255);
    ellipse(eyex, eyey, eyew - 100, eyeh - 100); 
    fill(0);
    ellipse(eyex, eyey, 10, 10);
  }
}


