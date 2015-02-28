
// A slightly more interactive solar system. Hold the mouse button to move the planets 

float mercuryX;
float mercuryY;

void setup() {
  size(1000,700);
  smooth();
  ellipseMode(CENTER);
  frameRate(30);
}

void draw() {
  //draw background and sun
  background(0);
  noStroke();
  fill(255, 204, 51);
  translate(0, height/2);
  ellipse(0,0,150,150);
  
  //draw stars
  stroke(255);
  fill(255);
  for(int i=0; i<500; i++) {
    float starx = random(-width,width);
    float stary = random(-height,height);
    ellipse(starx, stary, 2,2);
  }
  
  //draw Mercury
  noStroke();
  fill(234,66,52);
  
  if (mousePressed) {
    mercuryX = mouseX;
    mercuryY = mouseY - height/2;
  } else {
    mercuryX = 200;
    mercuryY = 0;
  }
  

  ellipse(mercuryX,mercuryY,20,20);
  
  //draw Venus
  fill(181,134,11);
  float venusX = mercuryX + 80;
  float venusY = mercuryY;
  ellipse(venusX,venusY,40,40);
  
  //draw Earth
  fill(0,102,255);
  float earthX = venusX + 70;
  float earthY = venusY;
  ellipse(earthX,earthY,40,40);
  
  //draw Mars
  fill(234,66,52);
  float marsX = earthX + 80;
  float marsY = earthY;
  ellipse(marsX,marsY,30,30);
  
  //draw Jupiter
  fill(210, 105, 30);
  float jupiterX = marsX + 75;
  float jupiterY = marsY;
  ellipse(jupiterX, jupiterY, 80, 80);
  
  //draw Saturn
  fill(255,219,88);
  float saturnX = jupiterX + 100;
  float saturnY = jupiterY;
  ellipse(saturnX, saturnY, 75, 75);
  
  /*noFill();
  stroke(255,219,88);
  arc(saturnX, saturnY, 100, 100, PI, PI/4);
  
  noStroke();*/
  
  //draw Uranus
  fill(0,191,255);
  float uranusX = saturnX + 120;
  float uranusY = saturnY;
  ellipse(uranusX, uranusY, 30,30);
  
  //draw Neptune
  fill(125,249,255);
  float neptuneX = uranusX + 70;
  float neptuneY = uranusY;
  ellipse(neptuneX, neptuneY, 25,25);
  
  
}


