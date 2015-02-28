
int arcX = 115;
int arcY = 110;
int ellipseY = 115;

void setup(){
  size(255,255);
  background(255);
  }
  
  void draw() {
//ball//
  smooth ();
  stroke(0,0,0);
  fill(mouseX,mouseY,255,127);
  ellipse(mouseX,mouseY,20,20);
  
  //ball2
  smooth ();
  stroke(0,0,0);
  fill(mouseX,mouseY,255,127);
  ellipse(mouseX,mouseY,10,10);

  //ball3
  smooth ();
  stroke(0,0,0);
  fill(mouseX,mouseY,255,127);
  ellipse(mouseX,mouseY,10,10);

  //body//
 strokeWeight(3);
 fill(143,209,168,255);
 arc(arcX, arcY, 120, 108, 0, PI/2);
 arc(arcX, arcY, 120, 108, PI/2, PI);
 
 //head//
  smooth();
  strokeWeight(3);
  fill(200,246,243,255);
  ellipse(80,100,80,80);
  
  //eye
  smooth();
  strokeWeight(2);
  fill(143,209,168,255);
  ellipse(100,95,10,10);
  
  line(120,100,100,105);
  
  //hands//
  if (mousePressed) {
    fill(0);
  }else{
    fill(143,209,168,255);
  }
  strokeWeight(2);
  stroke(0,0,0);
  ellipse(125,ellipseY,20,20);
  
  strokeWeight(2);
  stroke(0,0,0);
  ellipse(172,ellipseY,20,20);
  }
  



