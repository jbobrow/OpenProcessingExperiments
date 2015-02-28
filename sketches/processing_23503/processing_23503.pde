
  void setup () {
  size(255,255);
  background(255);
  }
  
  void draw() {
//straw & ball//
  smooth ();
  stroke(0,0,0);
  fill(mouseX,mouseY,255,127);
  line(150,85,100,110);
  ellipse(153,75,20,20);

  //body//
 strokeWeight(3);
 fill(143,209,168,255);
 arc(115, 110, 120, 108, 0, PI/2);
 arc(115, 110, 120, 108, PI/2, PI);
 
 //head//
  smooth();
  strokeWeight(3);
  fill(200,246,243,255);
  ellipse(80,100,80,80);
  
  smooth();
  strokeWeight(2);
  fill(143,209,168,255);
  ellipse(100,95,10,10);
  
  line(120,100,100,105);
  
  //hat//
  noStroke();
  arc(50, 55, 50, 50, 0, PI/2);
  
  //hands//
  strokeWeight(2);
  stroke(0,0,0);
  ellipse(125,115,20,20);
  
  strokeWeight(2);
  stroke(0,0,0);
  ellipse(172,115,20,20);
  }
 

 

