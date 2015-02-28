
ParticleSystem ps;
int i = 0;
PImage feed;
int palette[] = new int[5]; 

void setup() {
  size(512, 512, P2D);
  colorMode(RGB, 255);
  smooth();
  ps = new ParticleSystem(1000);
  // http://www.colourlovers.com/palette/1014170
  palette[0]  = color(236,219,113);
  palette[1]  = color(153,115,74);
  palette[2]  = color(6,29,37);
  palette[3]  = color(0,80,61);
  palette[4]  = color(17,41,22);
  background(palette[4]);
}

void draw() {
  ps.run();
  // this will stretch the image and blur it, with feedback
  feed = get(1,1,width-2,height-2);
  image(feed,0,0,width,height);
  // add atraction
  if (mousePressed && this.mouseButton == LEFT){
    ps.addAttraction(mouseX,mouseY, 2.2f);
  }
  // add repulsion
  if (mousePressed && this.mouseButton == RIGHT){
    ps.addRepulsion(mouseX,mouseY,-2.2f);
  }
  ps.addFriction(-0.1f);
  if (keyPressed) {
    saveFrame();
  }
}



