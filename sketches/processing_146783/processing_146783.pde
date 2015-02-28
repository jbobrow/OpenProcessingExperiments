
float r = 0;
float backR;
float backG;
float backB;

void setup () {
  size(500,500);
frameRate(3);  

backR = random(0, 100);
  backG = random(0, 100);
  backB = random(0, 100);
  
  background(backR, backG, backB);
  rectMode(CENTER);
  
  noStroke();
  smooth();
}

void draw() {
  
  fill(0,0,random(255));
  stroke(random(255));
  strokeWeight(random(10));
  ellipse (random(500), random(500), random(500), random(500));
  
  fill (random(255), 0, 0);
  stroke(random(255));
  strokeWeight(random(10));
  rect (random(500),random(500), random(125),random(125));
  
  
  stroke(random(255),random(255),random(255));
  strokeWeight(4);
  line(250,250,random(500),random(500));
  
  fill(backR, backG, backB, 50);
  rect(width/2, height/2, width, height);

  fill(255);
  translate(mouseX, mouseY);
  rotate(r);
  rect(0, 0, 100, 100);
  
  r = r + 0.05;
  
}


