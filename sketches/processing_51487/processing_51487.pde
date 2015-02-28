
//homework 6 rwandrew
//copyright russell andrews 2012

float dx, dy, dwd, dht;
float dxspeed, dyspeed;

float px, py, pwd, pht;
float pxspeed, pyspeed;

PImage p;

void setup(){
  size(400,400);
  smooth();
  
  //loads image
  p = loadImage("beyonce.jpg");
  imageMode(CENTER);
  
  
  //controls wrap
  dx = random(0,400);
  dy = random(0,400);
  dwd = 100;
  dht = 100;
  dxspeed = random(1,2);
  dyspeed = random(1,2);
  
  //controls bounce
  px = random(0,400);
  py = random(0,400);
  pwd = 100;
  pht = 100;
  pxspeed = random(1, 2);
  pyspeed = random(1, 2);
}

//table of contents
void draw(){
  windowPrep();
  drawInitials(dx, dy, dwd, dht);
  drawImage();
  wrapInitials();
  bounceInitials();
}

//makes the faded trail
void windowPrep(){
  fill(255, 20);
  rect(0, 0, width, height);
}

//makes cinitials wrap
void wrapInitials(){
  dx = dx + dxspeed;
  dy = dy + dyspeed;
 
  if (dx > width + 50 || dx < -50){
    dx = -50;
  }
  if (dy > height + 50 || dy < -50){
    dy = -50;
  }
}

//makes picture bounce
void bounceInitials(){
  px = px + pxspeed;
  py = py + pyspeed;
  
  if (px > width - 50 || px < 50){
    pxspeed *= -1;
  }
  if (py > height - 50 || py < 50) {
    pyspeed *= -1;
  }
}

//draws the initials
void drawInitials(float x, float y, float wd, float ht){
  background(84, 2, 2);
  //boundaries
  fill(#609170);
  strokeWeight(.035*wd);
  stroke(#991212);
  ellipse(x, y, wd, ht);
  //first initial r
  stroke(#EDE0A6);
  noFill();
  beginShape();
    vertex(x - .35*wd, y - .23*ht);
    vertex(x - .35*wd, y + .15*ht);
  endShape();
  beginShape();
    curveVertex(x - .20*wd, y + .40*ht);
    curveVertex(x - .35*wd, y - .13*ht);
    curveVertex(x - .215*wd, y - .27*ht);
    curveVertex(x - .08*wd, y - .13*ht);
    curveVertex(x - .19*wd, y + .40*ht);
  endShape();
  //second initial w
  beginShape();
  vertex(x - .215*wd, y - .04*ht);
  vertex(x - .215*wd, y + .15*ht);
  endShape();
  
  beginShape();
  curveVertex(x - .155*wd, y - .25*ht);
  curveVertex(x - .215*wd, y + .15*ht);
  curveVertex(x - .1075*wd, y + .26*ht);
  curveVertex(x, y + .15*ht);
  curveVertex(x - .06*wd, y - .25*ht);
  endShape();
  
  beginShape();
  curveVertex(x + .155*wd, y - .25*ht);
  curveVertex(x + .215*wd, y + .15*ht);
  curveVertex(x + .1075*wd, y + .26*ht);
  curveVertex(x, y + .15*ht);
  curveVertex(x + .06*wd, y - .25*ht);
  endShape();
  
  beginShape();
  vertex(x + .215*wd, y - .04*ht);
  vertex(x + .215*wd, y + .15*ht);
  endShape();
  //third initial a
  beginShape();
    vertex(x + .35*wd, y - .13*ht);
    vertex(x + .35*wd, y + .15*ht);
  endShape();
  beginShape();
    curveVertex(x + .20*wd, y + .40*ht);
    curveVertex(x + .35*wd, y - .13*ht);
    curveVertex(x + .215*wd, y - .27*ht);
    curveVertex(x + .08*wd, y - .13*ht);
    curveVertex(x + .19*wd, y + .40*ht);
  endShape();
  ellipse(x + .216*wd, y + .02*ht, .27*wd, .27*ht);
}


//controls image
void drawImage(){
  smooth();
  noStroke();
  image(p, px, py, pwd, pht);
}

