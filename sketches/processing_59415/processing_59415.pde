
int box = 0;
PImage bolt;
PImage bg;
PImage butterfly;
PImage cloud;
PImage clouds;
PImage drop;
PImage flower;
PImage flower1;
PImage leaf;
PImage moon;
PImage sun;
PImage sun1;
PImage suncloud;
PImage tree;
PFont font;

float ranA, ranB, ranC, ranD;
float ranE, ranF, ranG, ranH;
float o = 0;
float w = 600;
float h = 600;
float angle = 0;
float angleSpeed = 5.0;
float lineLength = 0;


void setup() {
  size(600, 600);
  strokeWeight(10);
  bolt = loadImage ("bolt.jpg");
  bg = loadImage ("shapes.jpg");
  butterfly = loadImage ("butterfly.jpg");
  cloud = loadImage ("cloud.jpg");
  clouds = loadImage ("clouds.jpg");
  drop = loadImage ("drop.jpg");
  flower = loadImage ("flower.jpg");
  flower1 = loadImage ("flower1.jpg");
  leaf = loadImage ("leaf.jpg");
  moon = loadImage ("moon.jpg");
  sun = loadImage ("sun.jpg");
  sun1 = loadImage ("sun1.jpg");
  suncloud = loadImage ("suncloud.jpg");
  tree = loadImage ("tree.jpg");
  font = loadFont("BanglaMN-48.vlw"); 
  image(bg, o, o, w, h);
}

void draw() {
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);

  stroke(random(255), random(255), random(255));
  strokeWeight(random(10));
  fill(random(255), random(255), random(255));

  if (key == 'w' && keyPressed == true) {

    delay(-10);
    strokeWeight(random(5)); 
    noFill();
    stroke(random(255));
    rotate(radians(angle));
    line(random(600), random(600), random(600), random(600));

    angle += angleSpeed;
  }

  if (key == 'q' && keyPressed == true) {
    textFont (font, 28);
    fill(255);
    text("how much control do you really", 10, 100);
     text("have over technology?", 10, 150);
    text("are you telling the technology what to do", 10, 300);
    text ("or is it letting you complete certain tasks", 10, 450);
    text ("under its control and constraints", 10, 500);
  }
}

  /*void keyPressed() {
   if (key == 'l' || key == 'L') {
   
   delay(-10);
   pushMatrix();
   strokeWeight(5); 
   noFill();
   stroke(random(255), random(255), random(255));
   translate(mouseX, mouseY);
   rotate(radians(angle));
   line(random(600), random(600), random(50), random(50));
   popMatrix();
   
   angle += angleSpeed;
   }
   }*/

  void mousePressed()
  {
    delay(-10);
    image(bolt, random(600), random(600), 30, 30);
    image(butterfly, random(600), random(600), 30, 30);
    image(cloud, random(600), random(600), 30, 30);
    image(clouds, random(600), random(600), 30, 30);
    image(drop, random(600), random(600), 30, 30);
    image(flower, random(600), random(600), 30, 30);
    image(flower1, random(600), random(600), 30, 30);
    image(leaf, random(600), random(600), 30, 30);
    image(moon, random(600), random(600), 30, 30);
    image(sun, random(600), random(600), 30, 30);
    image(sun1, random(600), random(600), 30, 30);
    image(suncloud, random(600), random(600), 30, 30);
    image(tree, random(600), random(600), 30, 30);
  }

  void mouseReleased()
  {
    delay(int(random(50, 100)));
    box = int(random(0, 7));

    ranA=random(0, 600);
    ranB=random(0, 600);
    ranC=random(0, 600);
    ranD=random(0, 600);

    ranE=random(0, 600);
    ranF=random(0, 600);
    ranG=random(0, 600);
    ranH=random(0, 600);

    if (box==0) {
      quad(ranA, ranB, ranC, ranD, ranE, ranF, ranG, ranH);
    }
    if (box==1) {
      line(ranA, ranB, ranC, ranD);
    }
    if (box==2) {
      quad(ranA, ranB, ranC, ranD, ranE, ranF, ranG, ranH);
    }
    if (box==4) {
      quad(ranA, ranB, ranC, ranD, ranE, ranF, ranG, ranH);
    }
    if (box==5) {
      line(ranA, ranB, ranC, ranD);
    }
    if (box==6) {
      quad(ranA, ranB, ranC, ranD, ranE, ranF, ranG, ranH);
    }
    if (box==7) {
      quad(ranA, ranB, ranC, ranD, ranE, ranF, ranG, ranH);
    }
  }


  void variableEllipse(int x, int y, int px, int py) 
  {
    float speed = abs(x-px) + abs(y-py);
    stroke(random(255), random(255), random(255));
    strokeWeight(random(5));
    ellipse(x, y, speed, speed);
  }


