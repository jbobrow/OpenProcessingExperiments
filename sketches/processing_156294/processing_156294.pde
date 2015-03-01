
/* @pjs preload="space_girl.png, earth.png, rocket.png, moon.png, sun.png, explode.png"; */

  
int rectWidth = 100;
int rectHeight = 100;
int xPos, yPos;
int xPos2, yPos2;
//int 

//earth location
int earthLocationX = 111;
int earthLocationY = 400;

//images
PImage spaceGirl;
PImage earth;
PImage rocket;
PImage moon;
PImage sun;
PImage explode;

//font
PFont font;

float angle = 0.0;


void setup() {
  size(500, 500);
  background(0,0,0);
  xPos = (width/2 - rectWidth/2);
  yPos = (height/2 - rectHeight/2);
  xPos2 = (width/2 + rectWidth/2);
  yPos2 = (height/2 + rectHeight/2);
  
  //images
  spaceGirl = loadImage("space_girl.png");
  earth = loadImage("earth.png");
  rocket = loadImage("rocket.png");
  moon = loadImage("moon.png");
  sun = loadImage("sun.png");
  explode = loadImage("explode.png");
  

  
  //font - first time loading a font!
  font = loadFont("Gotham-Bold-48.vlw");
}



void draw() {
  background(0,0,0);
  textSize(14);
  textAlign(LEFT);
  text("Explore your galaxy!", 50, 50);
  
  //sun
  image(sun, 200, -300, 600, 600);
  
  //earth
  image(earth, 50, 400, 130, 130);

  //black hole!
  if((mouseX > xPos) && (mouseX < xPos2) && (mouseY > yPos) && (mouseY < yPos2)) {
    textAlign(CENTER);
    textSize(48);
    text("BLACK HOLE!", width/2, height/2);
  } 
  
  //blastoff!
  if((mouseX < 175) && (mouseX > 60) && (mouseY > 400)) {
    image(rocket, 200, 250, 80, 80);
  } else {
    image(rocket, 85, 400, 80, 80);
  }
  

  //trying out an image for the first time!
  //spacegirl follows mouse
  noCursor();
  image(spaceGirl, mouseX - 10, mouseY + 10, 40, 50);

  
  //moon rotates around earth?
  if((mouseX > 350) && (mouseX < 400) && (mouseY > 325) && (mouseY < 400)) {
    //attempting to use rotate... :(
    translate(111, 460);
    rotate(angle);
    image(moon, 170, 170, 50, 50);
    angle += 0.05;
    translate(0,0);
    
  } else {
    image(moon, 350, 350, 50, 50);
  }

  //explode in the sun
  if((mouseX > 400) && (mouseY < 100)) {
    image(explode, mouseX - 10, mouseY + 10, 40, 50);
  } 
}


