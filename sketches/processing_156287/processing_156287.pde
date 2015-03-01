
float xPos;
float yPos;
float xPos2;
float yPos2;
float rectW =100;
float rectH = 100;
PFont font;

boolean y1 = false;
boolean n1 = false;

boolean y2 = false;
boolean n2 = false;

boolean y3 = false;
boolean n3 = false;

void setup() {
  size (800, 800);
  xPos = width/2;
  yPos = height/2;
  font = loadFont("Monospaced-48.vlw");
  textFont (font, 20);
}

void draw() {
  background(0);

  textAlign(CENTER);
  text("Is Lebron the best player in the game?", width/2, height/8);
  text("Yes", 100, 200);
  text("No", 600, 200);

  if (y1 == true) {
    textAlign(LEFT);
    text("Was going back Cleveland a good idea?", 150, 300); 
    textAlign(CENTER);
   text("Yes", 100, 400);
   text("No", 200, 400);
  }

  if (y2 == true) {
    textAlign(LEFT);
    text("The King is Back!", 150, 500); 
    textAlign(CENTER);
  }
  
    if (y3 == true) {
    textAlign(LEFT);
    text("Let's wait and see...", 150, 500); 
    textAlign(CENTER);
  }
  
    if (n1 == true) {
    textAlign(CENTER);
    text("Are you sure?", 550, 300); 
    textAlign(CENTER);
   text("Yes", 500, 400);
   text("No", 600, 400);
  }

  if (n2 == true) {
    textAlign(LEFT);
    text("It's OK he's the best!", 350, 500); 
    textAlign(CENTER);
  }
  
    if (n3 == true) {
    textAlign(LEFT);
    text("I'd be doubtful too...", 400, 500); 
    textAlign(CENTER);
  }

  /*
    text("Yes", 400, 200);
    text("No", 500, 200);
   text("Yes", 500, 500);
   text("No", 600, 500);
   */
}

void mousePressed() {
  if (y1 == false && mouseX>90 && mouseX<110 && mouseY>190 && mouseY<210) {
    y1=true;
  }
    if (y2 == false && mouseX>90 && mouseX<110 && mouseY>390 && mouseY<410) {
    y2=true;
  }
      if (y3 == false && mouseX>190 && mouseX<210 && mouseY>390 && mouseY<410) {
    y3=true;
  }
  
    if (n1 == false && mouseX>590 && mouseX<610 && mouseY>190 && mouseY<210) {
    n1=true;
  }
    if (n3 == false && mouseX>590 && mouseX<610 && mouseY>390 && mouseY<410) {
    n3=true;
  }
      if (n2 == false && mouseX>490 && mouseX<510 && mouseY>390 && mouseY<410) {
    n2=true;
  }
}



