
/* @pjs font="WireOne.ttf"; */

int  myState=0;
PFont wireone;
PImage blueprint;
PImage group;
PImage trio;
PImage duo;
PImage center;

void setup() {
  size(500,500);
  smooth();
  wireone=createFont("WireOne.ttf", 50);
  textFont(wireone);
  blueprint=loadImage("blueprint.png");
  group=loadImage("Group.jpg");
  trio=loadImage("TrioDark.jpg");
  duo=loadImage("CrumpledDark.jpg");
  center=loadImage("CenterDark.JPG");
}


void draw() {
  
  background(250);
  
  switch(myState) {
    case 0:
    fill(0);
    textSize(50);
    text("Fade", 10, 480);
    textSize(30);
    text("by Ashley Fenner", 70, 480);
    image(blueprint, 0, 0);
    break;
    
    case 1:
    image(group, 0, 0);
    break;
    
    case 2:
    image(duo, 0, 0);
    break;
    
    case 3:
    text("We are in state 3", 10, 50);
    image(trio, 0, 0);
    break;
    
    case 4:
    image(center, 0, 0);
    break;
  }
}

void mousePressed() {
//  println("clicked mouse!");
  myState=myState+1;
  if (myState>4) {
    myState=0;
  }
}


