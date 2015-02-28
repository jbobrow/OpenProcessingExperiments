
//Nicholas Kiray
//9/20/13
//this is a very simple dynamic portrait, which creates colorful, circle patterns every time.
//hold down the mouse and drag to create rays of light from the top-left corner.
//erase everything on the page, and create a new random background with any key
//press "s" to save your design!
float circlesize;
float diam;

float a;

float randomLineX;
float randomLineY;

float randomCircleSizeX;
float randomCircleSizeY;

void setup() {
  size (800,600);
  frameRate(40);
  background(25);
  colorMode(HSB, displayWidth,displayHeight,900);
  fill(random(displayWidth));
  
  randomCircleSizeX=(-30);
  randomCircleSizeY=(30);
  a = 60;
  randomLineX =(-300);
  randomLineY=(300);
}

//draw random circles
//fill will be determined by mouse movement with random element

void draw() {
  //holding down the mouse while dragging creates beams of light
  if (mousePressed == true) {

    stroke(displayWidth,a);
    strokeWeight(3);
    line(0, 0, mouseX+random(randomLineX,randomLineY), mouseY+random(randomLineX,randomLineY));

    //when not pressing mouse, random, colored, transparent circles will appear.
  } 
  else { 

    noStroke();
    ellipseMode(RADIUS);
    fill(mouseY+random(900), 800, mouseX+random(900), a);
    ellipse(mouseX+(random(randomCircleSizeX,randomCircleSizeY)), mouseY+(random(randomCircleSizeX,randomCircleSizeY)), diam, diam);
    
    diam = random(20,100);
  }
}

//press any key to clear the background, and change to a random color
void keyPressed() {
  if (key == 's' || key =='S') {
    save("design.tif");
  } 
  else {
    background (random(800), random(800), random(800));
  }
}



