
PImage relogio;

void setup() {
  size(150, 150);
  background(255, 255, 255, 0);
  relogio = loadImage("limao_transparente.png");
}

void draw () {
  
  fill(random(45), random(162), random(0), 20);

  //ellipse(300, 300, 150, 150);
  //rect(250, 250, 100, 100);

  image(relogio, 0, 0, 150,150);
  
  strokeWeight(3);
  
  pushMatrix();
  translate(75, 75);
  rotate( second()*2*PI/60);
  stroke(64, PI+ 65*millis()/1000.0,18);
  line(0, 0, 40, -50);
  popMatrix();
  
  strokeWeight(4);
  
  pushMatrix();
  translate(75, 75);
  rotate( minute()*2*PI/60);
  stroke(60,PI+ 50*millis()/1000.0, 18);
  line(0, 0, 20, -55);
  popMatrix();
  
  strokeWeight(4);
  
  pushMatrix();
  translate(75, 75);
  rotate( hour()*2*PI/12);
  stroke(60, PI+35*millis()/1000.0,18);
  line(0, 0, 0, -50);
  popMatrix();
  
  //stroke(random(210), 120, 14*millis()/1000.0);
  
  
}



