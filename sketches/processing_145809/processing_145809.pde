
/* @pjs font="Bim.ttf"; */
/* @pjs font="AppleM.ttf"; */
/* @pjs font="Futura.ttc"; */
/* @pjs preload="hungry fish_logo-03.png"; */
/* @pjs preload="bubble5.png"; */


Fish fish; 

PShape logo;
PImage ocean;
PImage bubble;
PShape cupcake1;
PShape fish1;
PFont myFont;
PFont myFont2;
PFont start1;
boolean start00 = true;
boolean restart = true;
float C = 150;

void setup() {
size(600, 600);
fish = new Fish();
logo = loadShape("logo1-03.svg");
myCupcake1 = new Cupcake();
myFont  = loadFont("Bim.ttf");
bubble = loadImage("bubble5.png");
cupcake1 = loadShape("cupcake4.svg");
fish1 = loadShape("fish1-01.svg");
ocean = loadImage("ocean1.jpg");
start1 = loadFont("Bim.ttf");
myFont2 = loadFont("AppleM.ttf");
 for (int x = 0; x < amt ; x++)  {
   myCupcakes[x] = new Cupcake() ; 
 }
 count = 0;
}

int score = 0;
int miss = 20;
int life = 3;
int time = 60;
PShape cupcake;
int rx1 = 45;
int ry1 = 300;
int rx2 = 555;
int ry2 = 300;
float ex1 = 45;
float ey1 = 300;
float ex2 = rx2;
float ey2 = ry2;
float T;
int ex = 45;
int ey = 300;
boolean rect1 = false;
boolean rect2 = false;
boolean attL = false;
boolean attR1 = true;
boolean attL1 = true;
boolean attR = false;
boolean stopR = false;
boolean stopL = false;
int rad = 60;
int radX = 60;
int oceantime = 0;
int count;

void draw() {
//background(45, 205, 225);
background(0);
imageMode(CORNER);
smooth();
if(start00 == true) count = 0;
image(ocean, 0, (-time) - (count), 600, 12000);
count +=2;
if (restart == false && miss == 0) {
  count = 0;
}
strokeWeight(4);
fill(124, 191, 49);
fill(151, 105, 63);
noFill();
noStroke();
curve(ex1, ey1, ex1, ey1, ex2, ey2, ex2, ey2);
fill(255);
int steps = 20;
for (int i = 0; i <= steps; i++) {
  float t = T + i / float(steps);
  float xL = curvePoint(ex1, ex1, ex2, ex2, t);
  float yL = curvePoint(ey1, ey1, ey2, ey2, t);
  strokeWeight(2);
  stroke(0);
  point(xL, yL);
}
fill(255);
noStroke();
textFont(myFont, 32);
textAlign(CENTER, CENTER);
text(score, width - 80, 40);
fill(254, 243, 0);
text(miss, 80, 40);
  fish.rects();
  fish.update();
  fish.Xlimits();
  fish.display();
  myCupcake1.display();
  myCupcake1.drive();
  
   for (int x = 0; x < amt ; x++)  {  
   myCupcakes[x].display() ;
   myCupcakes[x].drive() ;
 }
 if (start00 == true) {
textFont(start1, 50);
fill(19, 64, 90);
text("start", width * 0.5, height * 0.75);
imageMode(CENTER);
shape(logo, width * 0.5, height * 0.25, 500, 50);
textFont(myFont2, 20);
fill(254, 243, 0);
text("misses allowed", 180, 40);
fill(255);
text("score", 475, 40);
text("r = UP", 50, 230);
text("f = DOWN", 70, 370);
text("i = UP", width - 50, 230);
text("j = DOWN", width - 70, 370);
text("SPACEBAR = swim", width * 0.5, 230);
restart = false;
 }
 if (restart == true) {
textFont(start1, 50);
fill(19, 64, 90);
text("try again", width * 0.5, height * 0.75);
text("game over", width * 0.5, height * 0.5);
}
imageMode(CENTER);
smooth();
image(bubble, rx1, ry1, 90, 90);
image(bubble, rx2, ry2, 90, 90);
}

