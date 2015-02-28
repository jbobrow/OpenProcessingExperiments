
void setup() {
  size(300,300);
  colorMode(RGB,width);
  background(width);
  frameRate(12);
}

//the variables provide an input to create a dynamic structure
int levelHeight = 16;
float levelWidth = random(40,60);
int levelSpacing = 0;


void draw() {
  //building a ground shape
  colorMode(RGB,width);
  noStroke();
  fill(width/2,200,100,25);
  beginShape();
  vertex(0,height);
  vertex(0,(3*height)/4);
  vertex(width,(3*height)/4);
  vertex(width,height);
  endShape();

  //conditional statement that draws structure when the mouse is below the ground
  if(mouseY > (3*height)/4) {
    colorMode(HSB,200);
    stroke(0);
    strokeWeight(1);
    noFill();
  }
  else {
    stroke(250);
    strokeWeight(.5);
  }
  //creating additional levels through mousePressed function
  //they will be differnt based on whether or not the mouse is above or below ground (caused by the if/else statements above)
  if(mousePressed) {
    quad(width/2 - levelWidth,(3*height)/4 - levelSpacing,width/2 + levelWidth,(3*height)/4 - levelSpacing,width/2 + levelWidth,((3*height)/4) - levelHeight - levelSpacing,width/2 - levelWidth,((3*height)/4) - levelHeight - levelSpacing);
    line(width/2,(3*height)/4 - levelSpacing,width/2,(3*height)/4 - levelHeight - levelSpacing);
    //creating bracing
    if(mouseX > width/2) {
      if(mouseY > (3*height)/4) {
        strokeWeight(.25);
        line(width/2,(3*height)/4 - levelSpacing,width/2 - levelWidth,(3*height)/4 - levelHeight - levelSpacing);
        line(width/2,(3*height)/4 - levelSpacing,width/2 + levelWidth,(3*height)/4 - levelHeight - levelSpacing);
        line(width/2,(3*height)/4 - levelHeight - levelSpacing,width/2 - levelWidth,(3*height)/4 - levelSpacing);
        line(width/2,(3*height)/4 - levelHeight - levelSpacing,width/2 + levelWidth,(3*height)/4 - levelSpacing);
      } 
    }
      levelSpacing += 15;
    }
    //limit the structure to a 12-story structure
    //by reseting the level spacing variable after a certain height
    if(levelSpacing > 180) {
      colorMode(RGB,width);
      background(width);
      levelSpacing = 0;
    }
  }


