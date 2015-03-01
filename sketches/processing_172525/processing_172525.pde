
float myY = 5; 
float myX = -0.5;

void setup () {
  size(300, 300, P3D);
  background(0);
}

void draw() {
  
  drawSphere();
  
}

void drawSphere() {
  
  translate(150,150,0);
  fill(255);
  noStroke();
  
  rotateX(myX);
  rotateY(myY);
  
  pointLight(70,219,217,-150,-240,-150); //blue
  pointLight(212,116,172,150,240,150); //pink
  pointLight(232,235,160,150,-120,-500); //yellow
  pointLight(160,235,187,-300,170,300); //green
  pointLight(235,191,160,-150,-1000,800); //orange
  
  sphere(100);
  
  myY+=0.05;
  
}
