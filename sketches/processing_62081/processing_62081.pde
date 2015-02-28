
/*
Duck Hunt imitation created by Trevor Wong
 Credits to Nathan Smetana for helping me understand the removal of the image
 http://www.openprocessing.org/sketch/60307
 */


PImage duckImg;
PImage crosshair;
PImage bg;
PImage fun;

int numDucks = 15;
int score = 0;
int rounds = 3;

boolean gameover = false;
boolean hit = false;
boolean start = false;

float[] x = new float[numDucks];
float[] y = new float[numDucks];

ArrayList<Duck> dh = new ArrayList<Duck>();
Duck[] ducks;

void setup() {
  bg = loadImage("duck_hunt.jpg");
  duckImg = loadImage("Duck.jpg");
  crosshair = loadImage("Crosshair.jpg");
  fun = loadImage("face.jpg");

  size(1440, 900);
  frameRate(60);



  ducks = new Duck[numDucks];
  for (int i = 0; i < numDucks; i++) {
    Duck dk = new Duck(int(x[i]), int(y[i]));
    ducks[i] =
      new Duck(int(random(-1000)), int(random(height)));
    dh.add(ducks[i]);
    x[i] = random(width);
    y[i] = random(height);
  }
}



void mouseClicked() {
  //make a for loop to check each duck

  for (int i = dh.size()-1; i >= 0; i-- ) {
    //check if each duck is hit.
    //if ( ) {
    dh.remove(i);
    hitCheck();
    score++;
    println(score);
    //}
  }
}


void keyPressed() {
  if (key == ENTER && start == false) {
    start = true;
  }
}

void Menu() {
  background(0);
  fill(255);
  textSize(31.5);
  text("Press Enter to play", width/2-100, 400);
  if (keyPressed) {
    if ( key == ENTER ) {
      fill(255);
      textSize(31.5);
      text("Press Enter to play", width/2-100, 400);
    }
  }
}

void inGame() {
  fill(0);
  textSize(30);
  text("Score: " + score, width/2, 50);
} 

void Win() {
  if (dh.size() ==0) {
    textSize(50);
    image(fun, mouseX - fun.width/2, mouseY - fun.height/2);
    text("Winner", width/2-100, 300);
  }
}  

void Lose() {
  for (int i = 0; i < numDucks; i++) {
    if ( ducks[i].yLoc > 900) {
      textSize(50);
      text("Game Over", width/2-100, 300);
    }
  }
}

void draw() {
  if (start != true) {
    Menu();
  } 
  else {
    background(bg);
    inGame();
    Win();
    Lose();



    image(crosshair, mouseX - crosshair.width/2, mouseY - crosshair.height/2);
    noCursor();
    //make a for loop to check each duck

    //for each duck, draw it!
    for (int i = 0; i < numDucks; i++) {
      if (x[i] > width) {
        x[i] = random(width);
        y[i] = random(height);
      }
      point(x[i], y[i]);
    }

    for (int n = 0; n < ducks.length; n++) {

      if (ducks[n].hit()) {
        dh.remove(n);
        score++;
      }
    }

    println(duckImg.height);
    for (Duck d : dh) {
      d.render();
      d.xLoc += 3;

      if (mousePressed == true) {
        image(crosshair, mouseX - crosshair.width/2, mouseY - crosshair.height/2);
      }
    }
  }
}

void hitCheck() {
  for (int i = 0; i < dh.size(); i++) {
    if ( mouseX <= ducks[i].xLoc && mouseX >= ducks[i].xLoc && mouseY >= ducks[i].yLoc && mouseY <= ducks[i].yLoc) {
      ducks[i].xLoc= -2000;
      ducks[i].yLoc= -2000;
    }
  }
}

public class Duck {
  int xLoc, yLoc;
  boolean hit = false;
  public Duck  (int x, int y) {

    xLoc = x;
    yLoc = y;
  }


  public void render() {
    //paints itself @ (x,y)
    image(duckImg, xLoc, yLoc);
  }

  boolean getHit() {
    return hit;
  }

  boolean hit() {
    if ( hit ) {
      score++;
      numDucks--;
    }
    return false;
  }
}


