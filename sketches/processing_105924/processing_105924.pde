
PImage color1;
PImage color2;
PFont t;
int a;//declair number
int b;


//declair button1
int buttonX1;
int buttonY1;
int buttonSize;
int hover1;
boolean button1; 

//declair button2
int buttonX2;
int buttonY2;
int radius;
int hover2;
boolean button2;
float d;

void setup() {
  size(500, 550);
  color1 = loadImage("color1-01.jpg");
  color2=loadImage("color1-02.jpg");
  ellipseMode(RADIUS);
  buttonX1 = 10;
  buttonY1 = 10;
  buttonX2 = 60;
  buttonY2 = 25;
  radius = 15;
  buttonSize = 30;
  t = loadFont("t.vlw");
  button1 = false;
  button2 = false;


  textSize(20);
  fill(255);
  d = dist(mouseX, mouseY, buttonX2, buttonY2);
}

void draw() {
  background(180, 230, 230);
  text(a, 400, 50);

  a++;
  if (button1) {
    image(color1, 0, 0);
  }
  else
  {
    fill(180, 230, 230);
  }
  if (button2 == true) {
    image(color2, 0, 0);
  }
  else
  {
    fill(180, 230, 230);
  }


  noStroke();
  fill(255);
  rect(buttonX1, buttonY1, buttonSize, buttonSize);
  ellipse(buttonX2, buttonY2, radius, radius);
}

void mouseClicked() {
  if (mouseX>buttonX1 && mouseX<buttonX1+buttonSize &&
    mouseY>= buttonY1 && mouseY <= buttonY1+buttonSize);
  {
    button1 = !button1;
  }


  if ((d < radius)&&(d>0));
  {
    button2=!button2;
  }
}










