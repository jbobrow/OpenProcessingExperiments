
/* @pjs preload="sketch02.jpg"; */

//Washing Pork sketch
PImage img;
int space = 3; // How spaced apart the water drops are
int count; // How many water drops
Water[] drops;

void setup(){
  size(500, 375);
  img = loadImage("sketch02.jpg");
  frameRate(40);
  int wideCount = 15/space;
  int highCount = height/space;
  count = wideCount * highCount;
  drops = new Water[count];
  
  int index=0;
  for(int yy = 0; yy < highCount; yy++) {
    for (int xx = 0; xx < wideCount; xx++) {
      drops[index++] = new Water(252+(xx*space+random(-2,2)), 38+(yy*space+random(-2,2)));
    }
    
  }
}

void draw(){
  image(img, 0, 0);
 for (int i = 0; i < count; i++) {
   drops[i].run();
 } 
}

// CLASS FOR RUNNING WATER
class Water{
  float xpos; // Initial x position stored for resetting water drop
  float bxpos; // X Position used for drawing
  float ypos; // Moving y position
  float w; // Water drop width
  float h; // Water drop height
  float c; // Fill color
  float sc; // Stroke color
  float speed; // Sets the speed of the water falling
  float bounce; // Defines random bounce value with bounceAmount's help
  float bounceAmount; // Changes with speed
  
  Water(float tempxpos, float tempypos){
    xpos = tempxpos;
    ypos = tempypos;
    bxpos = xpos;
    w = 2;
    h = 2;
    c = 150;
    sc = 255;
    speed = 2;
    bounce = random(-2, 2);
  }
  
  void run(){
  smooth();
  fill(c);
  stroke(sc, 80);
  strokeWeight(1);
  ellipse(bxpos, ypos, w, h);
  
  ypos+=speed; // rate the water falls
  
  if(ypos > 235) { //If water hits fingers, bounce off
    bxpos += bounce;
  }
  
  if(ypos > 410) { // If water goes off-screen, restart at faucet
  ypos = 40;
  bxpos = xpos;
  }
  
  if(mouseY > pmouseY){ // If mouse is moving down, increase water flow
    speed += random(0.2);
    if (bounce > 0) {
      bounce += random(0.1);
    } else {
      bounce -= random(0.1);
    }
  }
  
  if(mouseY < pmouseY){ // If mouse is moving up, slow down water flow
    speed -= random(0.2);
     if (bounce > 0) {
      bounce -= random(0.1);
    } else {
      bounce += random(0.1);
    }
  }
  
  
  }
  
}

