
/**
WolfPong 1.0
Zaprowadź wszystkie owce do farmy. Uważaj na ataki wilka.
by Andrzej Słupski, 2014
**/
int o=9; //ILOŚĆ OWIEC

//zaladuj obrazy i fonty
PImage sheep;
PImage shepherd;
PImage wolfimg;
PFont font;

//stworz wilka i pozycje owiec
wolf wolf;
float owceX[]= new float[o];
float owceY[]= new float[o];
//---
void setup()
{
  sheep=loadImage("sheep.png");
  shepherd=loadImage("shepherd.png");
  wolfimg=loadImage("wolf.png");
  font = loadFont("MyriadPro-Regular-32.vlw");
  textFont(font, 32);
  textAlign(CENTER);
  imageMode(CENTER);
  ellipseMode(CENTER);
  size(500, 500);
  smooth();
  strokeWeight(3);
  frameRate(10);
  noCursor();

  wolf = new wolf();

  for (int m=0;m<o;m++)
  {
    owceX[m]= random(50, 330);
    owceY[m]= random(50, 450);
  }
}
void draw()
{
  background(156, 255, 97);
  wolf.move();
  wolf.display();
  image(shepherd, mouseX, mouseY, shepherd.width/2, shepherd.height/2);//pozycja owczrka
  //interakcja owiec z owczarkiem
  for (int m=0;m<o;m++)
  {
    float d= dist(owceX[m], owceY[m], mouseX, mouseY);
    if (d<80) { 
      owceX[m]= owceX[m]+random(-5, 2);
      owceY[m]= owceY[m]+random(-5, 5);
    }
    if (d<40) { 
      owceX[m]= owceX[m]+5;
      owceY[m]= owceY[m]+random(-5, 5);
      noFill();
      stroke(255); 
      ellipse(owceX[m], owceY[m], 100, 100);
    }
    //zachowanie owiec na krawedziach
    if (owceX[m]<=30) owceX[m]= owceX[m]+random(10, 30);
    if (owceX[m]>=400) owceX[m]= owceX[m]+random(0, 5);
    if (owceY[m]>=470) owceY[m]= owceY[m]+random(-5, 0);
    if (owceY[m]<=30) owceY[m]= owceY[m]+random(0, 5);
    //stworz owce i nadaj im ruch
    image(sheep, owceX[m], owceY[m], sheep.width/3, sheep.height/3);
    owceX[m]= owceX[m]+random(-1, 1);
    owceY[m]= owceY[m]+random(-1, 1);
    //interakcja owiec z wilkiem
    float d2= dist(owceX[m], owceY[m], wolf.x, wolf.y);
    if (d2<100) { 
      owceX[m]= owceX[m]+random(-8, 5);
      owceY[m]= owceY[m]+random(-8, 8);
    }
    if (d2<60) {
      noFill();
      owceX[m]= owceX[m]+random(-15, 12);
      owceY[m]= owceY[m]+random(-15, 15);
      fill(255);
      text("bee!", owceX[m], owceY[m]-20);
    }
    //interakcja owczarka z wilkiem
    float d3= dist(mouseX, mouseY, wolf.x, wolf.y);
    if (d3<40) {
      noFill();
      stroke(#7A89FF); 
      ellipse(wolf.x, wolf.y, 100, 100);
      fill(#7A89FF);
      text("Game Over!\n[click to restart]", 200, 250);
      cursor();   
      noLoop();
    }
  }
  stroke(#CCFFAD);
  fill(#CCFFAD, 100);
  rect(400, -3, 503, 506);
  fill(255);
  rotate(radians(90));
  text("farma", 250, -440);
}

class wolf {

  float x, y;
  float xspeed, yspeed;

  wolf() {
    x = random(20, 350);
    y = random(20, 480);
    xspeed = 10;
    yspeed = 10;
  }
  
  void move() {
    x += xspeed; // szybkosc x
    y += yspeed; // szybkosc y

    // Sprawdzaj krawedzie
    if (x >= 370 || x <= 20) {
      xspeed *= - 1;
    }
    if (y >= 480 || y <= 20) {
      yspeed *= - 1;
    }
  }
  // Narysuj wilka
  void display() {
    stroke(0);
    fill(0, 50);
    image(wolfimg, x, y, wolfimg.width/2.8, wolfimg.height/2.8);
  }
}
// Zresetuj gre
void mouseClicked() {
  loop();
  setup();
}



