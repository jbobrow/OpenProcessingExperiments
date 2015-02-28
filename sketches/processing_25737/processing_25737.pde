
//easing
float x;
float y;
float easing = 0.1;


void setup() {
  size(500, 450);
  smooth();
  println("Deadmau5");
  x = 50;
  y = 40;
  noCursor();
}

void draw() {


  //easing
  float targetX = mouseX;
  x += (targetX - x) * easing; 
  float targetY = mouseY;
  y += (targetY - y) * easing;

  if (mousePressed == true) {
    background(240, 50, 90);
  }
  else {
    background(160, 170, 200);
  }
  strokeWeight(2);

  //ears

  if (mousePressed == true) {
    fill(51, 51, 245);
  }
  else {
    fill(240, 61, 81);
  }

  ellipse(x-90, y-80, 150, 120);
  ellipse(x+90, y-80, 150, 120);

  //head
  ellipse(x, y, 150, 150);

  //mouth

  fill(255, 255, 255);

  arc(x, y, 130, 130, 0, 3.14);
  line(x-65, y, x+65, y);

  //eyes
  if (mousePressed == true) {
    fill(255, 247, 25);
  }
  else { 
    fill(255, 255, 255);
  }
  ellipse(x-40, y-30, 40, 40);
  ellipse(x+40, y-30, 40, 40);

  if (mousePressed == true) {
    strokeWeight(5);
    line(x-30, y-20, x-50, y-40);
    line(x-50, y-20, x-30, y-40);
    line(x+30, y-20, x+50, y-40);
    line(x+50, y-20, x+30, y-40);
  }

  //deadmau5 text
  PFont font;
  font = loadFont("Arial-Black-40.vlw");
  textFont(font);
  textAlign(CENTER);
  String r = "deadmau5";
  if(mousePressed == true) {
    r = "deadmau5";
  } 
  else {
    r = "";
  }
  fill(255, 255, 255);
  text(r, 250, 440);
}