void keyPressed() {
  if ((keyCode == 'r' || keyCode == 'R') || (keyCode == 'f' || keyCode == 'F') || (keyCode == 'i' || keyCode == 'I') || (keyCode == 'j' || keyCode == 'J')) {
    rect1 = true;
    rect2 = true;
  }
  if ( keyCode == ' ' ){
    if(fish.location.x == 45) {
       attR = true;
       attL = false;
       rect1 = true;
       rect2 = true;
     }  
     if (fish.location.x == width - 45) {
       //if(key == ' ') {
        attL = true;
        attR = false;
        rect1 = true;
       rect2 = true;
       } 
  }
}

void keyReleased() {
  if(key != ' ') {
    stopR = true;
  } else if (key != ' ') {
    stopL = true;
  }
}
 
void mousePressed() {
if ((mouseX > ((width * 0.5) - 200)) && (mouseX < ((width * 0.5) + 200)) && (mouseY > ((height * 0.75)-40 ) && (mouseY < ((height * 0.75) + 40)))) {
  restart = false;
  start00 = false;
  }
}

void mouseReleased() {
  if ((mouseX > ((width * 0.5) - 200)) && (mouseX < ((width * 0.5) + 200)) && (mouseY > ((height * 0.75)-40 ) && (mouseY < ((height * 0.75) + 40)))) {
  start00 = false;
  restart = false;
  }
}




class Cupcake {
  float X;
  float xPos ;
  float yPos ;
  float xPos2;
  float yPos2;
  float xPos3;
  float yPos3;
  float vel;
  float vel2;
  float vel3; 
  float r ; 
  float g ; 
  float b ;
  float twitch; 
  float twitch2;

  Cupcake(float x, float y) {
    X = 60;
    xPos = x;
    xPos2 = x;
    yPos = y;
    yPos2 = y;
    xPos3 = x;
    yPos3 = y;
    vel = random(2.5, 4.5);
    vel2 = random(1, 3);
    vel3 = random(2, 4);
    r = random(255);
    g = random(255);
    b = random(255);
    twitch = random(20, 40);
    twitch2 = random(10, 30);
  }

  Cupcake() {
    xPos = random(90, width - 90) ;
    yPos = (height + 100);
    xPos2 = random(90, width - 90) ;
    yPos2 = (height + 100);
    vel = random(0.5, 2.5);
    vel2 = random(1, 3);
    vel3 = random(2, 4);
    r = random(255) ;
    g = random(255) ;
    b = random(255) ;
    twitch = random(20,40);
    twitch2 = random(10, 30);
  }

  void display() {
    fill(r, g, b) ;
    shapeMode(CENTER);
    shape(cupcake1, xPos, yPos, 60, 60);
    image(bubble, xPos2, yPos2, twitch, twitch);
    image(bubble, xPos3, yPos3, twitch2, twitch2); 
  }

  void drive() {
    yPos2 = yPos2 - vel2;
    yPos3 = yPos3 - vel3;
    if (yPos2 < 0) {
      yPos2 = height + 50;
      xPos2 = xPos2 + 30;
      if (xPos2 > width - 90) { 
        xPos2 = random(90, width - 90);
      }
    }
    if (yPos3 < 0) {
      yPos3 = height + 70;
      xPos3 = xPos3 + 90;
      if (xPos3 > width - 90) { 
        xPos3 = random(90, width - 90);
      }
    }
    if (start00 == false && (mouseX > ((width * 0.5) - 110)) && (mouseX < ((width * 0.5) + 110)) && (mouseY > ((height * 0.75)-40 ) && (mouseY < ((height * 0.75) + 40)) && mousePressed)) {
yPos = height + 50;
rx1 = 45;
ry1 = 300;
rx2 = 555;
ry2 = 300;
ex1 = 45;
ey1 = 300;
ex2 = rx2;
ey2 = ry2;
ex = 45;
ey = 300;
miss = 20;
score = 0;
time = 60;
vel = random(0.5, 2.5);
fish.topspeed = 8;
restart = false;  
start00 = false;
}
    if (start00 == false && restart == false && miss > 0) { 
    yPos = yPos - vel;
    
    if (dist(fish.location.x, fish.location.y, xPos, yPos) < 30 + 25) {
   yPos = height;
   xPos = random(90, width - 90);
   score += 10;
   fish.topspeed = fish.topspeed + 0.3;
   vel = vel + 0.5;
 }
    if (yPos < 0) {
      miss = miss - 1;
      yPos = height + 50;
      xPos = xPos + 70;
      if (xPos > width - 90) { 
        xPos = random(90, width - 90);
      }
    if (miss <= 0) {
       miss = 0;
       restart = true;
    }
    if (miss == 20) {
      yPos = height + 50;
        }
      }
    }
  }
}    

