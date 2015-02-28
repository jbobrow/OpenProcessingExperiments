
int starCount = 2;
PFont font;

int[] x = new int[starCount];
int[] y = new int[starCount];
float[] speedX = new float[starCount];
float[] speedY = new float[starCount];
boolean[] hit = new boolean[starCount];

PImage galaxy;
PImage lose_card;
PImage win_card;

boolean launched = false;
int maxSpeed = 2;
int starRadius = 10;

boolean winner = false;
int score = 0;

//VOID-------------------------------------------
void setup() {
  size(500, 375);
  smooth();
  font = loadFont("Happy-HappyJoyJoy-30.vlw");
  textFont(font);
  
  galaxy = loadImage("CosmicScene.jpg");
  lose_card = loadImage("YOULOSE.png");
  win_card = loadImage("YAY.png");

  for (int i=0; i<starCount; i++) {
    x[i] = 250;
    y[i] = 250;
    hit[i] = false;
  }
}


void draw() {
  image(galaxy, 0, 0);

  //GAMEPLAY--------------------------------------
  int hitCount = 0;
  if (launched && (!winner) ) {
    for (int i=0; i<starCount; i++) {

      if (!hit[i]) {
        stroke(255);
        noFill();
        ellipse(x[i], y[i], starRadius*2, starRadius*2); 

        x[i] += speedX[i];
        y[i] += speedY[i];
        
        text(score, width-40, 40);

        if (x[i] > width || x[i] < 0 || y[i] > height || y[i] < 0) {
          //YOULOSE------------------------------
          println("YOU FAIL");
          image(lose_card,0,0);

        }
      } 
      else {
        hitCount++;
      }
    }
    if (hitCount == starCount) {
      winner = true;
      maxSpeed += 1;
      score +=1;
    }

  }
  if ( winner) {
    //YAY--------------------------------------
    println("YAY");
    image(win_card,0,0);
    launched = false;
//    maxSpeed += 1;
    winner = true;
    
    
  if(mousePressed) {
    winner = false;
    launched = false; }
  }
  //println("running" + winner);
}

void mousePressed() {
  for (int i=0; i<starCount; i++) {
    x[i] = 250;
    y[i] = 250;
    speedX[i] = random(-maxSpeed, maxSpeed);
    speedY[i] = random(-maxSpeed, maxSpeed); 
    hit[i] = false;
  }
  launched = true;
}

void mouseMoved() {
  for (int i=0; i<starCount; i++) {
    float d = dist(x[i], y[i], mouseX, mouseY);
    if (d < starRadius) {
      hit[i] = true;
    }
  }
}




