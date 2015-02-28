

//Pedro Veneziano, February 8th, Creative Computing B, Benjamin Bacon

// Declare variables here



// Draw code here

void setup() {
  size(890,890);
  smooth();
}

void draw() {
  
  int barw = 40;
  float bar1h = 0.29*mouseY;
  float bar2h = 0.45*mouseY;
  float bar3h = 0.89*mouseY;
  float bar4h = 0.55*mouseY;
  float bar5h = 0.3*(890-mouseY);
  float bar6h = 0.4*(890-mouseY);
  float bar7h = 0.89*(890-mouseY);
  float bar8h = 0.2*(890-mouseY);
  float bar9h = 0.3*mouseX;
  float bar10h = 0.65*mouseX;
  float bar11h = 0.8*mouseX;
  float bar12h = 0.4*mouseX;
  float bar13h = 0.45*(890-mouseX);
  float bar14h = 0.5*(890-mouseX);
  float bar15h = 0.75*(890-mouseX);
  float bar16h = 0.25*(890-mouseX);
  
  background(39, 236, 160);

  stroke(255);
  fill(255);

  rect(50, 50, barw, bar1h);
  rect(200, 50, barw, bar2h);
  rect(550, 50, barw, bar3h);
  rect(650, 50, barw, bar4h);
  
  rect(150, 50+bar5h, barw, 790-bar5h);
  rect(300, 50+bar6h, barw, 790-bar6h);
  rect(450, 50+bar7h, barw, 790-bar7h);
  rect(750, 50+bar8h, barw, 790-bar8h);

  noFill();

  rect(150, 50, barw, bar5h);
  rect(300, 50, barw, bar6h);
  rect(450, 50, barw, bar7h);
  rect(750, 50, barw, bar8h);
  
  rect(50, 50+bar1h, barw, 790-bar1h);
  rect(200, 50+bar2h, barw, 790-bar2h);
  rect(550, 50+bar3h, barw, 790-bar3h);
  rect(650, 50+bar4h, barw, 790-bar4h);

  stroke(38, 38, 130);
  fill(38, 38, 130);

  rect(100, 50, barw, bar9h);
  rect(350, 50, barw, bar10h);
  rect(600, 50, barw, bar11h);
  rect(800, 50, barw, bar12h);
  
  rect(250, 50+bar13h, barw, 790-bar13h);
  rect(400, 50+bar14h, barw, 790-bar14h);
  rect(500, 50+bar15h, barw, 790-bar15h);
  rect(700, 50+bar16h, barw, 790-bar16h);

  noFill();

  rect(250, 50, barw, bar13h);
  rect(400, 50, barw, bar14h);
  rect(500, 50, barw, bar15h);
  rect(700, 50, barw, bar16h);
  
  rect(100, 50+bar9h, barw, 790-bar9h);
  rect(350, 50+bar10h, barw, 790-bar10h);
  rect(600, 50+bar11h, barw, 790-bar11h);
  rect(800, 50+bar12h, barw, 790-bar12h);
}



