
int bt1X, bt1Y, bt2X, bt2Y, bt3X, bt3Y, bt4X, bt4Y, bt5X, bt5Y, bt6X, bt6Y;
int margin, buttonH, buttonW, lineWidth, z, canCount;

boolean bb1 = true;
boolean bb2 = false;
boolean bb3 = false;
boolean bb4 = false;
boolean bb5 = false;
boolean bb6 = false;
boolean panel = true;

PImage bt1;
PImage bt2;
PImage bt3;
PImage bt4;
PImage bt5;
PImage bt6;
PImage canvas;
PImage arrow;
PImage pan;



void setup()
{
  size(750, 750);
  //imageMode(CENTER);
  //rectMode(CENTER);
  background(0);
  frameRate(50);

  bt1 = loadImage("assets/button1.png");
  bt2 = loadImage("assets/button4.png");
  bt3 = loadImage("assets/button6.png");
  bt4 = loadImage("assets/button8.png");
  bt5 = loadImage("assets/button10.png");
  bt6 = loadImage("assets/button12.png");
  pan = loadImage("assets/panel.jpg");

  margin = 10;
  buttonH = int(50*0.8);
  buttonW = int(80*0.8);

  z = 0;
  canCount = 0;

  bt1X = 140;
  bt1Y = 690;
  bt2X = bt1X+buttonW+margin;
  bt2Y = bt1Y;
  bt3X = bt2X+buttonW+margin;
  bt3Y = bt1Y;
  bt4X = bt3X+buttonW+margin;
  bt4Y = bt1Y;
  bt5X = bt4X+buttonW+margin;
  bt5Y = bt1Y;
  bt6X = bt5X+buttonW+margin;
  bt6Y = bt1Y;
}

void draw()
{
  // print(frameRate);
  fill(50);
  noStroke();
  if (panel) {   //Display controlpanel & buttons for brushes
    if (bb6) {
      background(0);
      bb6 = !bb6;
      bt6 = loadImage("assets/button11.png");
    }
    image(pan, 0, (bt1Y-margin), width, height);

    image(bt1, bt1X, bt1Y, buttonW, buttonH);
    tint(255, 255);
    image(bt2, bt2X, bt2Y, buttonW, buttonH);
    tint(255, 255);
    image(bt3, bt3X, bt3Y, buttonW, buttonH);
    tint(255, 255);
    image(bt4, bt4X, bt4Y, buttonW, buttonH);
    tint(255, 255);
    image(bt5, bt5X, bt5Y, buttonW, buttonH);
    tint(255, 255);
    image(bt6, bt6X, bt6Y, buttonW, buttonH);
    tint(255, 255);
    z= 0;

    arrow = loadImage("assets/arrow2.png");
    image(arrow, 0, height-20, 30, 20);
  }
  else if (!panel) {  // Hide controlpanel, reload painting to continue

    if (z<=0) {

      fill(0);
      rect(0, (bt1Y-margin), width, height);
      z = 1;
    }
    if ( canCount == 1 )
    {
      image(canvas, 0, 0, width, height);
      canCount=0;
    }
    fill(50);
    //rect(0, (height-(margin*3)), width, height);

    arrow = loadImage("assets/arrow1.png");
    image(arrow, 0, height-20, 30, 20);
  }
}

