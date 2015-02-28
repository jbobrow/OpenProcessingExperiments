
/*
  nate rudolph
 aug 9
 bootcamp - code
 Hungry Owl
 */
PImage owlBg;
PImage leftPupil;
PImage rightPupil;
PImage rat;
float rightX;
float rightY;
float leftX;
float leftY;


void setup() {
  smooth();
  size(800, 500);
  owlBg = loadImage("owlBg.jpg");
  rightPupil = loadImage("rightPupil.png");
  leftPupil = loadImage("leftPupil.png");
  rat = loadImage("mouse.png");

  

}

/*  original right position is (695,80)   */
/*  original left position is (535,117)   */


void draw() {
  noCursor();
  rightX = constrain(mouseX, 685, 710);
  leftX = constrain(mouseX, 525,545);
  rightY = constrain(mouseY, 70, 90);
  leftY = constrain(mouseY, 100, 120);
  
  
  image(owlBg, 0, 0);
  image(rightPupil, rightX, rightY);
  image(leftPupil, leftX, leftY);

  image(rat, mouseX-70, mouseY-70);
  
  if (mousePressed){
    textSize(50);
    text("whoooo", random(50,60), random(80,90)); 
  }
}