Cupcake myCupcake1;
Cupcake mycup;

int amt = 2 ;

Cupcake[] myCupcakes = new Cupcake[amt] ;
class Fish {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float xoff, yoff;
  float r = 16;

  Fish() {
    location = new PVector(ex, ey);
    velocity = new PVector(0, 0);
    topspeed = 18;
    xoff = 1000;
    yoff = 0;
  }

  void update() {
    if (attL == true) {
      PVector RR2 = new PVector(ex1, ey1);
    PVector dir = PVector.sub(RR2, location);
    dir.normalize();
    dir.mult(200);
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    } else if (attR == true) {
      radX = -radX;
      PVector RR1 = new PVector(ex2, ey2);
    PVector dir = PVector.sub(RR1, location);
    dir.normalize();
    dir.mult(200);
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    radX = -radX;
    }
  } 

  //VOID THAT DISPLAYS THE FISH
  void display() {
    float theta = velocity.heading2D();
    stroke(0);
    strokeWeight(2);
    noFill();
    pushMatrix();
    rectMode(CENTER);
    translate(location.x, location.y);
    //rotate(theta);
    shapeMode(CENTER);
    if(attL == false && attR == false) shape(fish1, 0, 0, -radX, rad);
    if(attL == true) shape(fish1, 0, 0, radX, rad);
    if(attR == true) shape(fish1, 0, 0, -radX, rad);
    popMatrix();
  }

  //VOID THAT STOPS THE FISH ON THE LEFT OR RIGHT RECTANGLE
  void Xlimits() {
    if (location.x >= width - 45) {
      location.x = width - 45;
      location.y = ey2;
      attL = false;
    } else if (location.x <= 45) {
      location.x = 45;
      location.y = ey1;
      attR = false;
    }
    if (location.y > height) {
      location.y = height - rad;
    } else if (location.y < 0) {
      location.y = rad;
    }
  } 
  
  void attach() {
     if(location.x <= 45 && key == ' ') {
       attR = true;
     } else if (location.x >= width - 45) {
       if(key == ' ') {
      attL = true;
      attR = false;
      if(location.x == 45) {
        attR = false;
        attL = false;
      }
       } 
     }
     if(location.x == width - 45) {
       attR = false;
      } 
  }
  
  void rects() {
    if(rect1 == true || rect2 == true) {
if (keyPressed) {     
  if (key == 'r' || key == 'R') { 
  ry1 -= 10;
  ey1 -= 10;
  ey -= 10;
  if((ry1 <= 15) || (ey1 <= 0)) {
  ry1 = 15;
  ey1 = 15;
  ey = 15;
}
} else if (key == 'f' || key == 'F') { 
ry1 += 10;
ey1 += 10;
ey += 10;
if((ry1 >= (height - 15)) || (ey1 >= (height))) {
  ry1 = height - 15; 
  ey1 = height - 15;
  ey = height - 15;
}
}
  if (key == 'i' || key == 'I') { 
  ry2 -= 10;
  ey2 -= 10;
  if(ry2 <= 15) {
  ry2 = 15;
  ey2 = 15;  
}
} else if (key == 'j' || key == 'J') {
ry2 += 10;
ey2 += 10;
if(ry2 >= (height - 30)) {
  ry2 = height - 15;
  ey2 = height - 15;
}
}
else if ((key == 'r' || key == 'R') && (key == 'i' || key == 'I')) {
  ry1 -= 10;
  ey1 -= 10;
  ey -= 10;
  ry2 -= 10;
  ey2 -= 10;
  if((ry1 <= 15) || (ey1 <= 0)) {
  ry1 = 15;
  ey1 = 15;
  ey = 15;
  } else if(ry2 <= 15) {
  ry2 = 15;
  ey2 = 15;
  }
}
}
}
}
}

  