void mouseDragged()
{
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  float green = dist(mouseX, mouseY, width/2, height/2);
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 10);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 10);



  noStroke();
  fill(0, alpha);
  stroke(red, green, blue, 255);
  strokeWeight(20);
  if (bb1) {
    strokeWeight(lineWidth *0.5);
    ellipse(mouseX, mouseY, speed, speed);
  }
  if (bb2) {
    strokeWeight(lineWidth*0.7);
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(random(speed));
    rect(0+random(50), 0+random(50), 10, 10); 
    popMatrix();
  }
  if (bb3) {
    strokeWeight(lineWidth*0.6);
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(random(speed));
    line(0+random(50), 0+random(50), 0, 0);
    rotate(random(speed));
    line(0+random(50), 0+random(50), 0, 0);
    rotate(random(speed));
    line(0+random(50), 0+random(50), 0, 0);
    popMatrix();
  }
  if (bb4) {
    strokeWeight(lineWidth);
    line(mouseX, mouseY, pmouseX, pmouseY);
    line(width/2+((width/2)-pmouseX), pmouseY, width/2+((width/2)-mouseX), mouseY);
    return;
  }
  if (bb5) {
    float radius = map(mouseX, 0, width, 0, 10);
    float rotation = map(mouseY, 0, height, 0, 10);
    int elements = 30;
    int magnify = 200;
    float spacing = TWO_PI/elements; 
    translate(mouseX, mouseY);
    noFill();
    strokeWeight(lineWidth);
    colorMode(HSB);
    for (int i = 0; i < elements;i++) {
      stroke(i*2, 255, 255, 50);
      pushMatrix();
      rotate(spacing*i*rotation);
      translate(sin(spacing*i*radius)*magnify, 0);
      ellipse(0, 0, 20, 20);
      popMatrix();
    }
    colorMode(RGB);
  } 
  if (bb6) {
  }
}

void mouseClicked()
{
  if (panel  && mouseX >= 0 && mouseX <= 30 && (mouseY >= height-20) && mouseY <= height ) {
    panel = !panel;
  }
  else if (!panel  && mouseX >= 0 && mouseX <= 30 && (mouseY >= height-20) && mouseY <= height) {
    save("canvas.png");
    canvas = loadImage("canvas.png");
    canCount = 1;
    panel = !panel;
  }
  if (panel && (mouseX >= bt1X) && (mouseX <= (bt1X+buttonW)) && (mouseY >= bt1Y) && (mouseY <= (bt1Y+buttonH)) ) {
    if (bb1) {
      bt1 = loadImage("assets/button2.png");
      bb1= !bb1;
    } 
    else if ( !bb1 ) {
      bt1 = loadImage("assets/button1.png");
      bb1= !bb1;
    }
  }

  if (panel && (mouseX >= bt2X) && (mouseX <= (bt2X+buttonW)) && (mouseY >= bt2Y) && (mouseY <= (bt2Y+buttonH)) ) {
    if (bb2) {
      bt2 = loadImage("assets/button4.png");
      bb2= !bb2;
    } 
    else if ( !bb2 ) {
      bt2 = loadImage("assets/button3.png");
      bb2= !bb2;
    }
  }

  if (panel && (mouseX >= bt3X) && (mouseX <= (bt3X+buttonW)) && (mouseY >= bt3Y) && (mouseY <= (bt3Y+buttonH)) ) {
    if (bb3) {
      bt3 = loadImage("assets/button6.png");
      bb3= !bb3;
    } 
    else if ( !bb3 ) {
      bt3 = loadImage("assets/button5.png");
      bb3= !bb3;
    }
  }

  if (panel && (mouseX >= bt4X) && (mouseX <= (bt4X+buttonW)) && (mouseY >= bt4Y) && (mouseY <= (bt4Y+buttonH)) ) {
    if (bb4) {
      bt4 = loadImage("assets/button8.png");
      bb4= !bb4;
    } 
    else if ( !bb4 ) {
      bt4 = loadImage("assets/button7.png");
      bb4= !bb4;
    }
  }

  if (panel && (mouseX >= bt5X) && (mouseX <= (bt5X+buttonW)) && (mouseY >= bt5Y) && (mouseY <= (bt5Y+buttonH)) ) {
    if (bb5) {
      bt5 = loadImage("assets/button10.png");
      bb5= !bb5;
    } 
    else if ( !bb5 ) {
      bt5 = loadImage("assets/button9.png");
      bb5= !bb5;
    }
  }
  if (panel && (mouseX >= bt6X) && (mouseX <= (bt6X+buttonW)) && (mouseY >= bt6Y) && (mouseY <= (bt6Y+buttonH)) ) {
    if (bb6) {
      bt6 = loadImage("assets/button12.png");
      bb6= !bb6;
    } 
    else if ( !bb6 ) {
      bt6 = loadImage("assets/button11.png");
      bb6= !bb6;
    }
  }
}
