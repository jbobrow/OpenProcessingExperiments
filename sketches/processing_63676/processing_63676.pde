
float x1, y1, x2, y2;
boolean firstClick = true;
Ellipses ellipseA, ellipseB, ellipseC, ellipseD;


void setup() {
  size(800, 480);
  smooth();
  ellipseMode(RADIUS);
  

  ellipseA = new Ellipses (random(40, 760), -40, random(20, 40), 3, 1);
  ellipseB = new Ellipses (-40, random(40, 440), random(20, 40), 3, 1);
  ellipseC = new Ellipses (random(40, 760), 520, random(20, 40), 4, -1);
  ellipseD = new Ellipses (840, random(40, 440), random(20, 40), 4, -1);
}

void draw() {
  background(0);
  

  stroke(200);
  strokeWeight(4);
  line(x1, y1, x2, y2);
  

  noStroke();
  ellipseA.keepScore();
  ellipseA.updatex();
  ellipseA.display();
  ellipseA.gox();
  ellipseA.repositionx();
  

 
  ellipseB.updatey();
  ellipseB.display();
  ellipseB.goy();
  ellipseB.repositiony();
  
 
  
  ellipseC.updatex();
  ellipseC.display();
  ellipseC.gox();
  ellipseC.repositionxb();
 
 
  ellipseD.updatey();
  ellipseD.display();
  ellipseD.goy();
  ellipseD.repositionyb();
  
}
