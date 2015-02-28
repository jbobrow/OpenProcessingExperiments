
//homework 7 rwandrew
//copyright russell andrews 2012

float gamestate;
float dx, dy, dwd, dht, dxspeed, dyspeed;
float px, py, pwd, pht, pxspeed, pyspeed;
PImage p;
int count, hits;

float px1, px2, px2speed, px2gravity;



void setup(){
  //setup stuff
  size(600,600);
  background(84, 2, 2);
  smooth();
  loadFont("Helvetica-Bold-14.vlw");
  count = 0;
  hits = 0;
  gamestate = 0;

  
  //controls wrap initials
  dx = width/2;
  dy = height/2;
  dwd = 75;
  dht = 75;
  dxspeed = 0;
  dyspeed = 0;
  
  //controls image bounce
  p = loadImage("beyonce.png");
  imageMode(CENTER);
  px = random(.5*pwd,width-.5*pwd);
  py = random(.5*pht, height - .5*pht);
  pwd = 75;
  pht = 75;
  pxspeed = random(3, 7);
  pyspeed = random(3, 7);
  
  px1 = width/2;
  px2 = height-200;
  px2speed = 1;
  px2gravity = 0.1;
}

//table of contents
void draw(){
  if(gamestate == 0){
    displayInstructions();
  }
  else if(gamestate == 1){
    windowPrep();
    drawInitials(dx, dy, dwd, dht);
    drawImage();
    wrapInitials();
    bounceInitials();
    collision();
    countHits();
    displayTime();
  }
}

void countHits(){
  textAlign(LEFT);
  textSize(.03*width);
  String shits = nf(hits, 1);
  text("Number of hits:" + "  " + hits, width*.07, height*.90);
  }


void collision(){
  println( dist(px, py, dx, dy));
  if (dist(px, py, dx, dy) <= pwd){
    background(255);
    dx = width/2;
    dy = height/2;
    dxspeed = 0;
    dyspeed = 0;
    pxspeed = random(3, 7);
    pyspeed = random(3, 7);
    px = random(.5*pwd, width - .5*pwd);
    py = random(.5*pht, height - .5*pht);
    hits++;
  }
}

//displays the time
void displayTime(){
  millis();
  String scount = nf(count, 1);
  text("Time:" + "  " + count++/100, width*.07, height*.95);
}

//makes the faded trail
void windowPrep(){
  fill(84, 2, 2,50);
  rect(0, 0, width, height);
}

//shows instructions in the beginning
void displayInstructions(){
    if(gamestate == 0){
    background (84, 2, 2);
    textLeading(.05*width);
    textAlign(CENTER, CENTER);
    text("Try to catch Beyonce.\nClick and drag the mouse in order to move the target.\nPress space bar to begin.", width/2, height/2);
    }
    image(p, px1, px2, pwd, pht);
    px2 = px2 + px2speed;
    px2speed = px2speed + px2gravity;
    
    if(px2 > height*.85 || px2 < height*.65){
      px2speed *= -1;
    }
    
  if(key == ' ' ){
    gamestate = 1;
  }
}


//makes initials wrap
void wrapInitials(){
  dx = dx + dxspeed/5;
  dy = dy + dyspeed/5;
 
  if (dx > width + .5*dwd){
    dx = -.5*dwd;
  }
  if (dx < -.5*dwd){
    dx = width + .5*dwd;
  } 
  if (dy > height + .5*dht){
    dy = -.5*dht;
  }
  if (dy < -.5*dht){
    dy = height + .5*dht;
  }
}



void mouseDragged(){
  if (gamestate ==1 && pmouseX > mouseX){
    dxspeed--;
    fill(#EDE0A6, 90);
    triangle(465, 525, 485, 545, 485, 505);
  }
  if (gamestate ==1 && pmouseX < mouseX){
    dxspeed++;
    fill(#EDE0A6, 90);
    triangle(555, 525, 535, 545, 535, 505);
  }
  if (gamestate ==1 && pmouseY > mouseY) {
    dyspeed--;
    fill(#EDE0A6, 90);
    triangle(510, 480, 490, 500, 530, 500);
  }
  if (gamestate ==1 && pmouseY < mouseY) {
    dyspeed++;
    fill(#EDE0A6, 90);
    triangle(510, 570, 490, 550, 530, 550);
  }
  
}



//makes image bounce
void bounceInitials(){
  px = px + pxspeed;
  py = py + pyspeed;
  
  if (px > width - .5*pwd){
    pxspeed *= -1;
  }
  if (px < .5*pwd){
    pxspeed *= -1;
  }
  if (py > height - .5*pht) {
    pyspeed *= -1;
  }
  if (py < .5*pht){
    pyspeed *= -1;
  }
}



//draws the initials
void drawInitials(float x, float y, float wd, float ht){
  //background(84, 2, 2);
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

//draws image
void drawImage(){
  smooth();
  noStroke();
  image(p, px, py, pwd, pht);
}

