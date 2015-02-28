
int xloc;
int yloc;
PFont myFont;
PFont buttonFont;

void setup(){
  size(500, 500);
  xloc =25;
  yloc =25;
  frameRate(8);
  
}

void draw(){
  
  
  smooth();
  background(0);
  myFont = loadFont("Bebas-22.vlw");
  textFont(myFont);
  fill(255);
  text("Use  arrow  keys  to  uncover  the  hidden  button!", 30, height-30);
  stroke(255, 0, 255);
  noFill();
  ellipse(xloc, yloc, 50, 50); 
  fill(255, 0, 255);
  if(xloc == 375 && yloc == 175){
    noStroke();
    ellipse(375, 175, 50, 50);
   
   float r =50;
   float distance = dist(350, 150, mouseX, mouseY);
   fill(255);
   buttonFont = loadFont("JoyLikeSunshineThroughMyWindowpane-18.vlw");
   textFont(buttonFont);
   text("Click", 360, 175);
   text("Me!", 365, 190);
   if(mousePressed == true && distance <= r){
     
     float i;
     float j;
     float a;
     background(random(255), random(255), random(255));
     fill(random(255),random(255), random(255));
     rectMode(CENTER);
     i=random(10);
     j = random(10);
     a = random(10);
     fill(255);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), a, a);
     ellipse(random(500), random(500), j, j);
     ellipse(random(500), random(500), i, i);
     ellipse(random(500), random(500), i, i);
    
  }
}
}

void keyPressed () {
  if(key ==CODED) {
    if(keyCode == RIGHT) {
      xloc += 50;
    }
    if(keyCode == LEFT) {
      xloc -= 50;
    }
    if(keyCode == DOWN) {
      yloc += 50;
    }
    if(keyCode == UP) {
      yloc -= 50;
    }
  }
  if(xloc<=25) {
    xloc=25;
  }
  if(xloc>=width-25) {
    xloc=width-25;
  }
  if(yloc<=25) {
    yloc=25;
  }
  if(yloc>=height-25) {
    yloc=height-25;
  }
  println("X =" + xloc +"Y=" + yloc);
}

