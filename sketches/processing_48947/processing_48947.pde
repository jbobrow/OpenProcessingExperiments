
Parser parser;
PFont font;

void setup() {
  size(512, 512, P3D);
  parser = new Parser("skeleton.bvh");

  font = loadFont("SempliceRegular-8.vlw");
  textFont(font);
  textMode(SCREEN);
  
  noiseSeed(19);

  noSmooth();
}

void draw() {

  background(255);
  fill(255, 128, 0);
  strokeWeight(10);
  directionalLight(255, 200, 200, 0, 0, -300);

  pushMatrix();

  noStroke();
  parser.drawHieratical(); 

  stroke(0, 35);
  parser.draw();
  
  popMatrix();
}


