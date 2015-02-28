
//text
PFont font;
PFont Designer;
PFont Write;
String letters = "";

//put a cursor on a rect
int x = 360;
int y = 360;
int w = 80;
int h = 80;

//mouse cursor image
float t = 0.0;
float u = 0.0;
float easing = 0.1;

void setup() {
  size(600,600);
  noCursor();
}

void draw() {
  //basic ellipse
  background(0);
  stroke(0);
  strokeWeight(0.5);
  smooth();
  for(int y = 0; y <= height; y += 80 + 20) {
    for(int x = 0; x <= width; x += 80 + 20) {
      fill(48,27,55);
      noStroke();
      ellipse(x,y,80,80);
    }
  }

  //free text
  font = loadFont("ahn2006-M-20.vlw"); 
  textFont(font);
  stroke(0);
  fill(160);
  text(letters, 450, 378, 130, 80);
  if( keyPressed == true ) {
    letters = letters + key;
  }

  //put a cursor on a rect
  if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
    fill(255);
  }
  else {
    fill(180,84,116);
  }
  rect(x, y, w, h);

  //Designer text
  fill(255);
  PFont Designer;
  Designer = loadFont("ahn2006-M-48.vlw");
  textFont(Designer);
  text("Designer", 220,420);
  
  //write text
  fill(160);
  PFont Write;
  Write = loadFont("ahn2006-M-20.vlw");
  textFont(Write);
  text("Write!!", 450,375);

  //mouse cursor image
  noStroke();
  float targetT = mouseX;//c
  float targetU = mouseY; 
  t += (targetT - t) * easing;
  u += (targetU - u) * easing;
  fill(48,27,55);
  ellipse(mouseX,mouseY, 80,80);
}

