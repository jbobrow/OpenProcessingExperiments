
  PImage fig, bPortal, oPortal; 
  PImage figA = fig, figB;
  float opX, opY, bpX, bpY, bpY2, imgX, imgY;
  float spdY = 4;
  float gravity = .02;
  int row;
  boolean leftClicked = false;
  boolean rightClicked = false;
  
  
   
void setup() {
  size(500, 500);
  smooth();
  imageMode(CENTER);
  
  PImage gun = loadImage("portalgun.png");
  cursor(gun, 0, 0);
  
  
  println("Welcome to the Portal 2D Simulator.");
  println("Left click creates an orange portal, and right click creates a blue portal.");
  println("Cake, and grief counseling, will be available at the conclusion of the test. ");
  

}

void draw() {
  

    bkgrnd(10);
    portals();
    falling();
 
  
}

