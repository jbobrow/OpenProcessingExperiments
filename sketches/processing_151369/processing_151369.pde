

import ddf.minim.*;


// Global variables
float radius = 5.0;
int X, Y;
int nX, nY;
int delay = 30;
boolean coul = false;
float epaisseur = 4;
color couleur = 255;
float resetFond = 0;
int contour = 1;
boolean cercle = true;

float x1, y1;
float dim = 80.0;

Minim minim;
AudioPlayer player;



// Setup the Processing Canvas
void setup() {
  size( 900, 900 );
  strokeWeight( 80 );
  background(0);
  frameRate( 10);
  size (1000, 1000);
  strokeWeight(3);
  X = width /2;
  Y = height / 2;
  nX = X;
  nY = Y;
  minim = new Minim(this);
  player = minim.loadFile("badabada.mp3");
  player.play();
}


// Main draw loop
void draw() {
  //float radius =100;
  background(resetFond);
  stroke (couleur);
  strokeWeight(random(1, 8));
  float centX =500;
  float centY= 500;
  float x, y; 
  float lastx = -999;
  float lasty = -999;

  int increment = 30;
  float moove = random (-10, 30);

  beginShape();
  for (float ang = 0; ang <= 360; ang += increment) {
    float rad = radians (ang);
    //radius = radius + sin(frameCount);
    x = centX + (radius*cos(rad+0.5) + moove);
    y = centY + (radius*sin(rad+0.5)+ moove);
    //println(cercle);
    if (cercle == false) {
      if (lastx > -999) {
        //line(x+random(-10,+10), y+random(-10,+10), lastx, lasty);
        vertex(x+random(-radius/5, radius/5), y+random(-radius/5, radius/5));
        radius = radius + sin( frameCount  /15);
        println(radius);
        //fill(0, 121, 184);
      }
      lastx = x;
      lasty = y;
    }
    if (cercle == true) {
      if (lastx > -999) {
        //line(x+random(-10,+10), y+random(-10,+10), lastx, lasty);
        vertex(x, y);
        radius = radius + sin( frameCount  /15 );
        //fill(0, 121, 184);
      }
      lastx = x;
      lasty = y;
    }
  }
  endShape(CLOSE);


  // Track circle to new destination
  X+=(nX-X)/delay;
  Y+=(nY-Y)/delay;

  //fill( 0, 121, 184 );
  line(random(100, 1000), random(100, 1000), random(100, 1000), random(100, 1000));
}




// Fonction keyPressed pour changer le FrameRate
void keyPressed() {


  if (key == 'a') {  
    frameRate( 88);
  }
  if (key == 'z') {  
    frameRate( 88000);
  }
  if (key == 'e') {  
    frameRate(880);
  }
  if (key == 'r') {  
    frameRate(8.8);
  }

  if (key == 't') {
    cercle = !cercle;
  }
  if (key == 'y') {  
    frameRate(1);
  }
  if (key =='u') {
  }
  if (key=='i') {    
    couleur = changeCouleur(0, 255); 
    background (0);
  }
  if (key=='o') {    
    couleur = changeCouleur(0, 255);  
    background(random(0, 255));
  }
  if (key == 'p') {
    couleur = changeCouleur(0, 255);
  }

  if (key == 'p') {  
    ellipse(random(500, 500), random(500, 500), random(1, 1000), random(1, 1000));
    strokeWeight(+2);
    fill(random(150, 255), random(150, 255), random(150, 255), 0);
  }
  if (key == 'm') { 
    saveFrame("image_" + millis() + ".png");
  }
  if (key == 'q') { 
    coul = true;
  }
  if (key == 'w') {
    background(null);
  }

  if (key == 's') { 
    fill (random(150,255),random(0,40),random(0,70));
    stroke(100, 100, 100, 100);
  }
  if (key == 'k') {




    x1 = x1 + (random(-20, 20));

    if (x1 > width + dim) {
      x1 = -dim;
    } 

    strokeWeight(random(1, 50));
    strokeCap(PROJECT);
    translate(x1, dim);
    fill(0);
    line(150, 250, 150, 400);
    line(250, 250, 250, 400);
    line(350, 250, 350, 400);
    line(450, 250, 450, 400);
    line(550, 250, 550, 400);
    line(650, 320, 650, 400); 

    line(150, 250, 250, 250);
    line (150, 300, 250, 300);
    line(150, 400, 250, 400);
    line(350, 400, 450, 400);
    line(550, 400, 650, 400);
    line(550, 250, 650, 250);

    line(0, 0, 0, 800);
    line(0, 800, 800, 800);
    line(800, 800, 800, 0);
    line(0, 0, 800, 0);
    line(100, 450, 700, 450);
    line(100, 200, 700, 200);
  }

  // if (key == 'r') { Y = -height;}
  //if (key == 't') { X = -width;}
  // if (key == 'z') {translate(30, 20);
  // rect(0, 0, 55, 55);}
}
color changeCouleur(float min, float max) {
  color temp;
  temp = color(random(min, max), random(0, 100), random(0, 100));
  return temp;
}
void stop()
{
  // the AudioPlayer you got from Minim.loadFile()
  player.close();

  minim.stop();

  // this calls the stop method that 
  // you are overriding by defining your own
  // it must be called so that your application 
  // can do all the cleanup it would normally do
  super.stop();
}



