
PImage Dashboard;
PImage dashFront;
PImage coffee;
PFont LGothic20;
PFont LGothic12;

float circleX, circleY, circle2X, circle2Y;
float amp;
float coffeeY = 432;

int red = 117;
int green = 0;
int blue = 0;

void setup() {
 size(960, 560);
 smooth();
 Dashboard = loadImage("Serenity_dashboard.png");
 dashFront = loadImage("dash_front.png");
 coffee = loadImage("coffee.png");
 LGothic20 = loadFont("LeagueGothic-Regular-20.vlw");
 LGothic12 = loadFont("LeagueGothic-Regular-12.vlw");
 amp = 10;
}

void draw() {
  
  drawSpace();
  drawDash();
  starsMove();
  engineFlux();
  airMonitor();
}

void drawSpace() {
  fill(255);
  noStroke();
  ellipse(600, 200, 15, 15);
  ellipse(120, 320, 20, 20);
  ellipse(650, 100, 10, 10);
  ellipse(720, 20, 15, 15);
  ellipse(width/2, 15+height/2, 8, 8);
  ellipse(80, 410, 12, 12);
  ellipse(850, 5, 8, 8);
  ellipse(550, 27, 8, 8);
  ellipse(25, 90, 15, 15);
}

void drawDash() {
  image(Dashboard, 0, 0, width, height);
  fill(255);
  stroke(0);
  quad(162, 66, 239, 76, 296, 236, 335, 234);
  textFont(LGothic12);
  text("SPACE   VIEW", 610, (height/2)+12);
  redLight();
  toggle();
  coffee();
  redButton();
}

void starsMove() {
  background(25, 16, 60);
  drawSpace();
  float x = 20; 
  for(int i = 0; i<=100; i++) {
   x = x ++;
   fill(255);
   noStroke();
   ellipse(20 + (i*20), random(x+370), random(4), random(4)); 
  }
}

void engineFlux() {
  drawSpace();
  drawDash();
  pushMatrix();
  translate(890, (height/2)-25);
  scale(15, 15); //increases the scale of the output to be more visible
  
  //changing the variables from fixed numbers to a funtion with sin and time makes it move
  float a = 0 + sin(millis()*0.001);
  float b = -2.3;
  float c = 2.4;
  float d = -2.1;
  
  int numPoints = 10000;
  float x0, y0, x1, y1;
  x0 = y0 = x1 = y1 = 0;
  
  
  for(int i=0; i<numPoints; i++){
//  red = map(noise(i, i), 0, 1, 0, 255);
//  blue = map(noise(i+30, 1+30), 0, 1, 0, 255);
//  green = map(noise(i+60, i+60), 0, 1, 0, 255);
//  alpha = map(noise(i, i), 0, 1, 0, 255);
    
  x1 = sin(a*y0)-cos(b*x0);
  y1 = sin(c*x0)-cos(d*y0);
  stroke(0);
  strokeWeight(0.06);
  point(x1, y1);
  x0=x1;
  y0=y1;
}
popMatrix();
}

void airMonitor() {
    float time = millis()*0.005;
    float sine = amp*sin(time);
     circleX = 605+(time*5);
     circleY = sine + (height/2)+15;
     
     for(int i = 0; i<=100; i++) {
     
     if (circleX >= 605 && circleX <=695) {
       fill(153);
       rect(607, height/2, 90, 30);
       textFont(LGothic12);
       fill(0);
       text("AIR MONITOR ON", 610, (height/2)+12);
       stroke(0);
       strokeWeight(2);
       point(circleX, circleY);
     }
  }
}

void toggle() {
  fill(128);
  stroke(0);
  ellipse(512, 420, 4, 10);
  
  if (dist(512, 420, mouseX, mouseY) <= 10 && mousePressed) {
    mouseClicked();
}
   fill(red, green, blue);
   stroke(0);
   ellipse(662, 266, 10, 10);
}

void redLight() {
  if (dist(662, 266, mouseX, mouseY) <= 10 && mousePressed) {
    mouseClicked();
  }
  fill(red, green, blue);
  stroke(0);
  strokeWeight(1);
  ellipse(662, 265, 10, 10);
}

void coffee() {
//  float coffeeY = 432;
  if(dist(375, 420, mouseX, mouseY) <= 15 && keyPressed) {
    keyPressed();
  }
  image(coffee, 375, coffeeY, coffee.width, coffee.height);
  image(dashFront, 246, 384, 323, 152);
}

void redButton() {
  fill(117, 0, 0);
  stroke(0);
  ellipse(916, 324, 13, 6);
  if (dist(916, 324, mouseX, mouseY) <= 10 && mousePressed) {
    mouseClicked();
  }
}
  
  
  void mouseClicked() {
    if (dist(512, 420, mouseX, mouseY) <= 10 && mousePressed) {
    red = 0;
    green = 199;
    blue = 53;
    }
    if (dist(916, 324, mouseX, mouseY) <= 10 && mousePressed) {
      float lightR = random(255);
      float lightG = random(255);
      float lightB = random(255);
      fill(lightR, lightG, lightB);
      quad(162, 66, 239, 76, 296, 236, 335, 234);
  }
  }
  
 void keyPressed() {
//  float coffeeY = 432;
  if (key == CODED) {
    if (keyCode == UP) {
      coffeeY = coffeeY + (365-coffeeY)*.05;
    } else if (keyCode == DOWN) {
      coffeeY = coffeeY + (432-coffeeY)*.05;
    } else {
      coffeeY = 432;
    }
  }

}


