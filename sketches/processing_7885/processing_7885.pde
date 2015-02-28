
void setup() {
  size(800,600);
  background(0);
  smooth();
}

void draw() {
  //random squares starting from center 
  rectMode(CENTER);
 stroke(random(255));
  fill(random(255),random(255),random(255),127);
 rect(random(600)+random(200),random(400)+random(200),random(150),random(150));
  
  //frame 
  rectMode(CORNERS);
  noStroke();
  fill(0);
 rect(0,0,800,100);
 rect(0,500,800,600);
 rect(0,0,100,600);
 rect(700,0,800,600);

  /*
  ellipseMode(CENTER);
  stroke(0);
  fill(random(255),random(255),random(255),127);
  ellipse(mouseX,mouseY,50,50);
  */
  
  
}

