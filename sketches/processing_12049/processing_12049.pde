
void setup () {
  // Night-sky.
  size (600,400);
  background (0);
}

void draw () {
  // City buildings.
  fill (175);
  rect(0,250,40,350);
  rect(40,270,40,350);
  rect(80,210,40,350); 
  rect(120,250,40,350);
  rect(160,180,40,350);
  rect(200,290,40,350); 
  rect(240,220,40,350);
  rect(280,230,40,350);
  rect(320,110,40,350); 
  rect(360,260,40,350);
  rect(400,280,40,350);
  rect(440,210,40,350);
  rect(480,180,40,350);
  rect(520,250,40,350);
  rect(560,240,40,350);
}

void mousePressed () {
  // Click to create stars in the night-sky.
  stroke (0);
  fill (225);
  ellipseMode (CENTER);
  ellipse (mouseX, mouseY, 5, 5);
}

void keyPressed () {
  // Change night-sky to day-light, stars dissapear.
  background (250);
}

