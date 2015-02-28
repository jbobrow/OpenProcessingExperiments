
Parser parser;
PFont font;

Brain brain;

void setup() {
  size(512, 640, P3D);
  parser = new Parser("skeleton.bvh");

  brain = new Brain(64, 2);

  font = loadFont("SempliceRegular-8.vlw");
  textFont(font);
  textMode(SCREEN);

  noiseSeed(19);

  noSmooth();
}

void draw() {

  fill(54, 54, 64);

  background(54-20, 54-20, 64-20);
  //tint(255,134);
  //image(g,random(-10,10),-10);



  fill(100);
  strokeWeight(25);
  directionalLight(255, 240, 250, 0, 0, -300);
 // directionalLight(23, 23, 45, width, 0, -300);
 // directionalLight(23, 23, 45, width, 0, 600);
 // directionalLight(23, 23, 45, 0, 0, 600);
ambientLight(12,24,0);

  pushMatrix();

  noStroke();
  parser.drawHieratical(); 

  stroke(0);
  parser.draw();

  popMatrix();


  blend(g, 0, 0, width, height, 0, -1, width, height-1, SOFT_LIGHT);


  
  brain.draw(72,72);
}




