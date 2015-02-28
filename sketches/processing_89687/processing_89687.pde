
//import ddf.minim.spi.*;
//import ddf.minim.signals.*;
//import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
//import ddf.minim.effects.*;
//
//Minim minim;
//AudioPlayer song;
//AudioInput input;

float x;
float y;
float mx = 0;
float my = 0;
float easing = 0.09;
PFont niceFont;
PFont comicFont;

boolean clicked = false;
boolean playing = false;

int buttonX = 0;
int buttonY = 0;
int buttonW = 0;
int buttonH = 0;
int scaleFont = 48;

void setup() {
  size(600, 600);
  background(0);
  niceFont = createFont("Calibri", 48);
  comicFont = createFont("Comic Sans MS Bold", 48);

//  minim = new Minim(this);
//  song = minim.loadFile("BennyHill.mp3");
}

void draw() 
{ 
  if (!clicked) {
//    song.pause();
//    playing = false;

    background(0);

    buttonX = width/2;
    buttonY = height/2;
    buttonW = 250;
    buttonH = 48;

    float d = dist(width/2, height/2, mouseX, mouseY);
    float maxDist = dist(0, 0, width/2, height/2);
    float scale = map(d, 0, maxDist, 0, 48);
    scaleFont = int(scale);

    fill(255);
    textFont(niceFont, scaleFont);
    textAlign(CENTER);
    text("Comic Sans?", buttonX, buttonY);
    fill(255, 255, 255, 50);
    //rect(buttonX - buttonW/2, buttonY - buttonH/2, buttonW, buttonH);
  }

  if (clicked) {
//    if (!playing) {
//      song.play();
//      playing = true;
//    }

    int m = millis();
    background(m % 255, (m + 50) % 255, (m - 50) % 255 );
    //changes background

    float targetX = width - mouseX;
    float dx = targetX - x;
    if (abs(dx) > 1) {
      x += dx * easing;
    }

    float targetY = height - mouseY;
    float dy = targetY - y;
    if (abs(dy) > 1) {
      y += dy * easing;
    }

    mx = constrain(x, 10, 340);
    //contrains X position of box
    my = constrain(40, y, (height - 48));
    //constrain Y position of box
    fill(m % 255);
    textFont(comicFont, 48);
    text("Comic Sans!", mx, my);
    //avoid mouse according to constraints
  }
  println(clicked);
}

void mouseClicked() {
 if (!clicked) {
    if (mouseX > (buttonX-buttonW/2) && mouseX < (buttonX + buttonW/2)) {
      println("X hit");
      if (mouseY > (buttonY-buttonH/2) && mouseY < (buttonY + buttonH/2)) {
        clicked = true;
        println("Y hit");
      }
    }
  }
  else if (clicked) {
    if (mouseX > mx && mouseX < (mx + buttonW)) {
      if (mouseY < my && mouseY > (my - buttonH)) {
        clicked = false;
      }
    }
  }
}

//void stop() {
//  song.close();
//  minim.stop();
//
//  super.stop();
//}



