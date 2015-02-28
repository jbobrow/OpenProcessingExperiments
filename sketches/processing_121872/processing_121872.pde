
int omhoog;
int horizon;

void setup() {
  size(500, 500);
  frameRate(60);
  omhoog=500;
  horizon=mouseX;
  
}

void draw() {
  background(255, 255, 255);
  omhoog = omhoog-5;
  if (omhoog == -200) { omhoog=700; }
  
  //oren
  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX-80, omhoog-80, 60, 60);


  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX+80, omhoog-80, 60, 60);

  //hoofd
  stroke(0);
  fill(255);
  ellipseMode(CENTER);
  ellipse(mouseX, omhoog, 200, 200);

  //neus
  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX, omhoog, 40, 40);

  //linker oog
  stroke(0);
  fill(5);
  ellipseMode(CENTER);
  ellipse(mouseX-40, omhoog-40, 50, 50);

  stroke(0);
  fill(0, 150, 255);
  ellipseMode(CENTER);
  ellipse(mouseX-35, omhoog-40, 20, 20);

  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX-35, omhoog-40, 6, 6);

  //rechter oog
  stroke(0);
  fill(5);
  ellipseMode(CENTER);
  ellipse(mouseX+40, omhoog-40, 50, 50);

  stroke(0);
  fill(0, 150, 255);
  ellipseMode(CENTER);
  ellipse(mouseX+35, omhoog-40, 20, 20);

  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX+35, omhoog-40, 6, 6);

  // mond
  stroke(0);
  fill(0);
  rectMode(CENTER);
  rect(mouseX, omhoog+50, 7, 7);

  //bamboo
  noStroke();
  fill(28, 148, 24);
  rectMode(CENTER);
  rect(mouseX-60, omhoog+90, 10, 150);



  //hands
  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX-70, omhoog+80, 70, 50);

  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX+70, omhoog+80, 70, 50);
}

