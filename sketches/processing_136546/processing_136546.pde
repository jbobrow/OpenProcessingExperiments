
int myState = 0;
PFont cursive;
PImage fireworks;

void setup() {
  size(500, 500);
  cursive = createFont("Allura-Regular.ttf", 200);
  fireworks = loadImage("fireworks.png");
}

void draw() {
  background(0);
  textAlign(CENTER);
  
  switch(myState) {
  
  case 0:
  textFont(cursive, 35);
  text("January", 50, 50, 400, 400);
  break;
  
  case 1:
  textFont(cursive, 35);
  text("February", 50, 50, 400, 400);
  break;
  
  case 2:
  textFont(cursive, 35);
  text("March", 50, 50, 400, 400);
  break;
  
  case 3:
  textFont(cursive, 35);
  text("April", 50, 50, 400, 400);
  break;
  
  case 4:
  textFont(cursive, 35);
  text("May", 50, 50, 400, 400);
  break;
  
  case 5:
  textFont(cursive, 35);
  text("June", 50, 50, 400, 400);
  break;
  
  case 6:
  textFont(cursive, 35);
  text("July", 50, 50, 400, 400);
  break;
  
  case 7:
  textFont(cursive, 35);
  text("August", 50, 50, 400, 400);
  break;
  
  case 8:
  textFont(cursive, 35);
  text("September", 50, 50, 400, 400);
  break;
  
  case 9:
  textFont(cursive, 35);
  text("October", 50, 50, 400, 400);
  break;
  
  case 10:
  textFont(cursive, 35);
  text("November", 50, 50, 400, 400);
  break;
  
  case 11:
  textFont(cursive, 35);
  text("December", 50, 50, 400, 400);
  break;
  
  case 12:
  image(fireworks, 0, 0);
  textFont(cursive, 35);
  text("HAPPY NEW YEAR", 50, 50, 400, 400);
  break;
  }
}

void mousePressed() {
  myState = (myState + 1);
  if (myState > 12){
  myState = 0;
  }
}



