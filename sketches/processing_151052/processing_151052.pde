
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// CHOI Jihye
// 201420116


import ddf.minim.*;

Minim minim;
AudioPlayer song;

float x, x2, x2Last;
float y, y2, y2Last;
float xSpeed = 1;
float ySpeed = 1;
float dS;

boolean switchStroke = true;
boolean onOff = true;
boolean backGround = true;
boolean shape = true;

// --------------------------------------------
void setup() {
  //size(800, 600); 
  size(displayWidth, displayHeight);
  smooth();

  colorMode(HSB, width, 100, 100);
  cursor(CROSS);

  x2=width/2;
  y2=height/2;
  mouseX=width/2;
  mouseY=height/2;

  minim = new Minim (this);
  song = minim.loadFile("Out Of Town.mp3");
  song.play();
  song.loop();
  
  title();
}

// --------------------------------------------
void draw() {

  x = x + xSpeed;
  y = y + ySpeed;

  float d = song.mix.level()*100;
  dS = dS*0.9 + d*0.8;
  println(dS);

  if ((x > width) || (x < 0)) {
    xSpeed = xSpeed * -1;
  }
  if ((y > height) || (y < 0)) {
    ySpeed = ySpeed * -1;
  }

  noFill();
  stroke(x, 100, 100, dS);
  strokeWeight(1);

  if (shape) {
    line (x, y, x2, y2);

    strokeWeight(dS/50);
    stroke(0);
    line (x2, y2, x2Last, y2Last);
  }
  if (!shape) {

    bezier (x, y, x2, y2, x2, y2, width-x, height-y);
  }

  x2 = lerp (x2, mouseX, 0.01);
  y2 = lerp (y2, mouseY, 0.01);

  x2Last = x2;
  y2Last = y2;

  title();
}


// --------------------------------------------
void keyPressed() {
  if (key=='s') saveFrame("images/"+hour()+minute()+"_####.jpg");
  if (keyCode==BACKSPACE) {
    saveFrame("frames/"+hour()+minute()+"_####.jpg");
    if (backGround) background(#eeeeee);
    if (!backGround) background(0);
  }
  if (keyCode==TAB) backGround = !backGround;
  if (backGround) background(#eeeeee);
  if (!backGround) background(0);

  if (key==' ') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();

  if (key=='1') shape = !shape;
}
void title() {
  if (backGround) fill(0);
  if (!backGround) fill(0, 0, 100);
  textSize(14);
  textAlign(RIGHT);
  text("CHOI Jihye, untitled, 2014", width-50, height-20);
  textAlign(LEFT);
  text("TAB baclground  1 line/bezier  BACKSPACE clean ", 50, height-20);
}

