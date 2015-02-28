
Fish fish;
//Cupcake mycup;
PShape bubble;
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
myCupcake1 = new Cupcake();
//myCupcake2 = new Cupcake(); 
//myCupcake3 = new Cupcake();
//myCupcake4 = new Cupcake();
bubble = loadShape("bubble1-01.svg");
cupcake1 = loadShape("cupcake2-01.svg");
fish1 = loadShape("fish1-01.svg");
myFont = createFont("Bim", 32);
start1 = createFont("Bim", 50);
myFont2 = createFont("UQ", 20);
C = C * 0.9;
 for (int x = 0; x < amt ; x++)  {
   myCupcakes[x] = new Cupcake() ;
   
 }
 
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
//float xPos = Cupcake(xPos);
//float yPos = Cupcake(yPos);
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


void draw() {;

frameRate(time);
//C = C * 0.9;
background(45, 205, 225);
//line(0, height * 0.5, width, height * 0.5);
strokeWeight(4);
fill(124, 191, 49);
fill(151, 105, 63);
noFill();
noStroke();
curve(ex1, ey1, ex1, ey1, ex2, ey2, ex2, ey2);
//bezier(rx1, ry1, rx1 + 200, ry1, rx2 - 200, ry2, rx2, ry2);
fill(255);
int steps = 20;
for (int i = 0; i <= steps; i++) {
  float t = T + i / float(steps);
  float xL = curvePoint(ex1, ex1, ex2, ex2, t);
  float yL = curvePoint(ey1, ey1, ey2, ey2, t);
  //float x = bezierPoint(rx1, rx1 + 200, rx2 - 200, rx2, t);
  //float y = bezierPoint(ry1, ry1, ry2, ry2, t);
  strokeWeight(2);
  stroke(0);
  point(xL, yL);
  //point(x, y);
}


//stroke(45, 70, 80);
//strokeWeight(6);
//noFill();
//rect(width * 0.5, height * 0.755, 226, 46);
fill(255);
noStroke();
textFont(myFont);
textAlign(CENTER, CENTER);

text(score, width - 80, 40);
//stroke(255);
//strokeWeight(10);
fill(254, 243, 0);
text(miss, 80, 40);


//if(miss == 0) {
//  miss = 0;
//start00 = true;
//restart = true;
//}
//if (start00 == true) {
//textFont(start1);
//fill(19, 64, 90);
//text("start", width * 0.5, height * 0.75);
//}

//if ((mouseX > ((width * 0.5) - 110)) && (mouseX < ((width * 0.5) + 110)) && (mouseY > ((height * 0.75)-40 ) && (mouseY < ((height * 0.75) + 40)) && mousePressed)) {
//start00 = false;
//miss = 10;
//mycup.yPos = height + 50;
//}
//if(miss == 0) {
//start00 = true;
//}

  fish.rects();
  fish.update();
  fish.Xlimits();
  fish.display();
  myCupcake1.display();
  myCupcake1.drive();
  //myCupcake1.collision();  
//  myCupcake2.display();
//  myCupcake2.drive();
//  //myCupcake2.collision();
//  myCupcake3.display();
//  myCupcake3.drive();
  //myCupcake3.collision();
//  myCupcake4.display();
//  myCupcake4.drive();
  //myCupcake4.collision();
  
   for (int x = 0; x < amt ; x++)  {  
   myCupcakes[x].display() ;
   myCupcakes[x].drive() ;
 }
// if (dist(ex, ey, xPos, yPos) < rad) {
//   yPos = height;
// }
 if (start00 == true) {
textFont(start1);
fill(19, 64, 90);
text("start", width * 0.5, height * 0.75);
textFont(myFont2);
fill(254, 243, 0);
text("misses allowed", 180, 40);
fill(255);
text("score", 475, 40);
text("r = UP", 70, 230);
text("f = DOWN", 70, 370);
text("i = UP", width - 70, 230);
text("j = DOWN", width - 70, 370);
text("SPACEBAR = swim", width * 0.5, 230);
restart = false;
 }
 if (restart == true) {
textFont(start1);
fill(19, 64, 90);
text("try again", width * 0.5, height * 0.75);
text("game over", width * 0.5, height * 0.5);
}
 
shape(bubble, rx1, ry1, 90, 90);
shape(bubble, rx2, ry2, 90, 90);

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
 

 
void mouseReleased() {
  if ((mouseX > ((width * 0.5) - 110)) && (mouseX < ((width * 0.5) + 110)) && (mouseY > ((height * 0.75)-40 ) && (mouseY < ((height * 0.75) + 40)))) {
  start00 = false;

if ((mouseX > ((width * 0.5) - 200)) && (mouseX < ((width * 0.5) + 200)) && (mouseY > ((height * 0.75)-40 ) && (mouseY < ((height * 0.75) + 40)))) {
  restart = false;
}
  }
}

class Cupcake {
  //attributes
  float X;
  float xPos ;
  float yPos ;
  float vel ; 
  float r ; 
  float g ; 
  float b ;
 float twitch; 

  //constructor (fill attributes here
  Cupcake(float x, float y) {
    X = 60;
    xPos = x;
    yPos = y;
    vel = random(2.5, 4.5);
    r = random(255);
    g = random(255);
    b = random(255);
    twitch = random(2.5, 4.5);
  }

  Cupcake() {
    xPos = random(90, width - 90) ;
    yPos = (height + 50);
    vel = random(2.5, 4.5) ;
    r = random(255) ;
    g = random(255) ;
    b = random(255) ;
    twitch = random(-3,3);
  }


  //methods

  void display() {
    fill(r, g, b) ;
    shapeMode(CENTER);
    shape(cupcake1, xPos, yPos, 50, 50) ; 
    //ellipse(xPos + 5, yPos + 15, 10, 10) ;
    //ellipse(xPos + 45, yPos + 15, 10, 10) ;
  }




  void drive() {
    //start00 = true;
    if ((mouseX > ((width * 0.5) - 110)) && (mouseX < ((width * 0.5) + 110)) && (mouseY > ((height * 0.75)-40 ) && (mouseY < ((height * 0.75) + 40)) && mousePressed)) {
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
//yPos = height + 50;
time = 60;
vel = random(2.5, 4.5);
fish.topspeed = 15;
if ((mouseX > ((width * 0.5) - 200)) && (mouseX < ((width * 0.5) + 200)) && (mouseY > ((height * 0.75)-40 ) && (mouseY < ((height * 0.75) + 40)))) {
  restart = false;
}
} 
    
    if (start00 == false && miss > 0) { 
      
    yPos = yPos - vel;
    
   //xPos = xPos + random(twitch);
    if (dist(fish.location.x, fish.location.y, xPos, yPos) < 30 + 25) {
   yPos = height;
   xPos = random(90, width - 90);
   score += 10;
   fish.topspeed = fish.topspeed + 0.4;
   vel = vel + 0.5;
 }
 //if (xPos == 50 || xPos == width - 50) {
   //xPos = 50 + 
    if (yPos < 0) {
      miss = miss - 1;
      yPos = height + 50;
      xPos = xPos + 70;
      if (xPos > width - 90) { 
        xPos = random(90, width - 90);
//    }
//      else if (xPos > width - 60 && yPos < 0) {
//        xPos = xPos - 70;
//      }
//      else if (xPos < 60 && yPos < 0) {
//        xPos = xPos + 60;
      }
    
 
    if (miss <= 0) {
       miss = 0;
       //score = 0;
      // start00 = true;
       restart = true;
      //gameover = true;
    }
    if (miss == 20) {
      yPos = height + 50;
    }
 }
 }
  }
  }    
//void collision() {
//  if (dist(fish.location.x, fish.location.y, xPos, yPos) < 15) {
//   yPos = height;
//   xPos = random(50, width - 50);
// }
//}

  




Cupcake myCupcake1;
Cupcake mycup;
//Cupcake myCupcake3;
//Cupcake myCupcake4;
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
    topspeed = 15;
    xoff = 1000;
    yoff = 0;
  }

  void update() {
    
//    if(location.x == width - 34) {
//      radX = radX;
//    } 
//    if (location.x == 34) {
//      radX = -radX;
//    }
    //IF FUNCTIONS TO SWITCH THE DIRECTION OF THE BALL FROM LEFT TO RIGHT OR RIGHT TO LEFT
//     if(location.x <= 24 && key == ' ') {
//       attR = true;
//     } else {
//      attR = false;
//      attL = false;
//     //} else if(location.x == width - 24 && key == ' ') {
//       //attR = false;
//       //attL = true;
//      
//     } 
//     if (location.x >= width - 24 && key == ' ') {
//       //if(key == ' ') {
//      attL = true;
//       } else {
//      attR = false; 
//      attL = false;
//     }
     
   
   
   //IF FUNCTION THAT TELLS THE BALL TO MOVE FROM THE RIGHT SIDE OF THE SCREEN TO LEFT WHENEVER X >= WIDTH - 24
    if (attL == true) {
      PVector RR2 = new PVector(ex1, ey1);
    PVector dir = PVector.sub(RR2, location);
    dir.normalize();
    dir.mult(200);
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
      //radX = radX;
   //IF FUNCTION THAT TELLS THE BALL TO MOVE FROM THE LEFT SIDE OF THE SCREEN TO RIGHT WHENEVER X <= 24
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

  //VOID THAT DISPLAYS THE ELLIPSE
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
    //curve(rx1, ry1, rx1, ry1, rx2, ry2, rx2, ry2);
    popMatrix();
  }

  //VOID THAT STOPS THE BALL ON THE LEFT OR RIGHT RECTANGLE
  void Xlimits() {
    if (location.x >= width - 45) {
      location.x = width - 45;
      location.y = ey2;
      attL = false;
      //radX = -radX;
    } else if (location.x <= 45) {
      location.x = 45;
      location.y = ey1;
      attR = false;
      //radX = radX;
    }
    if (location.y > height) {
      location.y = height - rad;
    } else if (location.y < 0) {
      location.y = rad;
    }
  } 
  
  void attach() {
     // if (key == ' ') {
     if(location.x <= 45 && key == ' ') {
       attR = true;
       //radX = radX;
     //}else if(location.x == width - 24) {
       //attR = false;
       
     } else if (location.x >= width - 45) {
       if(key == ' ') {
      attL = true;
      attR = false;
     // radX = -radX;
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

  
